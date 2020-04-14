<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sch="http://www.ascc.net/xml/schematron" xmlns:cda="urn:hl7-org:v3" xmlns:ext="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="1.0" cda:dummy-for-xmlns="" ext:dummy-for-xmlns="" xs:dummy-for-xmlns="" xsi:dummy-for-xmlns="">
  <xsl:output method="xml" />
  <xsl:template match="*|@*" mode="schematron-get-full-path">
    <xsl:apply-templates select="parent::*" mode="schematron-get-full-path" />
    <xsl:text>/</xsl:text>
    <xsl:if test="count(. | ../@*) = count(../@*)">@</xsl:if>
    <xsl:value-of select="name()" />
    <xsl:text>[</xsl:text>
    <xsl:value-of select="1+count(preceding-sibling::*[name()=name(current())])" />
    <xsl:text>]</xsl:text>
  </xsl:template>
  <xsl:template match="/">
    <xsl:element name="Results">
      <xsl:attribute name="severity">#ALL</xsl:attribute>
      <xsl:apply-templates select="/" mode="M6" />
      <xsl:apply-templates select="/" mode="M7" />
      <xsl:apply-templates select="/" mode="M8" />
      <xsl:apply-templates select="/" mode="M9" />
      <xsl:apply-templates select="/" mode="M10" />
      <xsl:apply-templates select="/" mode="M11" />
      <xsl:apply-templates select="/" mode="M12" />
      <xsl:apply-templates select="/" mode="M13" />
      <xsl:apply-templates select="/" mode="M14" />
      <xsl:apply-templates select="/" mode="M15" />
      <xsl:apply-templates select="/" mode="M16" />
      <xsl:apply-templates select="/" mode="M17" />
      <xsl:apply-templates select="/" mode="M18" />
      <xsl:apply-templates select="/" mode="M19" />
      <xsl:apply-templates select="/" mode="M20" />
      <xsl:apply-templates select="/" mode="M21" />
      <xsl:apply-templates select="/" mode="M22" />
      <xsl:apply-templates select="/" mode="M23" />
      <xsl:apply-templates select="/" mode="M24" />
      <xsl:apply-templates select="/" mode="M25" />
      <xsl:apply-templates select="/" mode="M26" />
      <xsl:apply-templates select="/" mode="M27" />
      <xsl:apply-templates select="/" mode="M28" />
      <xsl:apply-templates select="/" mode="M29" />
      <xsl:apply-templates select="/" mode="M30" />
      <xsl:apply-templates select="/" mode="M31" />
      <xsl:apply-templates select="/" mode="M32" />
      <xsl:apply-templates select="/" mode="M33" />
      <xsl:apply-templates select="/" mode="M34" />
      <xsl:apply-templates select="/" mode="M35" />
      <xsl:apply-templates select="/" mode="M36" />
      <xsl:apply-templates select="/" mode="M37" />
      <xsl:apply-templates select="/" mode="M38" />
      <xsl:apply-templates select="/" mode="M39" />
      <xsl:apply-templates select="/" mode="M40" />
      <xsl:apply-templates select="/" mode="M41" />
      <xsl:apply-templates select="/" mode="M42" />
    </xsl:element>
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument" priority="4000" mode="M6">
    <xsl:choose>
      <xsl:when test="cda:author" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.1 Document Author - The 'Author' tag is missing. Refer to section 6.1.1 Document Author of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:author</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:author) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.1 Document Author - The 'author' tag shall appear only once. Refer to section 6.1.1 Document Author of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:author) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M6" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:author" priority="3999" mode="M6">
    <xsl:choose>
      <xsl:when test="cda:time" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record 6.1.1 Document Author - "Document Author / Participation Type" - The 'time' tag is missing. Refer to section 6.1.1 Document Author of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:time</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:time) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record 6.1.1 Document Author - "Document Author / Participation Period" - The 'time' tag shall appear only once. Refer to section 6.1.1 Document Author of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:time) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="(@typeCode) and normalize-space(@typeCode) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.1 Document Author - "Document Author / Participation Type" - The 'author' tag 'typeCode' attribute shall contain a value. Refer to section 6.1.1 Document Author of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">(@typeCode) and normalize-space(@typeCode) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="(@typeCode) and normalize-space(@typeCode) != '' and @typeCode != 'AUT'">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.1 Document Author - "Document Author / Participation Type" - The 'author' tag 'typeCode' attribute shall contain the value "AUT". Refer to section 6.1.1 Document Author of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">(@typeCode) and normalize-space(@typeCode) != '' and @typeCode != 'AUT'</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M6" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:author/cda:assignedAuthor" priority="3998" mode="M6">
    <xsl:choose>
      <xsl:when test="cda:code" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.1 Document Author - "Document Author / Role" - The 'code' tag is missing. Refer to section 8.1 code and 6.1.1 Document Author of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:code</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:code) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.1 Document Author - "Document Author / Role" - The 'code' tag shall appear only once. Refer to section 6.1.1 Document Author of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:code) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="cda:id" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.1 Document Author - Document Author - "author / assignedAuthor" - The 'id' tag is missing. Refer to section 6.1.1 Document Author of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:id</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:id) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.1 Document Author - "author / assignedAuthor" - The 'id' tag shall appear once only. Refer to section 6.1.1 Document Author of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:id) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="cda:assignedPerson" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.1 Document Author - Document Author - "Document Author / Participant" The 'assignedPerson' tag is missing. Refer to section 6.1.1 Document Author of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:assignedPerson</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:assignedPerson) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.1 Document Author - "Document Author / Participant" - The 'assignedPerson' tag - 'assignedPerson' tag shall appear only once. Refer to section 6.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:assignedPerson) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M6" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:assignedPerson" priority="3997" mode="M6">
    <xsl:choose>
      <xsl:when test="ext:asEntityIdentifier" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.1 Document Author - "Document Author / Participant / Entity Identifier" - The 'asEntityIdentifier' tag is missing. Refer to section 6.1.1 Document Author of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">ext:asEntityIdentifier</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="ext:asEntityIdentifier/ext:id[contains(@root, '1.2.36.1.2001.1003.0.800361') or contains(@root, '1.2.36.1.2001.1003.0.800360') ]" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.1 Document Author - "Document Author / Participant / Entity Identifier" - The 'HPI-I or IHI asEntityIdentifier' tag is missing. "The value of one Entity Identifier SHALL be an Australian HPI-I or IHI." although there could be multiple Entity Identifiers. Refer to section 6.1.1 and 8.4 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">ext:asEntityIdentifier/ext:id[contains(@root, '1.2.36.1.2001.1003.0.800361') or contains(@root, '1.2.36.1.2001.1003.0.800360') ]</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="cda:name" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.1 Document Author - "Document Author / Participant / Person or Organisation or Device / Person / Person Name - The 'name' tag is missing. Refer to section 6.1.1 Document Author in the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:name</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M6" />
  </xsl:template>
  <xsl:template match="text()" priority="-1" mode="M6" />
  <xsl:template match="/" priority="4000" mode="M7">
    <xsl:choose>
      <xsl:when test="cda:ClinicalDocument" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1 Clinical Document - The 'ClinicalDocument' tag is missing. Refer to section 5.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:ClinicalDocument</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:ClinicalDocument) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1 Clinical Document - The 'ClinicalDocument' tag shall appear only once. Refer to section 5.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:ClinicalDocument) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M7" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument" priority="3999" mode="M7">
    <xsl:choose>
      <xsl:when test="cda:typeId" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1 Clinical Document - The 'typeId' tag is missing. Refer to section 5.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:typeId</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:typeId) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1 Clinical Document - The 'typeId' tag shall appear only once. Refer to section 5.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:typeId) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="cda:templateId" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1 Clinical Document - The 'templateId' tag is missing. Refer to section 5.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:templateId</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="count(cda:templateId[@root = '1.2.36.1.2001.1001.101.100.1002.156' and @extension='1.0'])&gt;0" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1 Clinical Document - "ClinicalDocument / templateId" - The 'templateId' tag 'root' attribute shall contain the value "1.2.36.1.2001.1001.101.100.1002.156". If the 'root' value is '1.2.36.1.2001.1001.101.100.1002.156' then the 'extension' attribute shall contain the value '1.0'. Refer to section 5.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">count(cda:templateId[@root = '1.2.36.1.2001.1001.101.100.1002.156' and @extension='1.0'])&gt;0</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="count(cda:templateId[@root = '1.2.36.1.2001.1001.100.149' and @extension='1.0'])&gt;0" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1 Clinical Document - "ClinicalDocument / templateId" - The 'templateId' tag 'root' attribute shall contain the value "1.2.36.1.2001.1001.100.149" . If the 'root' value is '1.2.36.1.2001.1001.100.149' then the 'extension' attribute shall contain the value '1.0'. Refer to requirement CDA-RS 64 of the CDA_Rendering_Specification_Clinical_Documentation_v1.0 and section 1.8 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">count(cda:templateId[@root = '1.2.36.1.2001.1001.100.149' and @extension='1.0'])&gt;0</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="cda:id" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1 Clinical Document - The 'id' tag is missing. Refer to section 5.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:id</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:id) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1 Clinical Document - The 'id' tag shall appear only once. Refer to section 5.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:id) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="cda:code" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1 Clinical Document - The 'code' tag is missing. Refer to section 5.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:code</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:code) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1 Clinical Document - The 'code' tag shall appear only once. Refer to section 5.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:code) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="cda:effectiveTime" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1 Clinical Document - The 'effectiveTime' tag is missing. Refer to section 5.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:effectiveTime</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:effectiveTime) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1 Clinical Document - The 'effectiveTime' tag shall appear only once. Refer to section 5.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:effectiveTime) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="cda:confidentialityCode" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1 Clinical Document - The 'confidentialityCode' tag is missing. Refer to section 5.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:confidentialityCode</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:confidentialityCode) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1 Clinical Document - The 'confidentialityCode' tag shall appear only once. Refer to section 5.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:confidentialityCode) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(cda:languageCode) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1 Clinical Document - The 'languageCode' tag shall appear only once. Refer to section 5.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:languageCode) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(cda:versionNumber) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1 Clinical Document - The 'versionNumber' tag shall appear only once. Refer to section 5.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:versionNumber) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="ext:completionCode" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1 Clinical Document - The 'completionCode' tag is missing. Refer to section 5.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">ext:completionCode</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(ext:completionCode) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1 Clinical Document - The 'completionCode' tag shall appear only once. Refer to section 5.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(ext:completionCode) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M7" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:typeId" priority="3998" mode="M7">
    <xsl:choose>
      <xsl:when test="@root = '2.16.840.1.113883.1.3'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1 Clinical Document - The 'typeId' tag 'root' attribute shall be "2.16.840.1.113883.1.3". Refer to section 5.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@root = '2.16.840.1.113883.1.3'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="@extension = 'POCD_HD000040'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1 Clinical Document - The 'typeId' tag 'extension' attribute shall contain the value "POCD_HD000040". Refer to section 5.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@extension = 'POCD_HD000040'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="@nullFlavor and normalize-space(@nullFlavor) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1 Clinical Document - "ClinicalDocument / typeId" - The 'typeId' tag 'nullFlavor' attribute shall contain a value. Refer to section 5.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@nullFlavor and normalize-space(@nullFlavor) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="@assigningScopingEntity and normalize-space(@assigningScopingEntity) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1 Clinical Document - "ClinicalDocument / typeId" - The 'typeId' tag 'assigningScopingEntity' attribute shall contain a value. Refer to section 5.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@assigningScopingEntity and normalize-space(@assigningScopingEntity) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M7" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:templateId" priority="3997" mode="M7">
    <xsl:if test="@root and normalize-space(@root) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1 Clinical Document - "ClinicalDocument / templateId" - The 'templateId' tag 'root' attribute shall contain a value. Refer to section 5.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@root and normalize-space(@root) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="@extension and normalize-space(@extension) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1 Clinical Document - "ClinicalDocument / templateId" - The 'templateId' tag 'extension' attribute shall contain a value. Refer to section 5.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@extension and normalize-space(@extension) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="@nullFlavor and normalize-space(@nullFlavor) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1 Clinical Document - "ClinicalDocument / templateId" - The 'templateId' tag 'nullFlavor' attribute shall contain a value. Refer to section 5.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@nullFlavor and normalize-space(@nullFlavor) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="@assigningScopingEntity and normalize-space(@assigningScopingEntity) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1 Clinical Document - "ClinicalDocument / templateId" - The 'templateId' tag 'assigningScopingEntity' attribute shall contain a value. Refer to section 5.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@assigningScopingEntity and normalize-space(@assigningScopingEntity) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M7" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:code" priority="3996" mode="M7">
    <xsl:choose>
      <xsl:when test="@code = '100.16696'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1 Clinical Document - The 'code' tag 'code' attribute shall contain the value "100.16696". Refer to section 5.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@code = '100.16696'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="@codeSystem = '1.2.36.1.2001.1001.101'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1 Clinical Document - The 'code' tag 'codeSystem' attribute shall be '1.2.36.1.2001.1001.101'. Refer to section 5.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@codeSystem = '1.2.36.1.2001.1001.101'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="translate(@codeSystemName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'NCTIS DATA COMPONENTS'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1 Clinical Document - The 'code' tag 'codeSystemName' attribute shall contain the value 'NCTIS Data Components'. Refer to section 5.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">translate(@codeSystemName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'NCTIS DATA COMPONENTS'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'ADVANCE CARE DIRECTIVE CUSTODIAN RECORD'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1 Clinical Document -The 'code' tag 'displayName' attribute shall contain the value "Advanced Care Directive Custodian Record". Refer to section 5.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'ADVANCE CARE DIRECTIVE CUSTODIAN RECORD'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M7" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:confidentialityCode" priority="3995" mode="M7">
    <xsl:choose>
      <xsl:when test="@nullFlavor = 'NA'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1 Clinical Document - "ClinicalDocument/confidentialityCode" - The 'confidentialityCode' tag 'nullFlavor' attribute shall contain the value "NA". Refer to section 5.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@nullFlavor = 'NA'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M7" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:languageCode" priority="3994" mode="M7">
    <xsl:choose>
      <xsl:when test="normalize-space(@code) != ''" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1 Clinical Document - "ClinicalDocument / languageCode" - The 'languageCode' tag 'code' attribute shall contain a value in the format 'LanguageCode-COUNTRYCODE' as per 'RFC3066' . Refer to section 5.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">normalize-space(@code) != ''</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M7" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:versionNumber" priority="3993" mode="M7">
    <xsl:choose>
      <xsl:when test="normalize-space(@value) != ''" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1 Clinical Document - "ClinicalDocument / versionNumber" - The 'versionNumber' tag 'value' attribute shall be an integer value. Refer to section 5.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">normalize-space(@value) != ''</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="floor(@value) = number(@value)" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1 Clinical Document - "ClinicalDocument / versionNumber" - The 'versionNumber' tag 'value' attribute shall be an integer value. Refer to section 5.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">floor(@value) = number(@value)</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M7" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/ext:completionCode" priority="3992" mode="M7">
    <xsl:choose>
      <xsl:when test="document('CDAValidate_Vocabs.xml')/systems/system                 [@codeSystemName = 'NCTIS_Document_Status_Values']/code[(@code = (current()/@code))]" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1 Clinical Document - "ClinicalDocument / ext:completionCode" - The 'code' attribute shall be as per 10.13 NCTIS: Admin Codes - Document Status. Refer to section 5.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">document('CDAValidate_Vocabs.xml')/systems/system                 [@codeSystemName = 'NCTIS_Document_Status_Values']/code[(@code = (current()/@code))]</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="@codeSystem = '1.2.36.1.2001.1001.101.104.20104'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1 Clinical Document - "ClinicalDocument / ext:completionCode" - The 'codeSystem' attribute shall contain the value "1.2.35.1.2001.1001.101.104.20104". Refer to section 5.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@codeSystem = '1.2.36.1.2001.1001.101.104.20104'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="translate(@codeSystemName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')                  = 'NCTIS DOCUMENT STATUS VALUES'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1 Clinical Document - "ClinicalDocument / ext:completionCode" - The 'codeSystemName' attribute shall contain the value "NCTIS Document Status Values". Refer to section 5.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">translate(@codeSystemName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')                  = 'NCTIS DOCUMENT STATUS VALUES'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="document('CDAValidate_Vocabs.xml')/systems/system                 [@codeSystemName = 'NCTIS_Document_Status_Values']/code[(translate(@displayName,  'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = (translate(current()/@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')))]" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1 Clinical Document - "ClinicalDocument / ext:completionCode" - The 'displayName' attribute shall be as per 10.13 NCTIS: Admin Codes - Document Status. Refer to section 5.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">document('CDAValidate_Vocabs.xml')/systems/system                 [@codeSystemName = 'NCTIS_Document_Status_Values']/code[(translate(@displayName,  'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = (translate(current()/@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')))]</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="@code = substring(@displayName,1,1)" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1 Clinical Document - "ClinicalDocument / ext:completionCode" - The 'code' and 'displayName' attributes shall match as per 10.13 NCTIS: Admin Codes - Document Status. Refer to section 5.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@code = substring(@displayName,1,1)</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M7" />
  </xsl:template>
  <xsl:template match="text()" priority="-1" mode="M7" />
  <xsl:template match="/cda:ClinicalDocument" priority="4000" mode="M8">
    <xsl:choose>
      <xsl:when test="cda:custodian" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1.2 Custodian - The 'custodian' tag is missing. Refer to section 5.1.2 Custodian of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:custodian</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:custodian) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1.2 Custodian - The 'custodian' tag shall appear only once. Refer to section 5.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:custodian) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M8" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:custodian" priority="3999" mode="M8">
    <xsl:choose>
      <xsl:when test="cda:assignedCustodian" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1.2 Custodian - "assignedCustodian" - The 'assigned Custodian' tag is missing. Refer to section 5.1.2 Custodian of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:assignedCustodian</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:assignedCustodian) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1.2 Custodian - "assignedCustodian" - The 'assignedCustodian' tag shall appear only once. Refer to section 5.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:assignedCustodian) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M8" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:custodian/cda:assignedCustodian" priority="3998" mode="M8">
    <xsl:choose>
      <xsl:when test="cda:representedCustodianOrganization" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1.2 Custodian - "assignedCustodian/representedCustodianOrganization" - The 'representedCustodianOrganization' tag is missing. Refer to section 5.1.2 Custodian of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:representedCustodianOrganization</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:representedCustodianOrganization) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1.2 Custodian - "assignedCustodian/representedCustodianOrganization"- The 'representedCustodianOrganization' tag shall appear only once. Refer to section 5.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:representedCustodianOrganization) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M8" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization" priority="3997" mode="M8">
    <xsl:choose>
      <xsl:when test="cda:id" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1.2 Custodian - "assignedCustodian/representedCustodianOrganization/Entity Identifier" - The 'id' tag is missing. Refer to section 8.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:id</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:name) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1.2 Custodian - "assignedCustodian/representedCustodianOrganization/Name" - The 'name' tag shall appear only once. Refer to section 5.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:name) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="cda:name and normalize-space(cda:name) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1.2 Custodian - "assignedCustodian/representedCustodianOrganization/Name" - The 'name' tag shall contain a value. Refer to section 5.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">cda:name and normalize-space(cda:name) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(cda:telecom) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1.2 Custodian - "custodian / assignedCustodian / representedCustodianOrganization / Electronic Communication Detail" - The 'telecom' tag shall appear only once. Refer to section 5.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:telecom) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(cda:addr) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1.2 Custodian - "custodian / assignedCustodian / representedCustodianOrganization / Address" - The 'addr' tag shall appear only once. Refer to section 5.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:addr) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M8" />
  </xsl:template>
  <xsl:template match="text()" priority="-1" mode="M8" />
  <xsl:template match="cda:value[@xsi:type='BL']" priority="4000" mode="M9">
    <xsl:choose>
      <xsl:when test="@value" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for value datatype - The 'value' tag 'value' attribute is missing. Check all 'cda:value' tag with 'xsi:type=BL' attribute to find the missing 'value' attribute. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@value</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="not(@value) or normalize-space(@value) != ''" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for value datatype - The 'value' tag 'value' attribute shall contain a value. Check all 'cda:value' tag with 'xsi:type=BL' attribute to find the 'value' attribute of missing value. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">not(@value) or normalize-space(@value) != ''</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value) or                 normalize-space(@value) = '' or                 @value = 'true' or                 @value = 'false'                 " />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for value datatype - The 'value' tag 'value' attribute shall contain the value 'true' or 'false'. Check all 'cda:value' tag with 'xsi:type=BL' attribute to find the 'value' attribute of incorrect value. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value) or                 normalize-space(@value) = '' or                 @value = 'true' or                 @value = 'false'                 </xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M9" />
  </xsl:template>
  <xsl:template match="cda:value[@xsi:type='CD']" priority="3999" mode="M9">
    <xsl:if test="cda:originalText and normalize-space(cda:originalText) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "cda:value/cda:originalText" - The 'originalText' tag shall contain a value. Check all 'cda:value/cda:originalText' tags to find the missing text. Refer to section 8.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">cda:originalText and normalize-space(cda:originalText) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(cda:originalText) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "cda:value/cda:originalText" - The 'originalText' tag shall appear only once. Check all 'cda:value/cda:originalText' tags to find the duplicate text. Refer to section 8.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:originalText) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="                 cda:originalText or (@code and @codeSystem) or @nullFlavor" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "cda:value/@code" attribute - The 'value' tag shall have 'originalText' or 'code and codeSystem' or 'nullFlavor' attributes. Check all 'cda:value' tags to find the missing tag or attribute. Refer to section 8.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 cda:originalText or (@code and @codeSystem) or @nullFlavor</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="@nullFlavor and normalize-space(@nullFlavor) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "cda:value/@nullFlavor" attribute - The 'value' tag 'nullFlavor' attribute shall contain a value. Check all 'cda:value' tags 'nullFlavor' attributes to find the missing value. Refer to section 8.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@nullFlavor and normalize-space(@nullFlavor) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="@code and normalize-space(@code) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "cda:value/@code" attribute - The 'value' tag 'code' attribute shall contain a value. Check all 'cda:value' tags 'code' attributes to find the missing value. Refer to section 8.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@code and normalize-space(@code) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="@codeSystem and normalize-space(@codeSystem) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "cda:value/@codeSystem" attribute - The 'value' tag 'codeSystem' attribute shall contain a value. Check all 'cda:value' tags 'codeSystem' attributes to find the missing value. Refer to section 8.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@codeSystem and normalize-space(@codeSystem) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="@codeSystemName and normalize-space(@codeSystemName) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "cda:value/@codeSystemName" attribute - The 'value' tag 'codeSystemName' attribute shall contain a value. Check all 'cda:value' tags 'codeSystemName' attributes to find the missing value. Refer to section 8.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@codeSystemName and normalize-space(@codeSystemName) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="@displayName and normalize-space(@displayName) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "cda:value/@displayName" attribute - The 'value' tag 'displayName' attribute shall contain a value. Check all 'cda:value' tags 'displayName' attributes to find the missing value. Refer to section 8.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@displayName and normalize-space(@displayName) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M9" />
  </xsl:template>
  <xsl:template match="cda:value[@xsi:type='CD']/cda:translation" priority="3998" mode="M9">
    <xsl:choose>
      <xsl:when test="@code and @codeSystem or (@nullFlavor='OTH' and @codeSystem)" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "cda:value/cda:translation" attributes - The 'translation' tag shall have 'value' and 'codeSystem' attributes. Check all 'cda:value/cda:translation' tags to find the missing tag or attribute. Refer to section 8.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@code and @codeSystem or (@nullFlavor='OTH' and @codeSystem)</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="@nullFlavor and normalize-space(@nullFlavor) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "cda:value/cda:translation/@nullFlavor" attribute - The 'translation' tag 'nullFlavor' attribute shall contain a value. Check all 'cda:value/cda:translation' tags 'nullFlavor' attributes to find the missing value. Refer to section 8.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@nullFlavor and normalize-space(@nullFlavor) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="@code and normalize-space(@code) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "cda:value/cda:translation/@code" attribute - The 'translation' tag 'code' attribute shall contain a value. Check all 'cda:value/cda:translation' tags 'code' attributes to find the missing value. Refer to section 8.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@code and normalize-space(@code) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="@codeSystem and normalize-space(@codeSystem) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "cda:value/cda:translation/@codeSystem" attribute - The 'translation' tag 'codeSystem' attribute shall contain a value. Check all 'cda:value/cda:translation' tags 'codeSystem' attributes to find the missing value. Refer to section 8.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@codeSystem and normalize-space(@codeSystem) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="@codeSystemName and normalize-space(@codeSystemName) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "cda:value/cda:translation/@codeSystemName" attribute - The 'translation' tag 'codeSystemName' attribute shall contain a value. Check all 'cda:value/cda:translation' tags 'codeSystemName' attributes to find the missing value. Refer to section 8.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@codeSystemName and normalize-space(@codeSystemName) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="@displayName and normalize-space(@displayName) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "cda:value/cda:translation/@displayName" attribute - The 'translation' tag 'displayName' attribute shall contain a value. Check all 'cda:value/cda:translation' tags 'displayName' attributes to find the missing value. Refer to section 8.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@displayName and normalize-space(@displayName) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M9" />
  </xsl:template>
  <xsl:template match="cda:value[@xsi:type='CS']" priority="3997" mode="M9">
    <xsl:choose>
      <xsl:when test="@code" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for value datatype - The 'value' tag 'code' attribute is missing. Check all 'cda:value' tag with 'xsi:type=CS' attribute to find the missing 'code' attribute. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@code</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="not(@code) or normalize-space(@code) != ''" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for value datatype - The 'value' tag 'code' attribute shall contain a value. Check all 'cda:value' tag with 'xsi:type=CS' attribute to find the 'code' attribute of missing value. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">not(@code) or normalize-space(@code) != ''</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M9" />
  </xsl:template>
  <xsl:template match="cda:value[@xsi:type='INT']" priority="3996" mode="M9">
    <xsl:choose>
      <xsl:when test="@value" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for value datatype - The 'value' tag 'value' attribute is missing. Check all 'cda:value' tag with 'xsi:type=INT' attribute to find the missing 'value' attribute. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@value</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="not(@value) or normalize-space(@value) != ''" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for value datatype - The 'value' tag 'value' attribute shall contain a value. Check all 'cda:value' tag with 'xsi:type=INT' attribute to find the 'value' attribute of missing value. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">not(@value) or normalize-space(@value) != ''</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M9" />
  </xsl:template>
  <xsl:template match="cda:value[@xsi:type='PQ']" priority="3995" mode="M9">
    <xsl:choose>
      <xsl:when test="@value" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for value datatype - The 'value' tag 'value' attribute is missing. Check all 'cda:value' tag with 'xsi:type=PQ' attribute to find the missing 'value' attribute. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@value</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="not(@value) or normalize-space(@value) != ''" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for value datatype - The 'value' tag 'value' attribute shall contain a value. Check all 'cda:value' tag with 'xsi:type=PQ' attribute to find the 'value' attribute of missing value. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">not(@value) or normalize-space(@value) != ''</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="@unit and normalize-space(@unit) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for value datatype - The 'value' tag 'unit' attribute shall contain a value. Check all 'cda:value' tag with 'xsi:type=CS' attribute to find the 'unit' attribute of missing value. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@unit and normalize-space(@unit) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M9" />
  </xsl:template>
  <xsl:template match="cda:value[@xsi:type='PIVL_TS' or @xsi:type='IVL_TS' or @xsitype='TS']" priority="3994" mode="M9">
    <xsl:choose>
      <xsl:when test="                 @value or cda:low or cda:high or cda:width or cda:frequency or                 @nullFlavor" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for value datatype - The 'value' tag shall have 'value' or 'nullFlavor' attribute or 'low' or 'high' or 'centre' or 'width' child tags. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the missing tag or attribute. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 @value or cda:low or cda:high or cda:width or cda:frequency or                 @nullFlavor</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="@nullFlavor and normalize-space(@nullFlavor) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for value datatype - The 'value' tag 'nullFlavor' attribute shall contain a value. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the 'nullFlavor' attribute of missing value. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@nullFlavor and normalize-space(@nullFlavor) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="@value and normalize-space(@value) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for value datatype - The 'value' tag 'value' attribute shall contain a value. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the 'value' attribute of missing value. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@value and normalize-space(@value) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="                 @value                      and                 string-length(@value) &gt; 8   and                 not(contains(@value,'+'))   and not(contains(@value,'-'))">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for value datatype - The 'value' tag 'value' attribute shall contain a timezone value. "Any time that is more specific than a day SHALL include a timezone". Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the 'value' attribute of incorrect value. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 @value                      and                 string-length(@value) &gt; 8   and                 not(contains(@value,'+'))   and not(contains(@value,'-'))</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 not(contains(@value,'.'))    or                 ((string(number(substring-before(@value,'.'))) != string(number(@value))) and                 (string-length(substring-before(@value,'.')) = 14))" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "value" tag - Incorrect DateTime - The 'value' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the 'value' attribute of incorrect value. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 not(contains(@value,'.'))    or                 ((string(number(substring-before(@value,'.'))) != string(number(@value))) and                 (string-length(substring-before(@value,'.')) = 14))</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 not(contains(@value,'+'))    or                 not(contains(@value,'.'))    or                 ((string(number(substring-before(substring-after(@value,'.'),'+'))) != string(number(@value))) and                 (string-length(substring-before(substring-after(@value,'.'),'+')) = 4))" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "value" tag - Incorrect fraction of second - The 'value' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the 'value' attribute of incorrect value. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 not(contains(@value,'+'))    or                 not(contains(@value,'.'))    or                 ((string(number(substring-before(substring-after(@value,'.'),'+'))) != string(number(@value))) and                 (string-length(substring-before(substring-after(@value,'.'),'+')) = 4))</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 not(contains(@value,'-'))    or                 not(contains(@value,'.'))    or                 ((string(number(substring-before(substring-after(@value,'.'),'-'))) != string(number(@value))) and                 (string-length(substring-before(substring-after(@value,'.'),'-')) = 4))" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "value" tag - Incorrect fraction of second - The 'value' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the 'value' attribute of incorrect value. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 not(contains(@value,'-'))    or                 not(contains(@value,'.'))    or                 ((string(number(substring-before(substring-after(@value,'.'),'-'))) != string(number(@value))) and                 (string-length(substring-before(substring-after(@value,'.'),'-')) = 4))</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 contains(@value,'.')         or                 not(contains(@value,'+'))    or                 ((string(number(substring-before(@value,'+'))) != string(number(@value))) and                 (string-length(substring-before(@value,'+')) &gt; 11) and                 (string-length(substring-before(@value,'+')) &lt; 15) and                 (string-length(substring-before(@value,'+')) mod 2 = 0))" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "value" tag - Incorrect DateTime - The 'value' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the 'value' attribute of incorrect value. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 contains(@value,'.')         or                 not(contains(@value,'+'))    or                 ((string(number(substring-before(@value,'+'))) != string(number(@value))) and                 (string-length(substring-before(@value,'+')) &gt; 11) and                 (string-length(substring-before(@value,'+')) &lt; 15) and                 (string-length(substring-before(@value,'+')) mod 2 = 0))</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 contains(@value,'.')         or                 not(contains(@value,'-'))    or                 ((string(number(substring-before(@value,'-'))) != string(number(@value))) and                 (string-length(substring-before(@value,'-')) &gt; 11) and                 (string-length(substring-before(@value,'-')) &lt; 15) and                 (string-length(substring-before(@value,'-')) mod 2 = 0))" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "value" tag - Incorrect DateTime - The 'value' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the 'value' attribute of incorrect value. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 contains(@value,'.')         or                 not(contains(@value,'-'))    or                 ((string(number(substring-before(@value,'-'))) != string(number(@value))) and                 (string-length(substring-before(@value,'-')) &gt; 11) and                 (string-length(substring-before(@value,'-')) &lt; 15) and                 (string-length(substring-before(@value,'-')) mod 2 = 0))</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 not(contains(@value,'+'))    or                 ((string(number(substring-after(@value,'+'))) != string(number(@value))) and                 ((string-length(substring-after(@value,'+')) = 2) or (string-length(substring-after(@value,'+')) = 4)))" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "value" tag - Incorrect TimeZone - The 'value' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the 'value' attribute of incorrect value. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 not(contains(@value,'+'))    or                 ((string(number(substring-after(@value,'+'))) != string(number(@value))) and                 ((string-length(substring-after(@value,'+')) = 2) or (string-length(substring-after(@value,'+')) = 4)))</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 not(contains(@value,'-'))    or                 ((string(number(substring-after(@value,'-'))) != string(number(@value))) and                 ((string-length(substring-after(@value,'-')) = 2) or (string-length(substring-after(@value,'-')) = 4)))" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "value" tag - Incorrect TimeZone - The 'value' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the 'value' attribute of incorrect value. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 not(contains(@value,'-'))    or                 ((string(number(substring-after(@value,'-'))) != string(number(@value))) and                 ((string-length(substring-after(@value,'-')) = 2) or (string-length(substring-after(@value,'-')) = 4)))</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 contains(@value,'.')         or                 contains(@value,'+')         or                 contains(@value,'-')         or                 ((string(number(@value)) != string(number('a'))) and                 (string-length(@value) &gt;= 4))" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "value" tag - Incorrect DateTime - The 'value' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the 'value' attribute of incorrect value. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 contains(@value,'.')         or                 contains(@value,'+')         or                 contains(@value,'-')         or                 ((string(number(@value)) != string(number('a'))) and                 (string-length(@value) &gt;= 4))</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 ((number(substring(@value,1,2)) &gt;= 19) and                 (number(substring(@value,1,2)) &lt; 21))                 " />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "value" tag - Incorrect Year - The 'value' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the 'value' attribute of incorrect value. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 ((number(substring(@value,1,2)) &gt;= 19) and                 (number(substring(@value,1,2)) &lt; 21))                 </xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 string-length(@value) &lt; 5 or                 ((number(substring(@value,5,2)) &gt;= 1) and                 (number(substring(@value,5,2)) &lt; 13))                 " />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "value" tag - Incorrect Month - The 'value' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the 'value' attribute of incorrect value. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 string-length(@value) &lt; 5 or                 ((number(substring(@value,5,2)) &gt;= 1) and                 (number(substring(@value,5,2)) &lt; 13))                 </xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                           or                 normalize-space(@value) = ''          or                 string-length(@value) &lt; 7          or                 number(substring(@value,5,2)) = 2     or                 number(substring(@value,5,2)) = 4     or                 number(substring(@value,5,2)) = 6     or                 number(substring(@value,5,2)) = 9     or                 number(substring(@value,5,2)) = 11    or                 number(substring(@value,5,2)) &gt; 12    or                 ((number(substring(@value,7,2)) &gt;= 1) and                 (number(substring(@value,7,2)) &lt; 32))                 " />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "value" tag - Incorrect Date - The 'value' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the 'value' attribute of incorrect value. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                           or                 normalize-space(@value) = ''          or                 string-length(@value) &lt; 7          or                 number(substring(@value,5,2)) = 2     or                 number(substring(@value,5,2)) = 4     or                 number(substring(@value,5,2)) = 6     or                 number(substring(@value,5,2)) = 9     or                 number(substring(@value,5,2)) = 11    or                 number(substring(@value,5,2)) &gt; 12    or                 ((number(substring(@value,7,2)) &gt;= 1) and                 (number(substring(@value,7,2)) &lt; 32))                 </xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                           or                 normalize-space(@value) = ''          or                 string-length(@value) &lt; 7          or                 number(substring(@value,5,2)) = 1     or                 number(substring(@value,5,2)) = 2     or                 number(substring(@value,5,2)) = 3     or                 number(substring(@value,5,2)) = 5     or                 number(substring(@value,5,2)) = 7     or                 number(substring(@value,5,2)) = 8     or                 number(substring(@value,5,2)) = 10    or                 number(substring(@value,5,2)) = 12    or                 number(substring(@value,5,2)) &gt; 12    or                 ((number(substring(@value,7,2)) &gt;= 1) and                 (number(substring(@value,7,2)) &lt; 31))                 " />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "value" tag - Incorrect Month - The 'value' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the 'value' attribute of incorrect value. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                           or                 normalize-space(@value) = ''          or                 string-length(@value) &lt; 7          or                 number(substring(@value,5,2)) = 1     or                 number(substring(@value,5,2)) = 2     or                 number(substring(@value,5,2)) = 3     or                 number(substring(@value,5,2)) = 5     or                 number(substring(@value,5,2)) = 7     or                 number(substring(@value,5,2)) = 8     or                 number(substring(@value,5,2)) = 10    or                 number(substring(@value,5,2)) = 12    or                 number(substring(@value,5,2)) &gt; 12    or                 ((number(substring(@value,7,2)) &gt;= 1) and                 (number(substring(@value,7,2)) &lt; 31))                 </xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                           or                 normalize-space(@value) = ''          or                 string-length(@value) &lt; 7          or                 number(substring(@value,5,2)) = 1     or                 number(substring(@value,5,2)) = 3     or                 number(substring(@value,5,2)) = 4     or                 number(substring(@value,5,2)) = 5     or                 number(substring(@value,5,2)) = 6     or                 number(substring(@value,5,2)) = 7     or                 number(substring(@value,5,2)) = 8     or                 number(substring(@value,5,2)) = 9     or                 number(substring(@value,5,2)) = 10    or                 number(substring(@value,5,2)) = 11    or                 number(substring(@value,5,2)) = 12    or                 number(substring(@value,5,2)) &gt; 12    or                 (number(substring(@value,1,4)) mod 4) != 0 or                 ((number(substring(@value,7,2)) &gt;= 1) and                 (number(substring(@value,7,2)) &lt; 30))                 " />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "value" tag - Incorrect Date - The 'value' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the 'value' attribute of incorrect value. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                           or                 normalize-space(@value) = ''          or                 string-length(@value) &lt; 7          or                 number(substring(@value,5,2)) = 1     or                 number(substring(@value,5,2)) = 3     or                 number(substring(@value,5,2)) = 4     or                 number(substring(@value,5,2)) = 5     or                 number(substring(@value,5,2)) = 6     or                 number(substring(@value,5,2)) = 7     or                 number(substring(@value,5,2)) = 8     or                 number(substring(@value,5,2)) = 9     or                 number(substring(@value,5,2)) = 10    or                 number(substring(@value,5,2)) = 11    or                 number(substring(@value,5,2)) = 12    or                 number(substring(@value,5,2)) &gt; 12    or                 (number(substring(@value,1,4)) mod 4) != 0 or                 ((number(substring(@value,7,2)) &gt;= 1) and                 (number(substring(@value,7,2)) &lt; 30))                 </xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                           or                 normalize-space(@value) = ''          or                 string-length(@value) &lt; 7          or                 number(substring(@value,5,2)) = 1     or                 number(substring(@value,5,2)) = 3     or                 number(substring(@value,5,2)) = 4     or                 number(substring(@value,5,2)) = 5     or                 number(substring(@value,5,2)) = 6     or                 number(substring(@value,5,2)) = 7     or                 number(substring(@value,5,2)) = 8     or                 number(substring(@value,5,2)) = 9     or                 number(substring(@value,5,2)) = 10    or                 number(substring(@value,5,2)) = 11    or                 number(substring(@value,5,2)) = 12    or                 number(substring(@value,5,2)) &gt; 12    or                 (number(substring(@value,1,4)) mod 4) = 0 or                 ((number(substring(@value,7,2)) &gt;= 1) and                 (number(substring(@value,7,2)) &lt; 29))                 " />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "value" tag - Incorrect Date - The 'value' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the 'value' attribute of incorrect value. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                           or                 normalize-space(@value) = ''          or                 string-length(@value) &lt; 7          or                 number(substring(@value,5,2)) = 1     or                 number(substring(@value,5,2)) = 3     or                 number(substring(@value,5,2)) = 4     or                 number(substring(@value,5,2)) = 5     or                 number(substring(@value,5,2)) = 6     or                 number(substring(@value,5,2)) = 7     or                 number(substring(@value,5,2)) = 8     or                 number(substring(@value,5,2)) = 9     or                 number(substring(@value,5,2)) = 10    or                 number(substring(@value,5,2)) = 11    or                 number(substring(@value,5,2)) = 12    or                 number(substring(@value,5,2)) &gt; 12    or                 (number(substring(@value,1,4)) mod 4) = 0 or                 ((number(substring(@value,7,2)) &gt;= 1) and                 (number(substring(@value,7,2)) &lt; 29))                 </xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 string-length(substring-before(translate(@value, '-', '+'),'+')) &lt; 9 or                 ((number(substring(@value,9,2)) &gt;= 0) and                 (number(substring(@value,9,2)) &lt; 24))                 " />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "value" tag - Incorrect Hour - The 'value' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the 'value' attribute of incorrect value. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 string-length(substring-before(translate(@value, '-', '+'),'+')) &lt; 9 or                 ((number(substring(@value,9,2)) &gt;= 0) and                 (number(substring(@value,9,2)) &lt; 24))                 </xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 string-length(substring-before(translate(@value, '-', '+'),'+')) &lt; 11 or                 ((number(substring(@value,11,2)) &gt;= 0) and                 (number(substring(@value,11,2)) &lt; 60))                 " />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "value" tag - Incorrect Minute - The 'value' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the 'value' attribute of incorrect value. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 string-length(substring-before(translate(@value, '-', '+'),'+')) &lt; 11 or                 ((number(substring(@value,11,2)) &gt;= 0) and                 (number(substring(@value,11,2)) &lt; 60))                 </xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 string-length(substring-before(translate(@value, '-', '+'),'+')) &lt; 13 or                 ((number(substring(@value,13,2)) &gt;= 0) and                 (number(substring(@value,13,2)) &lt; 60))                 " />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "value" tag - Incorrect Second - The 'value' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the 'value' attribute of incorrect value. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 string-length(substring-before(translate(@value, '-', '+'),'+')) &lt; 13 or                 ((number(substring(@value,13,2)) &gt;= 0) and                 (number(substring(@value,13,2)) &lt; 60))                 </xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:low) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "value" tag - The 'low' tag shall appear only once. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the duplicate 'low' child tag. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:low) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(cda:high) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "value" tag - The 'high' tag shall appear only once. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the duplicate 'high' child tag. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:high) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(cda:centre) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "value" tag - The 'centre' tag shall appear only once. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the duplicate 'centre' child tag. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:centre) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(cda:width) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "value" tag - The 'width' tag shall appear only once. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the duplicate 'width' child tag. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:width) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="cda:center and (cda:low or cda:high)">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "value" tag - The 'value' tag shall have 'center' or 'low and/or high' tag but not both. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the incorrect use of 'centre' child tag. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">cda:center and (cda:low or cda:high)</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="                 cda:low  and cda:low/@value            and                 cda:high and cda:high/@value           and                 normalize-space(cda:low/@value)  != '' and                 normalize-space(cda:high/@value) != '' and                 contains(cda:low/@value,'.')           and                 contains(cda:high/@value, '.')         and                 contains(cda:low/@value,'+')           and                 contains(cda:high/@value, '+')         and                 (number(substring-before(cda:low/@value,'.')) +                 number(substring-after(substring-before(cda:low/@value,'+'),'.')) &gt;                 number(substring-before(cda:high/@value,'.')) +                 number(substring-after(substring-before(cda:high/@value,'+'),'.')))">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "value" tag - The 'low' tag 'value' attribute shall be a value less than than the 'high' tag 'value' attribute. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the 'low' and 'high' child tags having incorrect attribute value. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 cda:low  and cda:low/@value            and                 cda:high and cda:high/@value           and                 normalize-space(cda:low/@value)  != '' and                 normalize-space(cda:high/@value) != '' and                 contains(cda:low/@value,'.')           and                 contains(cda:high/@value, '.')         and                 contains(cda:low/@value,'+')           and                 contains(cda:high/@value, '+')         and                 (number(substring-before(cda:low/@value,'.')) +                 number(substring-after(substring-before(cda:low/@value,'+'),'.')) &gt;                 number(substring-before(cda:high/@value,'.')) +                 number(substring-after(substring-before(cda:high/@value,'+'),'.')))</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="                 cda:low  and cda:low/@value            and                 cda:high and cda:high/@value           and                 normalize-space(cda:low/@value)  != '' and                 normalize-space(cda:high/@value) != '' and                 contains(cda:low/@value,'.')           and                 contains(cda:high/@value, '.')         and                 contains(cda:low/@value,'-')           and                 contains(cda:high/@value, '-')         and                 (number(substring-before(cda:low/@value,'.')) +                 number(substring-after(substring-before(cda:low/@value,'-'),'.')) &gt;                 number(substring-before(cda:high/@value,'.')) +                 number(substring-after(substring-before(cda:high/@value,'-'),'.')))">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "value" tag - The 'low' tag 'value' attribute shall contain a value less than than the 'high' tag 'value' attribute. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the 'low' and 'high' child tags having incorrect attribute value. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 cda:low  and cda:low/@value            and                 cda:high and cda:high/@value           and                 normalize-space(cda:low/@value)  != '' and                 normalize-space(cda:high/@value) != '' and                 contains(cda:low/@value,'.')           and                 contains(cda:high/@value, '.')         and                 contains(cda:low/@value,'-')           and                 contains(cda:high/@value, '-')         and                 (number(substring-before(cda:low/@value,'.')) +                 number(substring-after(substring-before(cda:low/@value,'-'),'.')) &gt;                 number(substring-before(cda:high/@value,'.')) +                 number(substring-after(substring-before(cda:high/@value,'-'),'.')))</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="                 cda:low  and cda:low/@value            and                 cda:high and cda:high/@value           and                 normalize-space(cda:low/@value)  != '' and                 normalize-space(cda:high/@value) != '' and                 contains(cda:low/@value, '+')          and                 contains(cda:high/@value,'+')          and                 (number(substring-before(cda:low/@value,'+')) &gt; number(substring-before(cda:high/@value,'+')))">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "value" tag - The 'low' tag 'value' attribute shall contain a value less than than the 'high' tag 'value' attribute. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the 'low' and 'high' child tags having incorrect attribute value. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 cda:low  and cda:low/@value            and                 cda:high and cda:high/@value           and                 normalize-space(cda:low/@value)  != '' and                 normalize-space(cda:high/@value) != '' and                 contains(cda:low/@value, '+')          and                 contains(cda:high/@value,'+')          and                 (number(substring-before(cda:low/@value,'+')) &gt; number(substring-before(cda:high/@value,'+')))</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="                 cda:low  and cda:low/@value            and                 cda:high and cda:high/@value           and                 normalize-space(cda:low/@value)  != '' and                 normalize-space(cda:high/@value) != '' and                 contains(cda:low/@value, '-')          and                 contains(cda:high/@value,'-')          and                 (number(substring-before(cda:low/@value,'-')) &gt; number(substring-before(cda:high/@value,'-')))">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "value" tag - The 'low' tag 'value' attribute shall contain a value less than than the 'high' tag 'value' attribute. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the 'low' and 'high' child tags having incorrect attribute value. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 cda:low  and cda:low/@value            and                 cda:high and cda:high/@value           and                 normalize-space(cda:low/@value)  != '' and                 normalize-space(cda:high/@value) != '' and                 contains(cda:low/@value, '-')          and                 contains(cda:high/@value,'-')          and                 (number(substring-before(cda:low/@value,'-')) &gt; number(substring-before(cda:high/@value,'-')))</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="                 cda:low  and cda:low/@value            and                 cda:high and cda:high/@value           and                 normalize-space(cda:low/@value)  != '' and                 normalize-space(cda:high/@value) != '' and                 not(contains(cda:low/@value, '+'))     and                 not(contains(cda:high/@value,'+'))     and                 not(contains(cda:low/@value, '-'))     and                 not(contains(cda:high/@value,'-'))     and                 (number(cda:low/@value) &gt; number(cda:high/@value))">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "value" tag - The 'low' tag 'value' attribute shall contain a value less than than the 'high' tag 'value' attribute. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the 'low' and 'high' child tags having incorrect attribute value. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 cda:low  and cda:low/@value            and                 cda:high and cda:high/@value           and                 normalize-space(cda:low/@value)  != '' and                 normalize-space(cda:high/@value) != '' and                 not(contains(cda:low/@value, '+'))     and                 not(contains(cda:high/@value,'+'))     and                 not(contains(cda:low/@value, '-'))     and                 not(contains(cda:high/@value,'-'))     and                 (number(cda:low/@value) &gt; number(cda:high/@value))</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M9" />
  </xsl:template>
  <xsl:template match="cda:value[@xsi:type='PIVS_TS' or @xsi:type='IVL_TS' or @xsitype='TS']/cda:low |                        cda:value[@xsi:type='PIVS_TS' or @xsi:type='IVL_TS' or @xsitype='TS']/cda:high |                        cda:value[@xsi:type='PIVS_TS' or @xsi:type='IVL_TS' or @xsitype='TS']/cda:centre" priority="3993" mode="M9">
    <xsl:choose>
      <xsl:when test="@value" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "value" tag - The 'value/low' or 'value/high' or 'value/centre' tag 'value' attribute is missing. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the 'low', 'high' or 'centre' child tags that have 'value' attribute missing. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@value</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="not(@value) or normalize-space(@value) != ''" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "value" tag - The 'value/low' or 'value/high' or 'value/centre' tag 'value' attribute shall contain a value. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the 'low', 'high' or 'centre' child tags that have empty attribute value. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">not(@value) or normalize-space(@value) != ''</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="@value                and                 string-length(@value) &gt; 8   and                 not(contains(@value,'+'))   and not(contains(@value,'-'))">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "value" tag - The 'value/low' or 'value/high' or 'value/centre' tag 'value' attribute shall contain a timezone value. "Any time that is more specific than a day SHALL include a timezone". Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the 'low', high' or 'centre' child tags that have 'value' attribute of incorrect value. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@value                and                 string-length(@value) &gt; 8   and                 not(contains(@value,'+'))   and not(contains(@value,'-'))</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 not(contains(@value,'.'))    or                 ((string(number(substring-before(@value,'.'))) != string(number(@value))) and                 (string-length(substring-before(@value,'.')) = 14))" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - Incorrect DateTime - The 'time/low' or 'time/high' or 'time/centre' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the 'low', high' or 'centre' child tags that have 'value' attribute of incorrect value. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 not(contains(@value,'.'))    or                 ((string(number(substring-before(@value,'.'))) != string(number(@value))) and                 (string-length(substring-before(@value,'.')) = 14))</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 not(contains(@value,'+'))    or                 not(contains(@value,'.'))    or                 ((string(number(substring-before(substring-after(@value,'.'),'+'))) != string(number(@value))) and                 (string-length(substring-before(substring-after(@value,'.'),'+')) = 4))" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "value" tag - Incorrect fraction of second - The 'value/low' or 'value/high' or 'value/centre' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the 'low', high' or 'centre' child tags that have 'value' attribute of incorrect value. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 not(contains(@value,'+'))    or                 not(contains(@value,'.'))    or                 ((string(number(substring-before(substring-after(@value,'.'),'+'))) != string(number(@value))) and                 (string-length(substring-before(substring-after(@value,'.'),'+')) = 4))</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 not(contains(@value,'-'))    or                 not(contains(@value,'.'))    or                 ((string(number(substring-before(substring-after(@value,'.'),'-'))) != string(number(@value))) and                 (string-length(substring-before(substring-after(@value,'.'),'-')) = 4))" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "value" tag - Incorrect fraction of second - The 'value/low' or 'value/high' or 'value/centre' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the 'low', high' or 'centre' child tags that have 'value' attribute of incorrect value. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 not(contains(@value,'-'))    or                 not(contains(@value,'.'))    or                 ((string(number(substring-before(substring-after(@value,'.'),'-'))) != string(number(@value))) and                 (string-length(substring-before(substring-after(@value,'.'),'-')) = 4))</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 contains(@value,'.')         or                 not(contains(@value,'+'))    or                 ((string(number(substring-before(@value,'+'))) != string(number(@value))) and                 (string-length(substring-before(@value,'+')) &gt; 11) and                 (string-length(substring-before(@value,'+')) &lt; 15) and                 (string-length(substring-before(@value,'+')) mod 2 = 0))" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "value" tag - Incorrect DateTime - The 'value/low' or 'value/high' or 'value/centre' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the 'low', high' or 'centre' child tags that have 'value' attribute of incorrect value. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 contains(@value,'.')         or                 not(contains(@value,'+'))    or                 ((string(number(substring-before(@value,'+'))) != string(number(@value))) and                 (string-length(substring-before(@value,'+')) &gt; 11) and                 (string-length(substring-before(@value,'+')) &lt; 15) and                 (string-length(substring-before(@value,'+')) mod 2 = 0))</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 contains(@value,'.')         or                 not(contains(@value,'-'))    or                 ((string(number(substring-before(@value,'-'))) != string(number(@value))) and                 (string-length(substring-before(@value,'-')) &gt; 11) and                 (string-length(substring-before(@value,'-')) &lt; 15) and                 (string-length(substring-before(@value,'-')) mod 2 = 0))" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "value" tag - Incorrect DateTime - The 'value/low' or 'value/high' or 'value/centre' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the 'low', high' or 'centre' child tags that have 'value' attribute of incorrect value. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 contains(@value,'.')         or                 not(contains(@value,'-'))    or                 ((string(number(substring-before(@value,'-'))) != string(number(@value))) and                 (string-length(substring-before(@value,'-')) &gt; 11) and                 (string-length(substring-before(@value,'-')) &lt; 15) and                 (string-length(substring-before(@value,'-')) mod 2 = 0))</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 not(contains(@value,'+'))    or                 ((string(number(substring-after(@value,'+'))) != string(number(@value))) and                 ((string-length(substring-after(@value,'+')) = 2) or (string-length(substring-after(@value,'+')) = 4)))" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "value" tag - Incorrect TimeZone - The 'value/low' or 'value/high' or 'value/centre' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the 'low', high' or 'centre' child tags that have 'value' attribute of incorrect value. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 not(contains(@value,'+'))    or                 ((string(number(substring-after(@value,'+'))) != string(number(@value))) and                 ((string-length(substring-after(@value,'+')) = 2) or (string-length(substring-after(@value,'+')) = 4)))</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 not(contains(@value,'-'))    or                 ((string(number(substring-after(@value,'-'))) != string(number(@value))) and                 ((string-length(substring-after(@value,'-')) = 2) or (string-length(substring-after(@value,'-')) = 4)))" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "value" tag - Incorrect TimeZone - The 'value/low' or 'value/high' or 'value/centre' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the 'low', high' or 'centre' child tags that have 'value' attribute of incorrect value. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 not(contains(@value,'-'))    or                 ((string(number(substring-after(@value,'-'))) != string(number(@value))) and                 ((string-length(substring-after(@value,'-')) = 2) or (string-length(substring-after(@value,'-')) = 4)))</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 contains(@value,'.')         or                 contains(@value,'+')         or                 contains(@value,'-')         or                 ((string(number(@value)) != string(number('a'))) and                 (string-length(@value) &gt;= 4))" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "value" tag - Incorrect DateTime - The 'value/low' or 'value/high' or 'value/centre' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the 'low', high' or 'centre' child tags that have 'value' attribute of incorrect value. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 contains(@value,'.')         or                 contains(@value,'+')         or                 contains(@value,'-')         or                 ((string(number(@value)) != string(number('a'))) and                 (string-length(@value) &gt;= 4))</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 ((number(substring(@value,1,2)) &gt;= 19) and                 (number(substring(@value,1,2)) &lt; 21))                 " />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "value" tag - Incorrect Year - The 'value/low' or 'value/high' or 'value/centre' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the 'low', high' or 'centre' child tags that have 'value' attribute of incorrect value. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 ((number(substring(@value,1,2)) &gt;= 19) and                 (number(substring(@value,1,2)) &lt; 21))                 </xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 string-length(@value) &lt; 5 or                 ((number(substring(@value,5,2)) &gt;= 1) and                 (number(substring(@value,5,2)) &lt; 13))                 " />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "value" tag - Incorrect Month - The 'value/low' or 'value/high' or 'value/centre' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the 'low', high' or 'centre' child tags that have 'value' attribute of incorrect value. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 string-length(@value) &lt; 5 or                 ((number(substring(@value,5,2)) &gt;= 1) and                 (number(substring(@value,5,2)) &lt; 13))                 </xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                           or                 normalize-space(@value) = ''          or                 string-length(@value) &lt; 7          or                 number(substring(@value,5,2)) = 2     or                 number(substring(@value,5,2)) = 4     or                 number(substring(@value,5,2)) = 6     or                 number(substring(@value,5,2)) = 9     or                 number(substring(@value,5,2)) = 11    or                 number(substring(@value,5,2)) &gt; 12    or                 ((number(substring(@value,7,2)) &gt;= 1) and                 (number(substring(@value,7,2)) &lt; 32))                 " />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "value" tag - Incorrect Date - The 'value/low' or 'value/high' or 'value/centre' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the 'low', high' or 'centre' child tags that have 'value' attribute of incorrect value. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                           or                 normalize-space(@value) = ''          or                 string-length(@value) &lt; 7          or                 number(substring(@value,5,2)) = 2     or                 number(substring(@value,5,2)) = 4     or                 number(substring(@value,5,2)) = 6     or                 number(substring(@value,5,2)) = 9     or                 number(substring(@value,5,2)) = 11    or                 number(substring(@value,5,2)) &gt; 12    or                 ((number(substring(@value,7,2)) &gt;= 1) and                 (number(substring(@value,7,2)) &lt; 32))                 </xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                           or                 normalize-space(@value) = ''          or                 string-length(@value) &lt; 7          or                 number(substring(@value,5,2)) = 1     or                 number(substring(@value,5,2)) = 2     or                 number(substring(@value,5,2)) = 3     or                 number(substring(@value,5,2)) = 5     or                 number(substring(@value,5,2)) = 7     or                 number(substring(@value,5,2)) = 8     or                 number(substring(@value,5,2)) = 10    or                 number(substring(@value,5,2)) = 12    or                 number(substring(@value,5,2)) &gt; 12    or                 ((number(substring(@value,7,2)) &gt;= 1) and                 (number(substring(@value,7,2)) &lt; 31))                 " />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "value" tag - Incorrect Month - The 'value/low' or 'value/high' or 'value/centre' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the 'low', high' or 'centre' child tags that have 'value' attribute of incorrect value. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                           or                 normalize-space(@value) = ''          or                 string-length(@value) &lt; 7          or                 number(substring(@value,5,2)) = 1     or                 number(substring(@value,5,2)) = 2     or                 number(substring(@value,5,2)) = 3     or                 number(substring(@value,5,2)) = 5     or                 number(substring(@value,5,2)) = 7     or                 number(substring(@value,5,2)) = 8     or                 number(substring(@value,5,2)) = 10    or                 number(substring(@value,5,2)) = 12    or                 number(substring(@value,5,2)) &gt; 12    or                 ((number(substring(@value,7,2)) &gt;= 1) and                 (number(substring(@value,7,2)) &lt; 31))                 </xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                           or                 normalize-space(@value) = ''          or                 string-length(@value) &lt; 7          or                 number(substring(@value,5,2)) = 1     or                 number(substring(@value,5,2)) = 3     or                 number(substring(@value,5,2)) = 4     or                 number(substring(@value,5,2)) = 5     or                 number(substring(@value,5,2)) = 6     or                 number(substring(@value,5,2)) = 7     or                 number(substring(@value,5,2)) = 8     or                 number(substring(@value,5,2)) = 9     or                 number(substring(@value,5,2)) = 10    or                 number(substring(@value,5,2)) = 11    or                 number(substring(@value,5,2)) = 12    or                 number(substring(@value,5,2)) &gt; 12    or                 (number(substring(@value,1,4)) mod 4) != 0 or                 ((number(substring(@value,7,2)) &gt;= 1) and                 (number(substring(@value,7,2)) &lt; 30))                 " />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "value" tag - Incorrect Date - The 'value/low' or 'value/high' or 'value/centre' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the 'low', high' or 'centre' child tags that have 'value' attribute of incorrect value. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                           or                 normalize-space(@value) = ''          or                 string-length(@value) &lt; 7          or                 number(substring(@value,5,2)) = 1     or                 number(substring(@value,5,2)) = 3     or                 number(substring(@value,5,2)) = 4     or                 number(substring(@value,5,2)) = 5     or                 number(substring(@value,5,2)) = 6     or                 number(substring(@value,5,2)) = 7     or                 number(substring(@value,5,2)) = 8     or                 number(substring(@value,5,2)) = 9     or                 number(substring(@value,5,2)) = 10    or                 number(substring(@value,5,2)) = 11    or                 number(substring(@value,5,2)) = 12    or                 number(substring(@value,5,2)) &gt; 12    or                 (number(substring(@value,1,4)) mod 4) != 0 or                 ((number(substring(@value,7,2)) &gt;= 1) and                 (number(substring(@value,7,2)) &lt; 30))                 </xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                           or                 normalize-space(@value) = ''          or                 string-length(@value) &lt; 7          or                 number(substring(@value,5,2)) = 1     or                 number(substring(@value,5,2)) = 3     or                 number(substring(@value,5,2)) = 4     or                 number(substring(@value,5,2)) = 5     or                 number(substring(@value,5,2)) = 6     or                 number(substring(@value,5,2)) = 7     or                 number(substring(@value,5,2)) = 8     or                 number(substring(@value,5,2)) = 9     or                 number(substring(@value,5,2)) = 10    or                 number(substring(@value,5,2)) = 11    or                 number(substring(@value,5,2)) = 12    or                 number(substring(@value,5,2)) &gt; 12    or                 (number(substring(@value,1,4)) mod 4) = 0 or                 ((number(substring(@value,7,2)) &gt;= 1) and                 (number(substring(@value,7,2)) &lt; 29))                 " />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "value" tag - Incorrect Date - The 'value/low' or 'value/high' or 'value/centre' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the 'low', high' or 'centre' child tags that have 'value' attribute of incorrect value. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                           or                 normalize-space(@value) = ''          or                 string-length(@value) &lt; 7          or                 number(substring(@value,5,2)) = 1     or                 number(substring(@value,5,2)) = 3     or                 number(substring(@value,5,2)) = 4     or                 number(substring(@value,5,2)) = 5     or                 number(substring(@value,5,2)) = 6     or                 number(substring(@value,5,2)) = 7     or                 number(substring(@value,5,2)) = 8     or                 number(substring(@value,5,2)) = 9     or                 number(substring(@value,5,2)) = 10    or                 number(substring(@value,5,2)) = 11    or                 number(substring(@value,5,2)) = 12    or                 number(substring(@value,5,2)) &gt; 12    or                 (number(substring(@value,1,4)) mod 4) = 0 or                 ((number(substring(@value,7,2)) &gt;= 1) and                 (number(substring(@value,7,2)) &lt; 29))                 </xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 string-length(substring-before(translate(@value, '-', '+'),'+')) &lt; 9 or                 ((number(substring(@value,9,2)) &gt;= 0) and                 (number(substring(@value,9,2)) &lt; 24))                 " />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "value" tag - Incorrect Hour - The 'value/low' or 'value/high' or 'value/centre' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the 'low', high' or 'centre' child tags that have 'value' attribute of incorrect value. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 string-length(substring-before(translate(@value, '-', '+'),'+')) &lt; 9 or                 ((number(substring(@value,9,2)) &gt;= 0) and                 (number(substring(@value,9,2)) &lt; 24))                 </xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 string-length(substring-before(translate(@value, '-', '+'),'+')) &lt; 11 or                 ((number(substring(@value,11,2)) &gt;= 0) and                 (number(substring(@value,11,2)) &lt; 60))                 " />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "value" tag - Incorrect Minute - The 'value/low' or 'value/high' or 'value/centre' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the 'low', high' or 'centre' child tags that have 'value' attribute of incorrect value. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 string-length(substring-before(translate(@value, '-', '+'),'+')) &lt; 11 or                 ((number(substring(@value,11,2)) &gt;= 0) and                 (number(substring(@value,11,2)) &lt; 60))                 </xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 string-length(substring-before(translate(@value, '-', '+'),'+')) &lt; 13 or                 ((number(substring(@value,13,2)) &gt;= 0) and                 (number(substring(@value,13,2)) &lt; 60))                 " />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "value" tag - Incorrect Second - The 'value/low' or 'value/high' or 'value/centre' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the 'low', high' or 'centre' child tags that have 'value' attribute of incorrect value. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 string-length(substring-before(translate(@value, '-', '+'),'+')) &lt; 13 or                 ((number(substring(@value,13,2)) &gt;= 0) and                 (number(substring(@value,13,2)) &lt; 60))                 </xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M9" />
  </xsl:template>
  <xsl:template match=" cda:value[@xsi:type='PIVL_TS' or @xsi:type='IVL_TS' or @xsitype='TS']/cda:width" priority="3992" mode="M9">
    <xsl:choose>
      <xsl:when test="@value" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "value" tag - The 'value/width' tag 'value' attribute is missing. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the 'width' child tags that have 'value' attribute missing. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@value</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="not(@value) or normalize-space(@value) != ''" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "value" tag - The 'value/width' tag 'value' attribute shall contain a value. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the 'width' child tags that have empty attribute value. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">not(@value) or normalize-space(@value) != ''</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="not(@unit) or normalize-space(@unit) != ''" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "value" tag - The 'value/width' tag 'unit' attribute shall contain a value. Check all 'cda:value' tag with 'xsi:type=IVL_TS' or 'xsi:type=TS' attribute to find the 'width' child tags that have empty attribute value. Refer to sections of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">not(@unit) or normalize-space(@unit) != ''</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M9" />
  </xsl:template>
  <xsl:template match="text()" priority="-1" mode="M9" />
  <xsl:template match="/cda:ClinicalDocument" priority="4000" mode="M10">
    <xsl:if test="count(cda:legalAuthenticator) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1.1 Legal Authenticator - The 'legalAuthenticator' tag shall appear only once. Refer to section 5.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:legalAuthenticator) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M10" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:legalAuthenticator" priority="3999" mode="M10">
    <xsl:choose>
      <xsl:when test="cda:time" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1.1 Legal Authenticator - "legalAuthenticator / time" - The 'time' tag is missing. Refer to section 5.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:time</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:time) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1.1 Legal Authenticator - "legalAuthenticator / time" - The 'time' tag shall appear only once. Refer to section 5.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:time) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="cda:signatureCode" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1.1 Legal Authenticator - "legalAuthenticator / signatureCode" - The 'signatureCode' tag is missing. Refer to section 5.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:signatureCode</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:signatureCode) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1.1 Legal Authenticator - "legalAuthenticator / signatureCode" - The 'signatureCode' tag shall appear only once. Refer to section 5.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:signatureCode) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="cda:signatureCode[@code]" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1.1 Legal Authenticator - "legalAuthenticator / signatureCode" - The 'signatureCode' tag 'code' attribute is missing. Refer to section 5.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:signatureCode[@code]</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="cda:signatureCode[@code = 'S']" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1.1 Legal Authenticator - "legalAuthenticator / signatureCode" - The 'signatureCode' tag 'code' attribute shall contain the value "S". Refer to section 5.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:signatureCode[@code = 'S']</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="cda:assignedEntity" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1.1 Legal Authenticator - "legalAuthenticator / assignedEntity" - The 'assignedEntity' tag is missing. Refer to section 5.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:assignedEntity</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:assignedEntity) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1.1 Legal Authenticator - "legalAuthenticator / assignedEntity" - The 'assignedEntity' tag shall appear only once. Refer to section 5.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:assignedEntity) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M10" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:legalAuthenticator/cda:time" priority="3998" mode="M10">
    <xsl:choose>
      <xsl:when test="@value" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1.1 Legal Authenticator - "legalAuthenticator / time" - The 'time' tag 'value' attribute is missing. Refer to section 5.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@value</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="not(@value) or normalize-space(@value) !=  ''" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1.1 Legal Authenticator - "legalAuthenticator / time" - The 'time' tag 'value' attribute shall contain a value. Refer to section 5.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">not(@value) or normalize-space(@value) !=  ''</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="not(@value)         or                 not(contains(@value,'+')) or                 floor(substring-before(@value,'+')) = number(substring-before(@value,'+'))" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1.1 Legal Authenticator - "legalAuthenticator / time" - The 'time' tag 'value' attribute shall be a number. Refer to section 5.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">not(@value)         or                 not(contains(@value,'+')) or                 floor(substring-before(@value,'+')) = number(substring-before(@value,'+'))</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="not(@value)         or                     not(contains(@value,'+')) or                     floor(substring-after(@value,'+')) = number(substring-after(@value,'+'))" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1.1 Legal Authenticator - "legalAuthenticator / time" - The 'time' tag 'value' attribute shall be a number. Refer to section 5.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">not(@value)         or                     not(contains(@value,'+')) or                     floor(substring-after(@value,'+')) = number(substring-after(@value,'+'))</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="not(@value)         or                         normalize-space(@value) = '' or                         contains(@value,'+')      or                         floor(@value) = number(@value)" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1.1 Legal Authenticator - "legalAuthenticator / time" - The 'time' tag 'value' attribute shall be a number. Refer to section 5.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">not(@value)         or                         normalize-space(@value) = '' or                         contains(@value,'+')      or                         floor(@value) = number(@value)</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M10" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:legalAuthenticator/cda:assignedEntity/cda:code" priority="3997" mode="M10">
    <xsl:if test="@nullFlavor and normalize-space(@nullFlavor) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1.1 Legal Authenticator - "legalAuthenticator / assignedEntity / code" - The 'code' tag 'nullFlavor' attribute shall contain a value. Refer to section 5.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@nullFlavor and normalize-space(@nullFlavor) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="@code" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1.1 Legal Authenticator - "legalAuthenticator / assignedEntity / code" - The 'code' tag 'code' attribute is missing. Refer to section 5.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@code</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="normalize-space(@code) !=  ''" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1.1 Legal Authenticator - "legalAuthenticator / assignedEntity / code" - The 'code' tag 'code' attribute shall contain a value. Refer to section 5.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">normalize-space(@code) !=  ''</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="@codeSystem" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1.1 Legal Authenticator - "legalAuthenticator / assignedEntity / code" - The 'code' tag 'codeSystem' attribute is missing. Refer to section 5.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@codeSystem</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="normalize-space(@codeSystem) !=  ''" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1.1 Legal Authenticator - "legalAuthenticator / assignedEntity / code" - The 'code' tag 'codeSystem' attribute shall contain a value. Refer to section 5.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">normalize-space(@codeSystem) !=  ''</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="@codeSystemName and normalize-space(@codeSystemName) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1.1 Legal Authenticator - "legalAuthenticator / assignedEntity / code" - The 'code' tag 'codeSystemName' attribute shall contain a value. Refer to section 5.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@codeSystemName and normalize-space(@codeSystemName) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="@displayName and normalize-space(@displayName) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1.1 Legal Authenticator - "legalAuthenticator / assignedEntity / code" - The 'code' tag 'displayName' attribute shall contain a value. Refer to section 5.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@displayName and normalize-space(@displayName) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M10" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:legalAuthenticator/cda:assignedEntity" priority="3996" mode="M10">
    <xsl:if test="count(cda:code) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1.1 Legal Authenticator - "legalAuthenticator / assignedEntity / code" - The 'assignedEntity' tag shall appear only once. Refer to section 5.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:code) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="cda:id" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1.1 Legal Authenticator - "legalAuthenticator / assignedEntity / id" - The 'id' tag is missing. Refer to section 5.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:id</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:id) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1.1 Legal Authenticator - "legalAuthenticator / assignedEntity / id" - The 'assignedEntity' tag 'id' attribute shall appear only once. Refer to section 5.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:id) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="cda:id[@root]" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1.1 Legal Authenticator - "legalAuthenticator / assignedEntity / id" - The 'id' tag 'root' attribute is missing. Refer to section 5.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:id[@root]</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="cda:id[@root !=  '']" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1.1 Legal Authenticator - "legalAuthenticator / assignedEntity / id" - The 'id' tag 'root' attribute shall contain an UUID. Refer to section 5.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:id[@root !=  '']</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="cda:id[@nullFlavor] and cda:id[normalize-space(@nullFlavor) = '']">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1.1 Legal Authenticator - "legalAuthenticator / assignedEntity / id" - The 'id' tag 'nullFlavor' attribute shall contain a value. Refer to section 5.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">cda:id[@nullFlavor] and cda:id[normalize-space(@nullFlavor) = '']</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="cda:id[@extension] and cda:id[normalize-space(@extension) = '']">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1.1 Legal Authenticator - "legalAuthenticator / assignedEntity / id" - The 'id' tag 'extension' attribute shall contain a value. Refer to section 5.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">cda:id[@extension] and cda:id[normalize-space(@extension) = '']</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="cda:id[assigningScopingEntity] and cda:id[normalize-space(@assigningScopingEntity) = '']">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1.1 Legal Authenticator - "legalAuthenticator / assignedEntity / id" - The 'id' tag 'assigningScopingEntity' attribute shall contain a value. Refer to section 5.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">cda:id[assigningScopingEntity] and cda:id[normalize-space(@assigningScopingEntity) = '']</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(cda:assignedPerson) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1.1 Legal Authenticator - "legalAuthenticator / assignedEntity / assignedPerson" - The 'assignedPerson' tag shall appear only once. Refer to section 5.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:assignedPerson) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(cda:representedOrganization) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1.1 Legal Authenticator - "legalAuthenticator / assignedEntity / representedOrganization / representedOrganization" - The 'representedOrganization' tag shall appear only once. Refer to section 5.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:representedOrganization) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M10" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:legalAuthenticator/cda:assignedEntity/cda:representedOrganization" priority="3995" mode="M10">
    <xsl:if test="cda:name and normalize-space(cda:name) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 5.1.1 Legal Authenticator - "legalAuthenticator / assignedEntity / representedOrganization" - The 'name' tag shall contain a value. Refer to section 5.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">cda:name and normalize-space(cda:name) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M10" />
  </xsl:template>
  <xsl:template match="text()" priority="-1" mode="M10" />
  <xsl:template match="cda:code | ext:code | cda:methodCode | ext:methodCode | ext:jobClassCode" priority="4000" mode="M11">
    <xsl:if test="cda:originalText and normalize-space(cda:originalText) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "cda:code/cda:originalText" - The 'originalText' tag shall contain a value. Check all 'cda:code/cda:originalText' tags to find the missing text. Refer to section 8.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">cda:originalText and normalize-space(cda:originalText) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(cda:originalText) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "cda:code/cda:originalText" - The 'originalText' tag shall appear only once. Check all 'cda:code/cda:originalText' tags to find the duplicate text. Refer to section 8.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:originalText) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="                 cda:originalText or (@code and @codeSystem) or @nullFlavor" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "cda:code/@code" attribute - The 'code' tag shall have 'originalText' or 'code and codeSystem' or 'nullFlavor' attributes. Check all 'cda:code' tags to find the missing tag or attribute. Refer to section 8.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 cda:originalText or (@code and @codeSystem) or @nullFlavor</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="@nullFlavor and normalize-space(@nullFlavor) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "cda:code/@nullFlavor" attribute - The 'code' tag 'nullFlavor' attribute shall contain a value. Check all 'cda:code' tags 'nullFlavor' attributes to find the missing value. Refer to section 8.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@nullFlavor and normalize-space(@nullFlavor) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="@code and normalize-space(@code) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "cda:code/@code" attribute - The 'code' tag 'code' attribute shall contain a value. Check all 'cda:code' tags 'code' attributes to find the missing value. Refer to section 8.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@code and normalize-space(@code) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="@codeSystem and normalize-space(@codeSystem) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "cda:code/@codeSystem" attribute - The 'code' tag 'codeSystem' attribute shall contain a value. Check all 'cda:code' tags 'codeSystem' attributes to find the missing value. Refer to section 8.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@codeSystem and normalize-space(@codeSystem) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="@codeSystemName and normalize-space(@codeSystemName) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "cda:code/@codeSystemName" attribute - The 'code' tag 'codeSystemName' attribute shall contain a value. Check all 'cda:code' tags 'codeSystemName' attributes to find the missing value. Refer to section 8.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@codeSystemName and normalize-space(@codeSystemName) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="@displayName and normalize-space(@displayName) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "cda:code/@displayName" attribute - The 'code' tag 'displayName' attribute shall contain a value. Check all 'cda:code' tags 'displayName' attributes to find the missing value. Refer to section 8.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@displayName and normalize-space(@displayName) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M11" />
  </xsl:template>
  <xsl:template match="cda:code/cda:translation | ext:code/cda:translation | ext:jobClassCode/cda:translation" priority="3999" mode="M11">
    <xsl:choose>
      <xsl:when test="@code and @codeSystem or (@nullFlavor='OTH' and @codeSystem)" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "cda:code/cda:translation" attributes - The 'translation' tag shall have 'code' and 'codeSystem' attributes. Check all 'cda:code/cda:translation' tags to find the missing tag or attribute. Refer to section 8.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@code and @codeSystem or (@nullFlavor='OTH' and @codeSystem)</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="@nullFlavor and normalize-space(@nullFlavor) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "cda:code/cda:translation/@nullFlavor" attribute - The 'translation' tag 'nullFlavor' attribute shall contain a value. Check all 'cda:code/cda:translation' tags 'nullFlavor' attributes to find the missing value. Refer to section 8.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@nullFlavor and normalize-space(@nullFlavor) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="@code and normalize-space(@code) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "cda:code/cda:translation/@code" attribute - The 'translation' tag 'code' attribute shall contain a value. Check all 'cda:code/cda:translation' tags 'code' attributes to find the missing value. Refer to section 8.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@code and normalize-space(@code) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="@codeSystem and normalize-space(@codeSystem) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "cda:code/cda:translation/@codeSystem" attribute - The 'translation' tag 'codeSystem' attribute shall contain a value. Check all 'cda:code/cda:translation' tags 'codeSystem' attributes to find the missing value. Refer to section 8.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@codeSystem and normalize-space(@codeSystem) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="@codeSystemName and normalize-space(@codeSystemName) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "cda:code/cda:translation/@codeSystemName" attribute - The 'translation' tag 'codeSystemName' attribute shall contain a value. Check all 'cda:code/cda:translation' tags 'codeSystemName' attributes to find the missing value. Refer to section 8.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@codeSystemName and normalize-space(@codeSystemName) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="@displayName and normalize-space(@displayName) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "cda:code/cda:translation/@displayName" attribute - The 'translation' tag 'displayName' attribute shall contain a value. Check all 'cda:code/cda:translation' tags 'displayName' attributes to find the missing value. Refer to section 8.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@displayName and normalize-space(@displayName) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M11" />
  </xsl:template>
  <xsl:template match="cda:id | ext:id[not(ancestor::ext:entitlement)]" priority="3998" mode="M11">
    <xsl:choose>
      <xsl:when test="@root or @nullFlavor" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "id" tag - The 'id' tag shall have 'root' or 'nullFlavor' attributes. Check all 'cda:id' tags to find the missing 'root' or 'nullFlavor' attributes. Refer to section 8.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@root or @nullFlavor</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="@root and normalize-space(@root) =  ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "id" tag - The 'id' tag 'root' attribute shall contain a value. Check all 'cda:id' tags 'root' attribute to find the missing value. Refer to section 8.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@root and normalize-space(@root) =  ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="                 not(@root) or                 normalize-space(@root) = '' or                 contains(@root, '-') or                 contains(@root, '.')" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "id" tag - The 'id' tag 'root' attribute shall contain an UUID or OID. Check all 'cda:id' tags to find the incorrect 'root' attribute. Refer to section 8.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@root) or                 normalize-space(@root) = '' or                 contains(@root, '-') or                 contains(@root, '.')</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="                 @root and                 normalize-space(@root) != '' and                 contains(@root, '-') and not(                 string-length(@root) = 36 and                 substring(@root,  9, 1) = '-' and substring(@root, 14, 1) = '-' and                 substring(@root, 19, 1) = '-' and substring(@root, 24, 1) = '-' and                 translate(substring(@root,  1,  8), '0123456789ABCDEFabcdef', '0000000000000000000000') = '00000000' and                 translate(substring(@root, 10,  4), '0123456789ABCDEFabcdef', '0000000000000000000000') = '0000' and                 translate(substring(@root, 15,  4), '0123456789ABCDEFabcdef', '0000000000000000000000') = '0000' and                 translate(substring(@root, 20,  4), '0123456789ABCDEFabcdef', '0000000000000000000000') = '0000' and                 translate(substring(@root, 25, 12), '0123456789ABCDEFabcdef', '0000000000000000000000') = '000000000000')                 ">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "id" tag - The 'id' tag 'root' attribute shall be a valid UUID. Check all 'cda:id' tags to find the incorrect 'root' attribute. Refer to section 8.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 @root and                 normalize-space(@root) != '' and                 contains(@root, '-') and not(                 string-length(@root) = 36 and                 substring(@root,  9, 1) = '-' and substring(@root, 14, 1) = '-' and                 substring(@root, 19, 1) = '-' and substring(@root, 24, 1) = '-' and                 translate(substring(@root,  1,  8), '0123456789ABCDEFabcdef', '0000000000000000000000') = '00000000' and                 translate(substring(@root, 10,  4), '0123456789ABCDEFabcdef', '0000000000000000000000') = '0000' and                 translate(substring(@root, 15,  4), '0123456789ABCDEFabcdef', '0000000000000000000000') = '0000' and                 translate(substring(@root, 20,  4), '0123456789ABCDEFabcdef', '0000000000000000000000') = '0000' and                 translate(substring(@root, 25, 12), '0123456789ABCDEFabcdef', '0000000000000000000000') = '000000000000')                 </xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="                 @root and                 normalize-space(@root) != '' and                 contains(@root,'.') and not(                 substring(@root, 1, 1) != '0' and                 substring(@root, 1, 1) != '.' and                 substring(@root, string-length(@root), 1) != '.' and                 number(translate(@root, '0123456789.', '00000000000')) = 0)                 ">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "id" tag - The 'id' tag 'root' attribute shall be a valid OID. Check all 'cda:id' tags to find the incorrect 'root' attribute. Refer to section 8.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 @root and                 normalize-space(@root) != '' and                 contains(@root,'.') and not(                 substring(@root, 1, 1) != '0' and                 substring(@root, 1, 1) != '.' and                 substring(@root, string-length(@root), 1) != '.' and                 number(translate(@root, '0123456789.', '00000000000')) = 0)                 </xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="                 not(@root) or                 not(starts-with(@root, '1.2.36.1.2001.1003.0.80036') or                     starts-with(@root, '1.2.36.1.2001.1007.1.80036') or                     starts-with(@root, '1.2.36.1.2001.1007.10.80036') or                     starts-with(@root, '1.2.36.1.2001.1007.20.80036')) or (                     not(contains(substring-after(@root, '80036'), '.')) and                     string-length('80036') + string-length(substring-after(@root, '80036')) = 16                 )" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 8.2 Employment - The 'id' tag 'root' attribute shall contain an OID for Health Identifier, which should be ended with a national 16 digits unique identification number. Check all 'ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization/ext:asEntityIdentifier/ext:id' tags to find the incorrect value. Refer to section 8.2 Employment of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@root) or                 not(starts-with(@root, '1.2.36.1.2001.1003.0.80036') or                     starts-with(@root, '1.2.36.1.2001.1007.1.80036') or                     starts-with(@root, '1.2.36.1.2001.1007.10.80036') or                     starts-with(@root, '1.2.36.1.2001.1007.20.80036')) or (                     not(contains(substring-after(@root, '80036'), '.')) and                     string-length('80036') + string-length(substring-after(@root, '80036')) = 16                 )</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@root) or                 not(starts-with(@root, '1.2.36.1.2001.1003.0.80036') or                     starts-with(@root, '1.2.36.1.2001.1007.1.80036') or                     starts-with(@root, '1.2.36.1.2001.1007.10.80036') or                     starts-with(@root, '1.2.36.1.2001.1007.20.80036')) or                 contains(substring-after(@root, '80036'), '.') or                 not(string-length('80036') + string-length(substring-after(@root, '80036')) = 16) or (                 (                     number(substring(string(2 * 8), 1, 1)) + number(substring(string(2 * 8), 2, 1)) +                     0 +                     2 * 0 +                     3 +                     number(substring(string(2 * 6), 1, 1)) + number(substring(string(2 * 6), 2, 1)) +                     number(substring(substring-after(@root, '80036'), 1, 1)) +                     number(substring(string(2 * substring(substring-after(@root, '80036'), 2, 1)), string-length(string(2 * substring(substring-after(@root, '80036'), 2, 1))), 1)) +                     number(substring(string(number(substring(substring-after(@root, '80036'), 2, 1)) div 5), 1, 1)) +                     number(substring(substring-after(@root, '80036'), 3, 1)) +                     number(substring(string(2 * substring(substring-after(@root, '80036'), 4, 1)), string-length(string(2 * substring(substring-after(@root, '80036'), 4, 1))), 1)) +                     number(substring(string(number(substring(substring-after(@root, '80036'), 4, 1)) div 5), 1, 1)) +                     number(substring(substring-after(@root, '80036'), 5, 1)) +                     number(substring(string(2 * substring(substring-after(@root, '80036'), 6, 1)), string-length(string(2 * substring(substring-after(@root, '80036'), 6, 1))), 1)) +                     number(substring(string(number(substring(substring-after(@root, '80036'), 6, 1)) div 5), 1, 1)) +                     number(substring(substring-after(@root, '80036'), 7, 1)) +                     number(substring(string(2 * substring(substring-after(@root, '80036'), 8, 1)), string-length(string(2 * substring(substring-after(@root, '80036'), 8, 1))), 1)) +                     number(substring(string(number(substring(substring-after(@root, '80036'), 8, 1)) div 5), 1, 1)) +                     number(substring(substring-after(@root, '80036'), 9, 1)) +                     number(substring(string(2 * substring(substring-after(@root, '80036'),10, 1)), string-length(string(2 * substring(substring-after(@root, '80036'),10, 1))), 1)) +                     number(substring(string(number(substring(substring-after(@root, '80036'),10, 1)) div 5), 1, 1)) +                     number(substring(substring-after(@root, '80036'), 11, 1))                 ) mod 10 = 0)" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 8.2 Employment - The 'id' tag 'root' attribute shall have an valid Luhn check digit in the OID for Health Identifier. Check all 'ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization/ext:asEntityIdentifier/ext:id' tags to find the incorrect value. Refer to section 8.2 Employment of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@root) or                 not(starts-with(@root, '1.2.36.1.2001.1003.0.80036') or                     starts-with(@root, '1.2.36.1.2001.1007.1.80036') or                     starts-with(@root, '1.2.36.1.2001.1007.10.80036') or                     starts-with(@root, '1.2.36.1.2001.1007.20.80036')) or                 contains(substring-after(@root, '80036'), '.') or                 not(string-length('80036') + string-length(substring-after(@root, '80036')) = 16) or (                 (                     number(substring(string(2 * 8), 1, 1)) + number(substring(string(2 * 8), 2, 1)) +                     0 +                     2 * 0 +                     3 +                     number(substring(string(2 * 6), 1, 1)) + number(substring(string(2 * 6), 2, 1)) +                     number(substring(substring-after(@root, '80036'), 1, 1)) +                     number(substring(string(2 * substring(substring-after(@root, '80036'), 2, 1)), string-length(string(2 * substring(substring-after(@root, '80036'), 2, 1))), 1)) +                     number(substring(string(number(substring(substring-after(@root, '80036'), 2, 1)) div 5), 1, 1)) +                     number(substring(substring-after(@root, '80036'), 3, 1)) +                     number(substring(string(2 * substring(substring-after(@root, '80036'), 4, 1)), string-length(string(2 * substring(substring-after(@root, '80036'), 4, 1))), 1)) +                     number(substring(string(number(substring(substring-after(@root, '80036'), 4, 1)) div 5), 1, 1)) +                     number(substring(substring-after(@root, '80036'), 5, 1)) +                     number(substring(string(2 * substring(substring-after(@root, '80036'), 6, 1)), string-length(string(2 * substring(substring-after(@root, '80036'), 6, 1))), 1)) +                     number(substring(string(number(substring(substring-after(@root, '80036'), 6, 1)) div 5), 1, 1)) +                     number(substring(substring-after(@root, '80036'), 7, 1)) +                     number(substring(string(2 * substring(substring-after(@root, '80036'), 8, 1)), string-length(string(2 * substring(substring-after(@root, '80036'), 8, 1))), 1)) +                     number(substring(string(number(substring(substring-after(@root, '80036'), 8, 1)) div 5), 1, 1)) +                     number(substring(substring-after(@root, '80036'), 9, 1)) +                     number(substring(string(2 * substring(substring-after(@root, '80036'),10, 1)), string-length(string(2 * substring(substring-after(@root, '80036'),10, 1))), 1)) +                     number(substring(string(number(substring(substring-after(@root, '80036'),10, 1)) div 5), 1, 1)) +                     number(substring(substring-after(@root, '80036'), 11, 1))                 ) mod 10 = 0)</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="@nullFlavor and normalize-space(@nullFlavor) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "id" tag - The 'id' tag 'nullFlavor' attribute shall contain a value. Check all 'cda:id' tags 'nullFlavor' attribute to find the missing value. Refer to section 8.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@nullFlavor and normalize-space(@nullFlavor) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="@nullFlavor and translate(@nullFlavor, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')!='NA'">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "id" tag - The 'id' tag 'nullFlavor' attribute shall contain the value 'NA'. Check all 'cda:id' tags to find the incorrect 'nullFlavor' attribute. Refer to section 8.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@nullFlavor and translate(@nullFlavor, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')!='NA'</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="@extension and not(@root)">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "id" tag - The 'id' tag 'root' attribute is missing when the 'extension' attribute exists. Check all 'cda:id' tags to find the 'extension' without 'root' attributes. Refer to section 8.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@extension and not(@root)</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="@extension and normalize-space(@extension) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "id" tag - The 'id' tag 'extension' attribute shall contain a value. Check all 'cda:id' tags 'extension' attribute to find the missing value. Refer to section 8.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@extension and normalize-space(@extension) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="@assigningAuthorityName and not(@root)">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "id" tag - The 'id' tag 'root' attribute is missing when the 'assigningAuthorityName' attribute exists. Check all 'cda:id' tags to find the 'assigningAuthorityName' without 'root' attributes. Refer to section 8.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@assigningAuthorityName and not(@root)</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="@assigningAuthorityName and normalize-space(@assigningAuthorityName) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "id" tag - The 'id' tag 'assigningAuthorityName' attribute shall contain a value. Check all 'cda:id' tags 'assigningAuthorityName' attribute to find the missing value. Refer to section 8.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@assigningAuthorityName and normalize-space(@assigningAuthorityName) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="@displayable and not(@root)">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "id" tag - The 'id' tag 'root' attribute is missing when the 'displayable' attribute exists. Check all 'cda:id' tags to find the 'displayable' without 'root' attributes. Refer to section 8.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@displayable and not(@root)</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="@displayable and normalize-space(@displayable) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "id" tag - The 'id' tag 'displayable' attribute shall contain a value. Check all 'cda:id' tags 'displayable' attribute to find the missing value. Refer to section 8.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@displayable and normalize-space(@displayable) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="@displayable and                 normalize-space(@displayable) != '' and                 not(@displayable = 'true' or @displayable = 'false')">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "id" tag - The 'id' tag 'displayable' attribute shall contain the value "true" or "false". Check all 'cda:id' tags 'displayable' attribute to find the incorrect value. Refer to section 8.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@displayable and                 normalize-space(@displayable) != '' and                 not(@displayable = 'true' or @displayable = 'false')</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M11" />
  </xsl:template>
  <xsl:template match="cda:time | ext:time | cda:birthTime | ext:birthTime | cda:deceasedTime | ext:deceasedTime | cda:effectiveTime | ext:effectiveTime" priority="3997" mode="M11">
    <xsl:if test="@xsi:type and normalize-space(@xsi:type) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - The 'time' tag 'xsi:type' attribute shall contain a value. Check all 'time' tags to find the attribute. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@xsi:type and normalize-space(@xsi:type) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="                 @xsi:type and                 normalize-space(@xsi:type) != '' and                 @xsi:type != 'TS' and                 @xsi:type != 'IVL_TS' and                 @xsi:type != 'PIVL_TS'">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - The 'time' tag 'xsi:type' attribute shall contain the value 'TS', 'IVL_TS' or 'PIVL_TS'. Check all 'time' tags to find the attribute. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 @xsi:type and                 normalize-space(@xsi:type) != '' and                 @xsi:type != 'TS' and                 @xsi:type != 'IVL_TS' and                 @xsi:type != 'PIVL_TS'</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="                 @value or cda:low or cda:high or cda:width or cda:frequency or                 @nullFlavor" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - The 'time' tag shall have 'value' or 'nullFlavor' attribute or 'low' or 'high' or 'centre' or 'width' child tags. Check all 'cda:time' tag to find the missing tag or attribute. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 @value or cda:low or cda:high or cda:width or cda:frequency or                 @nullFlavor</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="@nullFlavor and normalize-space(@nullFlavor) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - The 'time' tag 'nullFlavor' attribute shall contain a value. Check all 'cda:time' tag to find the missing attribute value. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@nullFlavor and normalize-space(@nullFlavor) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="@value and normalize-space(@value) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - The 'time' tag 'value' attribute shall contain a value. Check all 'time' tags to find the missing attribute value. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@value and normalize-space(@value) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="                 @value                      and                 string-length(@value) &gt; 8   and                 not(contains(@value,'+'))   and not(contains(@value,'-'))">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - The 'time' tag 'value' attribute shall contain a timezone value. "Any time that is more specific than a day SHALL include a timezone". Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 @value                      and                 string-length(@value) &gt; 8   and                 not(contains(@value,'+'))   and not(contains(@value,'-'))</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 not(contains(@value,'.'))    or                 ((string(number(substring-before(@value,'.'))) != string(number(@value))) and                 (string-length(substring-before(@value,'.')) = 14))" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - Incorrect DateTime - The 'time' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 not(contains(@value,'.'))    or                 ((string(number(substring-before(@value,'.'))) != string(number(@value))) and                 (string-length(substring-before(@value,'.')) = 14))</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 not(contains(@value,'+'))    or                 not(contains(@value,'.'))    or                 ((string(number(substring-before(substring-after(@value,'.'),'+'))) != string(number(@value))) and                 (string-length(substring-before(substring-after(@value,'.'),'+')) = 4))" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - Incorrect fraction of second - The 'time' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 not(contains(@value,'+'))    or                 not(contains(@value,'.'))    or                 ((string(number(substring-before(substring-after(@value,'.'),'+'))) != string(number(@value))) and                 (string-length(substring-before(substring-after(@value,'.'),'+')) = 4))</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 not(contains(@value,'-'))    or                 not(contains(@value,'.'))    or                 ((string(number(substring-before(substring-after(@value,'.'),'-'))) != string(number(@value))) and                 (string-length(substring-before(substring-after(@value,'.'),'-')) = 4))" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - Incorrect fraction of second - The 'time' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 not(contains(@value,'-'))    or                 not(contains(@value,'.'))    or                 ((string(number(substring-before(substring-after(@value,'.'),'-'))) != string(number(@value))) and                 (string-length(substring-before(substring-after(@value,'.'),'-')) = 4))</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 contains(@value,'.')         or                 not(contains(@value,'+'))    or                 ((string(number(substring-before(@value,'+'))) != string(number(@value))) and                 (string-length(substring-before(@value,'+')) &gt; 11) and                 (string-length(substring-before(@value,'+')) &lt; 15) and                 (string-length(substring-before(@value,'+')) mod 2 = 0))" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - Incorrect DateTime - The 'time' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 contains(@value,'.')         or                 not(contains(@value,'+'))    or                 ((string(number(substring-before(@value,'+'))) != string(number(@value))) and                 (string-length(substring-before(@value,'+')) &gt; 11) and                 (string-length(substring-before(@value,'+')) &lt; 15) and                 (string-length(substring-before(@value,'+')) mod 2 = 0))</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 contains(@value,'.')         or                 not(contains(@value,'-'))    or                 ((string(number(substring-before(@value,'-'))) != string(number(@value))) and                 (string-length(substring-before(@value,'-')) &gt; 11) and                 (string-length(substring-before(@value,'-')) &lt; 15) and                 (string-length(substring-before(@value,'-')) mod 2 = 0))" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - Incorrect DateTime - The 'time' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 contains(@value,'.')         or                 not(contains(@value,'-'))    or                 ((string(number(substring-before(@value,'-'))) != string(number(@value))) and                 (string-length(substring-before(@value,'-')) &gt; 11) and                 (string-length(substring-before(@value,'-')) &lt; 15) and                 (string-length(substring-before(@value,'-')) mod 2 = 0))</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 not(contains(@value,'+'))    or                 ((string(number(substring-after(@value,'+'))) != string(number(@value))) and                 ((string-length(substring-after(@value,'+')) = 2) or (string-length(substring-after(@value,'+')) = 4)))" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - Incorrect TimeZone - The 'time' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 not(contains(@value,'+'))    or                 ((string(number(substring-after(@value,'+'))) != string(number(@value))) and                 ((string-length(substring-after(@value,'+')) = 2) or (string-length(substring-after(@value,'+')) = 4)))</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 not(contains(@value,'-'))    or                 ((string(number(substring-after(@value,'-'))) != string(number(@value))) and                 ((string-length(substring-after(@value,'-')) = 2) or (string-length(substring-after(@value,'-')) = 4)))" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - Incorrect TimeZone - The 'time' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 not(contains(@value,'-'))    or                 ((string(number(substring-after(@value,'-'))) != string(number(@value))) and                 ((string-length(substring-after(@value,'-')) = 2) or (string-length(substring-after(@value,'-')) = 4)))</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 contains(@value,'.')         or                 contains(@value,'+')         or                 contains(@value,'-')         or                 ((string(number(@value)) != string(number('a'))) and                 (string-length(@value) &gt;= 4))" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - Incorrect DateTime - The 'time' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 contains(@value,'.')         or                 contains(@value,'+')         or                 contains(@value,'-')         or                 ((string(number(@value)) != string(number('a'))) and                 (string-length(@value) &gt;= 4))</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 ((number(substring(@value,1,2)) &gt;= 19) and                 (number(substring(@value,1,2)) &lt; 21))                 " />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - Incorrect Year - The 'time' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 ((number(substring(@value,1,2)) &gt;= 19) and                 (number(substring(@value,1,2)) &lt; 21))                 </xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 string-length(@value) &lt; 5 or                 ((number(substring(@value,5,2)) &gt;= 1) and                 (number(substring(@value,5,2)) &lt; 13))                 " />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - Incorrect Month - The 'time' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 string-length(@value) &lt; 5 or                 ((number(substring(@value,5,2)) &gt;= 1) and                 (number(substring(@value,5,2)) &lt; 13))                 </xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                           or                 normalize-space(@value) = ''          or                 string-length(@value) &lt; 7          or                 number(substring(@value,5,2)) = 2     or                 number(substring(@value,5,2)) = 4     or                 number(substring(@value,5,2)) = 6     or                 number(substring(@value,5,2)) = 9     or                 number(substring(@value,5,2)) = 11    or                 number(substring(@value,5,2)) &gt; 12    or                 ((number(substring(@value,7,2)) &gt;= 1) and                 (number(substring(@value,7,2)) &lt; 32))                 " />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - Incorrect Date - The 'time' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                           or                 normalize-space(@value) = ''          or                 string-length(@value) &lt; 7          or                 number(substring(@value,5,2)) = 2     or                 number(substring(@value,5,2)) = 4     or                 number(substring(@value,5,2)) = 6     or                 number(substring(@value,5,2)) = 9     or                 number(substring(@value,5,2)) = 11    or                 number(substring(@value,5,2)) &gt; 12    or                 ((number(substring(@value,7,2)) &gt;= 1) and                 (number(substring(@value,7,2)) &lt; 32))                 </xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                           or                 normalize-space(@value) = ''          or                 string-length(@value) &lt; 7          or                 number(substring(@value,5,2)) = 1     or                 number(substring(@value,5,2)) = 2     or                 number(substring(@value,5,2)) = 3     or                 number(substring(@value,5,2)) = 5     or                 number(substring(@value,5,2)) = 7     or                 number(substring(@value,5,2)) = 8     or                 number(substring(@value,5,2)) = 10    or                 number(substring(@value,5,2)) = 12    or                 number(substring(@value,5,2)) &gt; 12    or                 ((number(substring(@value,7,2)) &gt;= 1) and                 (number(substring(@value,7,2)) &lt; 31))                 " />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - Incorrect Month - The 'time' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                           or                 normalize-space(@value) = ''          or                 string-length(@value) &lt; 7          or                 number(substring(@value,5,2)) = 1     or                 number(substring(@value,5,2)) = 2     or                 number(substring(@value,5,2)) = 3     or                 number(substring(@value,5,2)) = 5     or                 number(substring(@value,5,2)) = 7     or                 number(substring(@value,5,2)) = 8     or                 number(substring(@value,5,2)) = 10    or                 number(substring(@value,5,2)) = 12    or                 number(substring(@value,5,2)) &gt; 12    or                 ((number(substring(@value,7,2)) &gt;= 1) and                 (number(substring(@value,7,2)) &lt; 31))                 </xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                           or                 normalize-space(@value) = ''          or                 string-length(@value) &lt; 7          or                 number(substring(@value,5,2)) = 1     or                 number(substring(@value,5,2)) = 3     or                 number(substring(@value,5,2)) = 4     or                 number(substring(@value,5,2)) = 5     or                 number(substring(@value,5,2)) = 6     or                 number(substring(@value,5,2)) = 7     or                 number(substring(@value,5,2)) = 8     or                 number(substring(@value,5,2)) = 9     or                 number(substring(@value,5,2)) = 10    or                 number(substring(@value,5,2)) = 11    or                 number(substring(@value,5,2)) = 12    or                 number(substring(@value,5,2)) &gt; 12    or                 (number(substring(@value,1,4)) mod 4) != 0 or                 ((number(substring(@value,7,2)) &gt;= 1) and                 (number(substring(@value,7,2)) &lt; 30))                 " />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - Incorrect Date - The 'time' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                           or                 normalize-space(@value) = ''          or                 string-length(@value) &lt; 7          or                 number(substring(@value,5,2)) = 1     or                 number(substring(@value,5,2)) = 3     or                 number(substring(@value,5,2)) = 4     or                 number(substring(@value,5,2)) = 5     or                 number(substring(@value,5,2)) = 6     or                 number(substring(@value,5,2)) = 7     or                 number(substring(@value,5,2)) = 8     or                 number(substring(@value,5,2)) = 9     or                 number(substring(@value,5,2)) = 10    or                 number(substring(@value,5,2)) = 11    or                 number(substring(@value,5,2)) = 12    or                 number(substring(@value,5,2)) &gt; 12    or                 (number(substring(@value,1,4)) mod 4) != 0 or                 ((number(substring(@value,7,2)) &gt;= 1) and                 (number(substring(@value,7,2)) &lt; 30))                 </xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                           or                 normalize-space(@value) = ''          or                 string-length(@value) &lt; 7          or                 number(substring(@value,5,2)) = 1     or                 number(substring(@value,5,2)) = 3     or                 number(substring(@value,5,2)) = 4     or                 number(substring(@value,5,2)) = 5     or                 number(substring(@value,5,2)) = 6     or                 number(substring(@value,5,2)) = 7     or                 number(substring(@value,5,2)) = 8     or                 number(substring(@value,5,2)) = 9     or                 number(substring(@value,5,2)) = 10    or                 number(substring(@value,5,2)) = 11    or                 number(substring(@value,5,2)) = 12    or                 number(substring(@value,5,2)) &gt; 12    or                 (number(substring(@value,1,4)) mod 4) = 0 or                 ((number(substring(@value,7,2)) &gt;= 1) and                 (number(substring(@value,7,2)) &lt; 29))                 " />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - Incorrect Date - The 'time' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                           or                 normalize-space(@value) = ''          or                 string-length(@value) &lt; 7          or                 number(substring(@value,5,2)) = 1     or                 number(substring(@value,5,2)) = 3     or                 number(substring(@value,5,2)) = 4     or                 number(substring(@value,5,2)) = 5     or                 number(substring(@value,5,2)) = 6     or                 number(substring(@value,5,2)) = 7     or                 number(substring(@value,5,2)) = 8     or                 number(substring(@value,5,2)) = 9     or                 number(substring(@value,5,2)) = 10    or                 number(substring(@value,5,2)) = 11    or                 number(substring(@value,5,2)) = 12    or                 number(substring(@value,5,2)) &gt; 12    or                 (number(substring(@value,1,4)) mod 4) = 0 or                 ((number(substring(@value,7,2)) &gt;= 1) and                 (number(substring(@value,7,2)) &lt; 29))                 </xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 string-length(substring-before(translate(@value, '-', '+'),'+')) &lt; 9 or                 ((number(substring(@value,9,2)) &gt;= 0) and                 (number(substring(@value,9,2)) &lt; 24))                 " />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - Incorrect Hour - The 'time' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 string-length(substring-before(translate(@value, '-', '+'),'+')) &lt; 9 or                 ((number(substring(@value,9,2)) &gt;= 0) and                 (number(substring(@value,9,2)) &lt; 24))                 </xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 string-length(substring-before(translate(@value, '-', '+'),'+')) &lt; 11 or                 ((number(substring(@value,11,2)) &gt;= 0) and                 (number(substring(@value,11,2)) &lt; 60))                 " />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - Incorrect Minute - The 'time' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 string-length(substring-before(translate(@value, '-', '+'),'+')) &lt; 11 or                 ((number(substring(@value,11,2)) &gt;= 0) and                 (number(substring(@value,11,2)) &lt; 60))                 </xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 string-length(substring-before(translate(@value, '-', '+'),'+')) &lt; 13 or                 ((number(substring(@value,13,2)) &gt;= 0) and                 (number(substring(@value,13,2)) &lt; 60))                 " />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - Incorrect Second - The 'time' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 string-length(substring-before(translate(@value, '-', '+'),'+')) &lt; 13 or                 ((number(substring(@value,13,2)) &gt;= 0) and                 (number(substring(@value,13,2)) &lt; 60))                 </xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:low) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - The 'low' tag shall appear only once. Check all 'time/low' tags to find the duplicate tags. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:low) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(cda:high) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - The 'high' tag shall appear only once. Check all 'time/high' tags to find the duplicate tags. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:high) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(cda:centre) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - The 'centre' tag shall appear only once. Check all 'time/centre' tags to find the duplicate tags. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:centre) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(cda:width) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - The 'width' tag shall appear only once. Check all 'time/width' tags to find the duplicate tags. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:width) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="cda:center and (cda:low or cda:high)">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - The 'time' tag shall have 'center' or 'low and/or high' tag but not both. Check all 'time' tags to find the incorrect use of 'centre' tag. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">cda:center and (cda:low or cda:high)</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="                 cda:low  and cda:low/@value            and                 cda:high and cda:high/@value           and                 normalize-space(cda:low/@value)  != '' and                 normalize-space(cda:high/@value) != '' and                 contains(cda:low/@value,'.')           and                 contains(cda:high/@value, '.')         and                 contains(cda:low/@value,'+')           and                 contains(cda:high/@value, '+')         and                 (number(substring-before(cda:low/@value,'.')) +                 number(substring-after(substring-before(cda:low/@value,'+'),'.')) &gt;                 number(substring-before(cda:high/@value,'.')) +                 number(substring-after(substring-before(cda:high/@value,'+'),'.')))">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - The 'low' tag 'value' attribute shall contain a value less than than the 'high' tag 'value' attribute. Check all 'time/low' and 'time/high' tags to find the incorrect attribute. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 cda:low  and cda:low/@value            and                 cda:high and cda:high/@value           and                 normalize-space(cda:low/@value)  != '' and                 normalize-space(cda:high/@value) != '' and                 contains(cda:low/@value,'.')           and                 contains(cda:high/@value, '.')         and                 contains(cda:low/@value,'+')           and                 contains(cda:high/@value, '+')         and                 (number(substring-before(cda:low/@value,'.')) +                 number(substring-after(substring-before(cda:low/@value,'+'),'.')) &gt;                 number(substring-before(cda:high/@value,'.')) +                 number(substring-after(substring-before(cda:high/@value,'+'),'.')))</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="                 cda:low  and cda:low/@value            and                 cda:high and cda:high/@value           and                 normalize-space(cda:low/@value)  != '' and                 normalize-space(cda:high/@value) != '' and                 contains(cda:low/@value,'.')           and                 contains(cda:high/@value, '.')         and                 contains(cda:low/@value,'-')           and                 contains(cda:high/@value, '-')         and                 (number(substring-before(cda:low/@value,'.')) +                 number(substring-after(substring-before(cda:low/@value,'-'),'.')) &gt;                 number(substring-before(cda:high/@value,'.')) +                 number(substring-after(substring-before(cda:high/@value,'-'),'.')))">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - The 'low' tag 'value' attribute shall contain a value less than than the 'high' tag 'value' attribute. Check all 'time/low' and 'time/high' tags to find the incorrect attribute. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 cda:low  and cda:low/@value            and                 cda:high and cda:high/@value           and                 normalize-space(cda:low/@value)  != '' and                 normalize-space(cda:high/@value) != '' and                 contains(cda:low/@value,'.')           and                 contains(cda:high/@value, '.')         and                 contains(cda:low/@value,'-')           and                 contains(cda:high/@value, '-')         and                 (number(substring-before(cda:low/@value,'.')) +                 number(substring-after(substring-before(cda:low/@value,'-'),'.')) &gt;                 number(substring-before(cda:high/@value,'.')) +                 number(substring-after(substring-before(cda:high/@value,'-'),'.')))</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="                 cda:low  and cda:low/@value            and                 cda:high and cda:high/@value           and                 normalize-space(cda:low/@value)  != '' and                 normalize-space(cda:high/@value) != '' and                 contains(cda:low/@value, '+')          and                 contains(cda:high/@value,'+')          and                 (number(substring-before(cda:low/@value,'+')) &gt; number(substring-before(cda:high/@value,'+')))">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - The 'low' tag 'value' attribute shall contain a value less than than the 'high' tag 'value' attribute. Check all 'time/low' and 'time/high' tags to find the incorrect attribute. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 cda:low  and cda:low/@value            and                 cda:high and cda:high/@value           and                 normalize-space(cda:low/@value)  != '' and                 normalize-space(cda:high/@value) != '' and                 contains(cda:low/@value, '+')          and                 contains(cda:high/@value,'+')          and                 (number(substring-before(cda:low/@value,'+')) &gt; number(substring-before(cda:high/@value,'+')))</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="                 cda:low  and cda:low/@value            and                 cda:high and cda:high/@value           and                 normalize-space(cda:low/@value)  != '' and                 normalize-space(cda:high/@value) != '' and                 contains(cda:low/@value, '-')          and                 contains(cda:high/@value,'-')          and                 (number(substring-before(cda:low/@value,'-')) &gt; number(substring-before(cda:high/@value,'-')))">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - The 'low' tag 'value' attribute shall contain a value less than than the 'high' tag 'value' attribute. Check all 'time/low' and 'time/high' tags to find the incorrect attribute. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 cda:low  and cda:low/@value            and                 cda:high and cda:high/@value           and                 normalize-space(cda:low/@value)  != '' and                 normalize-space(cda:high/@value) != '' and                 contains(cda:low/@value, '-')          and                 contains(cda:high/@value,'-')          and                 (number(substring-before(cda:low/@value,'-')) &gt; number(substring-before(cda:high/@value,'-')))</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="                 cda:low  and cda:low/@value            and                 cda:high and cda:high/@value           and                 normalize-space(cda:low/@value)  != '' and                 normalize-space(cda:high/@value) != '' and                 not(contains(cda:low/@value, '+'))     and                 not(contains(cda:high/@value,'+'))     and                 not(contains(cda:low/@value, '-'))     and                 not(contains(cda:high/@value,'-'))     and                 (number(cda:low/@value) &gt; number(cda:high/@value))">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - The 'low' tag 'value' attribute shall contain a value less than than the 'high' tag 'value' attribute. Check all 'time/low' and 'time/high' tags to find the incorrect attribute. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 cda:low  and cda:low/@value            and                 cda:high and cda:high/@value           and                 normalize-space(cda:low/@value)  != '' and                 normalize-space(cda:high/@value) != '' and                 not(contains(cda:low/@value, '+'))     and                 not(contains(cda:high/@value,'+'))     and                 not(contains(cda:low/@value, '-'))     and                 not(contains(cda:high/@value,'-'))     and                 (number(cda:low/@value) &gt; number(cda:high/@value))</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M11" />
  </xsl:template>
  <xsl:template match="             cda:time/cda:low | cda:time/cda:high | cda:time/cda:centre |             ext:time/cda:low | ext:time/cda:high | ext:time/cda:centre |             cda:birthTime/cda:low | cda:birthTime/cda:high | cda:birthTime/cda:centre |             ext:birthTime/cda:low | ext:birthTime/cda:high | ext:birthTime/cda:centre |             cda:deceasedTime/cda:low | cda:deceasedTime/cda:high | cda:deceasedTime/cda:centre |             ext:deceasedTime/cda:low | ext:deceasedTime/cda:high | ext:deceasedTime/cda:centre |             cda:effectiveTime/cda:low | cda:effectiveTime/cda:high | cda:effectiveTime/cda:centre |             ext:effectiveTime/cda:low | ext:effectiveTime/cda:high | ext:effectiveTime/cda:centre" priority="3996" mode="M11">
    <xsl:if test="                 ../@xsi:type and                 ../@xsi:type != 'TS' and                 ../@xsi:type != 'IVL_TS' and                 ../@xsi:type != 'PIVL_TS'">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - The 'time' tag 'xsi:type' attribute shall contain the value 'TS', 'IVL_TS' or 'PIVL_TS'. Check all 'time' tags to find the attribute. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 ../@xsi:type and                 ../@xsi:type != 'TS' and                 ../@xsi:type != 'IVL_TS' and                 ../@xsi:type != 'PIVL_TS'</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="@value" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - The 'time/low' or 'time/high' or 'time/centre' tag 'value' attribute is missing. Check all 'time' tags to find the missing attribute. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@value</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="@value and normalize-space(@value) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - The 'time/low' or 'time/high' or 'time/centre' tag 'value' attribute shall contain a value. Check all 'time' tags to find the missing attribute value. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@value and normalize-space(@value) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="@value                and                 string-length(@value) &gt; 8   and                 not(contains(@value,'+'))   and not(contains(@value,'-'))">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - The 'time/low' or 'time/high' or 'time/centre' tag 'value' attribute shall contain a timezone value. "Any time that is more specific than a day SHALL include a timezone". Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@value                and                 string-length(@value) &gt; 8   and                 not(contains(@value,'+'))   and not(contains(@value,'-'))</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 not(contains(@value,'.'))    or                 ((string(number(substring-before(@value,'.'))) != string(number(@value))) and                 (string-length(substring-before(@value,'.')) = 14))" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - Incorrect DateTime - The 'time/low' or 'time/high' or 'time/centre' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 not(contains(@value,'.'))    or                 ((string(number(substring-before(@value,'.'))) != string(number(@value))) and                 (string-length(substring-before(@value,'.')) = 14))</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 not(contains(@value,'+'))    or                 not(contains(@value,'.'))    or                 ((string(number(substring-before(substring-after(@value,'.'),'+'))) != string(number(@value))) and                 (string-length(substring-before(substring-after(@value,'.'),'+')) = 4))" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - Incorrect fraction of second - The 'time/low' or 'time/high' or 'time/centre' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 not(contains(@value,'+'))    or                 not(contains(@value,'.'))    or                 ((string(number(substring-before(substring-after(@value,'.'),'+'))) != string(number(@value))) and                 (string-length(substring-before(substring-after(@value,'.'),'+')) = 4))</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 not(contains(@value,'-'))    or                 not(contains(@value,'.'))    or                 ((string(number(substring-before(substring-after(@value,'.'),'-'))) != string(number(@value))) and                 (string-length(substring-before(substring-after(@value,'.'),'-')) = 4))" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - Incorrect fraction of second - The 'time/low' or 'time/high' or 'time/centre' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 not(contains(@value,'-'))    or                 not(contains(@value,'.'))    or                 ((string(number(substring-before(substring-after(@value,'.'),'-'))) != string(number(@value))) and                 (string-length(substring-before(substring-after(@value,'.'),'-')) = 4))</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 contains(@value,'.')         or                 not(contains(@value,'+'))    or                 ((string(number(substring-before(@value,'+'))) != string(number(@value))) and                 (string-length(substring-before(@value,'+')) &gt; 11) and                 (string-length(substring-before(@value,'+')) &lt; 15) and                 (string-length(substring-before(@value,'+')) mod 2 = 0))" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - Incorrect DateTime - The 'time/low' or 'time/high' or 'time/centre' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 contains(@value,'.')         or                 not(contains(@value,'+'))    or                 ((string(number(substring-before(@value,'+'))) != string(number(@value))) and                 (string-length(substring-before(@value,'+')) &gt; 11) and                 (string-length(substring-before(@value,'+')) &lt; 15) and                 (string-length(substring-before(@value,'+')) mod 2 = 0))</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 contains(@value,'.')         or                 not(contains(@value,'-'))    or                 ((string(number(substring-before(@value,'-'))) != string(number(@value))) and                 (string-length(substring-before(@value,'-')) &gt; 11) and                 (string-length(substring-before(@value,'-')) &lt; 15) and                 (string-length(substring-before(@value,'-')) mod 2 = 0))" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - Incorrect DateTime - The 'time/low' or 'time/high' or 'time/centre' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 contains(@value,'.')         or                 not(contains(@value,'-'))    or                 ((string(number(substring-before(@value,'-'))) != string(number(@value))) and                 (string-length(substring-before(@value,'-')) &gt; 11) and                 (string-length(substring-before(@value,'-')) &lt; 15) and                 (string-length(substring-before(@value,'-')) mod 2 = 0))</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 not(contains(@value,'+'))    or                 ((string(number(substring-after(@value,'+'))) != string(number(@value))) and                 ((string-length(substring-after(@value,'+')) = 2) or (string-length(substring-after(@value,'+')) = 4)))" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - Incorrect TimeZone - The 'time/low' or 'time/high' or 'time/centre' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 not(contains(@value,'+'))    or                 ((string(number(substring-after(@value,'+'))) != string(number(@value))) and                 ((string-length(substring-after(@value,'+')) = 2) or (string-length(substring-after(@value,'+')) = 4)))</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 not(contains(@value,'-'))    or                 ((string(number(substring-after(@value,'-'))) != string(number(@value))) and                 ((string-length(substring-after(@value,'-')) = 2) or (string-length(substring-after(@value,'-')) = 4)))" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - Incorrect TimeZone - The 'time/low' or 'time/high' or 'time/centre' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 not(contains(@value,'-'))    or                 ((string(number(substring-after(@value,'-'))) != string(number(@value))) and                 ((string-length(substring-after(@value,'-')) = 2) or (string-length(substring-after(@value,'-')) = 4)))</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 contains(@value,'.')         or                 contains(@value,'+')         or                 contains(@value,'-')         or                 ((string(number(@value)) != string(number('a'))) and                 (string-length(@value) &gt;= 4))" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - Incorrect DateTime - The 'time/low' or 'time/high' or 'time/centre' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 contains(@value,'.')         or                 contains(@value,'+')         or                 contains(@value,'-')         or                 ((string(number(@value)) != string(number('a'))) and                 (string-length(@value) &gt;= 4))</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 ((number(substring(@value,1,2)) &gt;= 19) and                 (number(substring(@value,1,2)) &lt; 21))                 " />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - Incorrect Year - The 'time/low' or 'time/high' or 'time/centre' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 ((number(substring(@value,1,2)) &gt;= 19) and                 (number(substring(@value,1,2)) &lt; 21))                 </xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 string-length(@value) &lt; 5 or                 ((number(substring(@value,5,2)) &gt;= 1) and                 (number(substring(@value,5,2)) &lt; 13))                 " />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - Incorrect Month - The 'time/low' or 'time/high' or 'time/centre' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 string-length(@value) &lt; 5 or                 ((number(substring(@value,5,2)) &gt;= 1) and                 (number(substring(@value,5,2)) &lt; 13))                 </xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                           or                 normalize-space(@value) = ''          or                 string-length(@value) &lt; 7          or                 number(substring(@value,5,2)) = 2     or                 number(substring(@value,5,2)) = 4     or                 number(substring(@value,5,2)) = 6     or                 number(substring(@value,5,2)) = 9     or                 number(substring(@value,5,2)) = 11    or                 number(substring(@value,5,2)) &gt; 12    or                 ((number(substring(@value,7,2)) &gt;= 1) and                 (number(substring(@value,7,2)) &lt; 32))                 " />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - Incorrect Date - The 'time/low' or 'time/high' or 'time/centre' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                           or                 normalize-space(@value) = ''          or                 string-length(@value) &lt; 7          or                 number(substring(@value,5,2)) = 2     or                 number(substring(@value,5,2)) = 4     or                 number(substring(@value,5,2)) = 6     or                 number(substring(@value,5,2)) = 9     or                 number(substring(@value,5,2)) = 11    or                 number(substring(@value,5,2)) &gt; 12    or                 ((number(substring(@value,7,2)) &gt;= 1) and                 (number(substring(@value,7,2)) &lt; 32))                 </xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                           or                 normalize-space(@value) = ''          or                 string-length(@value) &lt; 7          or                 number(substring(@value,5,2)) = 1     or                 number(substring(@value,5,2)) = 2     or                 number(substring(@value,5,2)) = 3     or                 number(substring(@value,5,2)) = 5     or                 number(substring(@value,5,2)) = 7     or                 number(substring(@value,5,2)) = 8     or                 number(substring(@value,5,2)) = 10    or                 number(substring(@value,5,2)) = 12    or                 number(substring(@value,5,2)) &gt; 12    or                 ((number(substring(@value,7,2)) &gt;= 1) and                 (number(substring(@value,7,2)) &lt; 31))                 " />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - Incorrect Month - The 'time/low' or 'time/high' or 'time/centre' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                           or                 normalize-space(@value) = ''          or                 string-length(@value) &lt; 7          or                 number(substring(@value,5,2)) = 1     or                 number(substring(@value,5,2)) = 2     or                 number(substring(@value,5,2)) = 3     or                 number(substring(@value,5,2)) = 5     or                 number(substring(@value,5,2)) = 7     or                 number(substring(@value,5,2)) = 8     or                 number(substring(@value,5,2)) = 10    or                 number(substring(@value,5,2)) = 12    or                 number(substring(@value,5,2)) &gt; 12    or                 ((number(substring(@value,7,2)) &gt;= 1) and                 (number(substring(@value,7,2)) &lt; 31))                 </xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                           or                 normalize-space(@value) = ''          or                 string-length(@value) &lt; 7          or                 number(substring(@value,5,2)) = 1     or                 number(substring(@value,5,2)) = 3     or                 number(substring(@value,5,2)) = 4     or                 number(substring(@value,5,2)) = 5     or                 number(substring(@value,5,2)) = 6     or                 number(substring(@value,5,2)) = 7     or                 number(substring(@value,5,2)) = 8     or                 number(substring(@value,5,2)) = 9     or                 number(substring(@value,5,2)) = 10    or                 number(substring(@value,5,2)) = 11    or                 number(substring(@value,5,2)) = 12    or                 number(substring(@value,5,2)) &gt; 12    or                 (number(substring(@value,1,4)) mod 4) != 0 or                 ((number(substring(@value,7,2)) &gt;= 1) and                 (number(substring(@value,7,2)) &lt; 30))                 " />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - Incorrect Date - The 'time/low' or 'time/high' or 'time/centre' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                           or                 normalize-space(@value) = ''          or                 string-length(@value) &lt; 7          or                 number(substring(@value,5,2)) = 1     or                 number(substring(@value,5,2)) = 3     or                 number(substring(@value,5,2)) = 4     or                 number(substring(@value,5,2)) = 5     or                 number(substring(@value,5,2)) = 6     or                 number(substring(@value,5,2)) = 7     or                 number(substring(@value,5,2)) = 8     or                 number(substring(@value,5,2)) = 9     or                 number(substring(@value,5,2)) = 10    or                 number(substring(@value,5,2)) = 11    or                 number(substring(@value,5,2)) = 12    or                 number(substring(@value,5,2)) &gt; 12    or                 (number(substring(@value,1,4)) mod 4) != 0 or                 ((number(substring(@value,7,2)) &gt;= 1) and                 (number(substring(@value,7,2)) &lt; 30))                 </xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                           or                 normalize-space(@value) = ''          or                 string-length(@value) &lt; 7          or                 number(substring(@value,5,2)) = 1     or                 number(substring(@value,5,2)) = 3     or                 number(substring(@value,5,2)) = 4     or                 number(substring(@value,5,2)) = 5     or                 number(substring(@value,5,2)) = 6     or                 number(substring(@value,5,2)) = 7     or                 number(substring(@value,5,2)) = 8     or                 number(substring(@value,5,2)) = 9     or                 number(substring(@value,5,2)) = 10    or                 number(substring(@value,5,2)) = 11    or                 number(substring(@value,5,2)) = 12    or                 number(substring(@value,5,2)) &gt; 12    or                 (number(substring(@value,1,4)) mod 4) = 0 or                 ((number(substring(@value,7,2)) &gt;= 1) and                 (number(substring(@value,7,2)) &lt; 29))                 " />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - Incorrect Date - The 'time/low' or 'time/high' or 'time/centre' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                           or                 normalize-space(@value) = ''          or                 string-length(@value) &lt; 7          or                 number(substring(@value,5,2)) = 1     or                 number(substring(@value,5,2)) = 3     or                 number(substring(@value,5,2)) = 4     or                 number(substring(@value,5,2)) = 5     or                 number(substring(@value,5,2)) = 6     or                 number(substring(@value,5,2)) = 7     or                 number(substring(@value,5,2)) = 8     or                 number(substring(@value,5,2)) = 9     or                 number(substring(@value,5,2)) = 10    or                 number(substring(@value,5,2)) = 11    or                 number(substring(@value,5,2)) = 12    or                 number(substring(@value,5,2)) &gt; 12    or                 (number(substring(@value,1,4)) mod 4) = 0 or                 ((number(substring(@value,7,2)) &gt;= 1) and                 (number(substring(@value,7,2)) &lt; 29))                 </xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 string-length(substring-before(translate(@value, '-', '+'),'+')) &lt; 9 or                 ((number(substring(@value,9,2)) &gt;= 0) and                 (number(substring(@value,9,2)) &lt; 24))                 " />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - Incorrect Hour - The 'time/low' or 'time/high' or 'time/centre' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 string-length(substring-before(translate(@value, '-', '+'),'+')) &lt; 9 or                 ((number(substring(@value,9,2)) &gt;= 0) and                 (number(substring(@value,9,2)) &lt; 24))                 </xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 string-length(substring-before(translate(@value, '-', '+'),'+')) &lt; 11 or                 ((number(substring(@value,11,2)) &gt;= 0) and                 (number(substring(@value,11,2)) &lt; 60))                 " />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - Incorrect Minute - The 'time/low' or 'time/high' or 'time/centre' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 string-length(substring-before(translate(@value, '-', '+'),'+')) &lt; 11 or                 ((number(substring(@value,11,2)) &gt;= 0) and                 (number(substring(@value,11,2)) &lt; 60))                 </xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value)                  or                 normalize-space(@value) = '' or                 string-length(substring-before(translate(@value, '-', '+'),'+')) &lt; 13 or                 ((number(substring(@value,13,2)) &gt;= 0) and                 (number(substring(@value,13,2)) &lt; 60))                 " />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - Incorrect Second - The 'time/low' or 'time/high' or 'time/centre' tag 'value' attribute shall be a number formatted as 'YYYYMMDDHHMMSS.UUUU[+|-ZZzz]'. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value)                  or                 normalize-space(@value) = '' or                 string-length(substring-before(translate(@value, '-', '+'),'+')) &lt; 13 or                 ((number(substring(@value,13,2)) &gt;= 0) and                 (number(substring(@value,13,2)) &lt; 60))                 </xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M11" />
  </xsl:template>
  <xsl:template match="             cda:time/cda:width |             ext:time/cda:width |             cda:birthTime/cda:width |             ext:birthTime/cda:width |             cda:deceasedTime/cda:width |             ext:deceasedTime/cda:width |             cda:effectiveTime/cda:width |             ext:effectiveTime/cda:width" priority="3995" mode="M11">
    <xsl:if test="                 ../@xsi:type and                 ../@xsi:type != 'TS' and                 ../@xsi:type != 'IVL_TS' and                 ../@xsi:type != 'PIVL_TS'">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - The 'time' tag 'xsi:type' attribute shall contain the value 'TS', 'IVL_TS' or 'IVL_TS'. Check all 'time' tags to find the attribute. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 ../@xsi:type and                 ../@xsi:type != 'TS' and                 ../@xsi:type != 'IVL_TS' and                 ../@xsi:type != 'PIVL_TS'</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="@value" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - The 'time/width' tag 'value' attribute is missing. Check all 'time/width' tags to find the missing attribute. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@value</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="@value and normalize-space(@value) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - The 'time/width' tag 'value' attribute shall contain a value. Check all 'time/width' tags to find the missing value. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@value and normalize-space(@value) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="@unit and normalize-space(@unit) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "time" tag - The 'time/width' tag 'unit' attribute shall contain a value. Check all 'time/width' tags to find the missing value. Refer to section 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@unit and normalize-space(@unit) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M11" />
  </xsl:template>
  <xsl:template match="ext:asEntityIdentifier" priority="3994" mode="M11">
    <xsl:choose>
      <xsl:when test="@classCode" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "ext:asEntityIdentifier" tag - The 'ext:asEntityIdentifier' tag 'classCode' attribute is missing. Check all 'ext:asEntityIdentifier' tags to find the missing 'classCode' attribute. Refer to section 8.4 Entity Identifier of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@classCode</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="not(@classCode) or normalize-space(@classCode) != ''" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "ext:asEntityIdentifier" tag - The 'ext:asEntityIdentifier' tag 'classCode' attribute shall contain a value. Check all 'ext:asEntityIdentifier' tags to find the missing 'classCode' attribute. Refer to section 8.4 Entity Identifier of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">not(@classCode) or normalize-space(@classCode) != ''</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@classCode) or                 normalize-space(@classCode) = '' or                 @classCode='IDENT'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "ext:asEntityIdentifier" tag - The 'ext:asEntityIdentifier' tag 'classCode' attribute shall be 'IDENT'. Check all 'ext:asEntityIdentifier' tags to find the incorrect 'classCode' attribute. Refer to section 8.4 Entity Identifier of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@classCode) or                 normalize-space(@classCode) = '' or                 @classCode='IDENT'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="ext:id" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "ext:id" tag - The 'ext:id' tag is missing. Check all "ext:asEntityIdentifier' tags to find the missing 'id' tag. Refer to section 8.4 Entity Identifier of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">ext:id</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(ext:id) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'id' tag - The 'id' tag shall appear only once. Check all 'ext:asEntityIdentifier' tags to find the duplicate 'id' tag. Refer to section 8.4 Entity Identifier of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(ext:id) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(ext:code) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - The 'ext:code' tag shall appear only once. Check all 'ext:asEntityIdentifier' tag to find the duplicate 'code' tag. Refer to section 8.4 Entity Identifier of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(ext:code) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(ext:assigningGeographicArea) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'assigningGeographicArea' tag - The 'assigningGeographicArea' tag shall appear only once. Check all 'ext:assigningGeographicArea' tags to find the duplicate 'assigningGeographicArea' tag. Refer to section 8.4 Entity Identifier of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(ext:assigningGeographicArea) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M11" />
  </xsl:template>
  <xsl:template match="ext:assigningGeographicArea" priority="3993" mode="M11">
    <xsl:choose>
      <xsl:when test="@classCode" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "ext:asEntityIdentifier/ext:assigningGeographicArea" tag - The 'assigningGeographicArea' tag 'classCode' attribute is missing. Check all 'ext:asEntityIdentifier/ext:assigningGeographicArea' tags to find the missing 'classCode' attribute. Refer to section 8.4 Entity Identifier of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@classCode</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="not(@classCode) or normalize-space(@classCode) != ''" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "ext:asEntityIdentifier/ext:assigningGeographicArea" tag - The 'assigningGeographicArea' tag 'classCode' attribute shall contain a value. Check all 'ext:asEntityIdentifier/ext:assigningGeographicArea' tags to find the missing 'classCode' attribute. Refer to section 8.4 Entity Identifier of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">not(@classCode) or normalize-space(@classCode) != ''</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@classCode) or                 normalize-space(@classCode) = '' or                 @classCode='PLC'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "ext:asEntityIdentifier/ext:assigningGeographicArea" tag - The 'assigningGeographicArea' tag 'classCode' attribute shall be 'PLC'. Check all 'ext:asEntityIdentifier/ext:assigningGeographicArea' tags to find the incorrect 'classCode' attribute. Refer to section 8.4 Entity Identifier of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@classCode) or                 normalize-space(@classCode) = '' or                 @classCode='PLC'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="ext:name and normalize-space(ext:name) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "ext:asEntityIdentifier/ext:assigningGeographicArea" tag - The 'name' tag shall contain a value. Check all 'ext:name' tag to find the missing value. Refer to section 8.4 Entity Identifier of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">ext:name and normalize-space(ext:name) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="                 ext:name and                 normalize-space(ext:name) != '' and                 not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'AS_5017-2006_Health_Care_Client_Identifier_Geographic_Area']                 /code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =                 translate(current()/ext:name, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')])">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "ext:asEntityIdentifier/ext:assigningGeographicArea" tag - The 'name' tag shall be as per AS 5017-2006: Health Care Client Identifier Geographic Area. It shall be the range and extent that the identifier applies to the object with which it is associated that is populated directly from the geographic area. This shall NOT be used for machine readability purposes. Check all 'ext:name' tag to find the incorrect value. Refer to section 8.4 Entity Identifier of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 ext:name and                 normalize-space(ext:name) != '' and                 not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'AS_5017-2006_Health_Care_Client_Identifier_Geographic_Area']                 /code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =                 translate(current()/ext:name, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')])</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M11" />
  </xsl:template>
  <xsl:template match="cda:name[not(                       ancestor::cda:product or                       ancestor::cda:receivedOrganization or                       ancestor::cda:representedOrganization or                       ancestor::cda:representedCustodianOrganization or                       ancestor::cda:scopingOrganization or                       ancestor::cda:serviceProviderOrganization or                       ancestor::cda:targetSiteCode or                       ancestor::ext:employerOrganization)]" priority="3992" mode="M11">
    <xsl:if test="cda:prefix and normalize-space(cda:prefix ) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "name" tag - The 'prefix' tag shall contain a value. Check all 'cda:name/cda:prefix' tags to find the missing value. Refer to section 8.5 Person Name of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">cda:prefix and normalize-space(cda:prefix ) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="cda:family" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "name" tag - The 'family' tag is missing. Check all 'cda:name' tags to find the missing 'family' child tag. Refer to section 8.5 Person Name of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:family</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:family) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "name" tag - The 'family' tag shall appear only once. Check all 'cda:name' tags to find the duplicate 'family' child tag. Refer to section 8.5 Person Name of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:family) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="not(cda:family) or normalize-space(cda:family) !=  ''" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "name" tag - The 'family' tag shall contain a value. Check all 'cda:name/cda:family' tags to find the missing value. Refer to section 8.5 Person Name of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">not(cda:family) or normalize-space(cda:family) !=  ''</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="cda:given and normalize-space(cda:given) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "name" tag - The 'given' tag shall contain a value. Check all 'cda:name/cda:given' tags to find the missing value. Refer to section 8.5 Person Name of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">cda:given and normalize-space(cda:given) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="cda:suffix and normalize-space(cda:suffix) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "name" tag - The 'suffix' tag shall contain a value. Check all 'cda:name/cda:suffix' tags to find the missing value. Refer to section 8.5 Person Name of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">cda:suffix and normalize-space(cda:suffix) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="@use and                 normalize-space(@use) != '' and                 not(contains(@use, ' ')) and                 not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Health_Care_Client_Name_Usage']/code[                     (@code = (current()/@use)) or                     (@alternativeCode = (current()/@use)) or                     (@hl7Code  = (current()/@use))                 ])">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "name" tag - The 'name' tag 'use' attribute shall be coded as per AS 5017-2006: Health Care Client Name Usage. Check all 'cda:name' tags to find the incorrect 'use' attribute. Refer to section 8.5 Person Name of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@use and                 normalize-space(@use) != '' and                 not(contains(@use, ' ')) and                 not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Health_Care_Client_Name_Usage']/code[                     (@code = (current()/@use)) or                     (@alternativeCode = (current()/@use)) or                     (@hl7Code  = (current()/@use))                 ])</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="                 @use and                 normalize-space(@use) != '' and                 contains(@use, ' ') and                 not(contains(substring-after(@use, ' '), ' ')) and (                     not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Health_Care_Client_Name_Usage']/code[                         (@code = substring-before(current()/@use,' ')) or                         (@alternativeCode = substring-before(current()/@use,' ')) or                         (@hl7Code = substring-before(current()/@use,' '))                     ]) or                     not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Health_Care_Client_Name_Usage']/code[                         (@code = substring-after(current()/@use,' ')) or                         (@alternativeCode = substring-after(current()/@use,' ')) or                         (@hl7Code = substring-after(current()/@use,' '))                     ])                 )">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "name" tag - The 'name' tag 'use' attribute shall be coded as per AS 5017-2006: Health Care Client Name Usage. Check all 'cda:name' tags to find the incorrect 'use' attribute. Refer to section 8.5 Person Name of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 @use and                 normalize-space(@use) != '' and                 contains(@use, ' ') and                 not(contains(substring-after(@use, ' '), ' ')) and (                     not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Health_Care_Client_Name_Usage']/code[                         (@code = substring-before(current()/@use,' ')) or                         (@alternativeCode = substring-before(current()/@use,' ')) or                         (@hl7Code = substring-before(current()/@use,' '))                     ]) or                     not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Health_Care_Client_Name_Usage']/code[                         (@code = substring-after(current()/@use,' ')) or                         (@alternativeCode = substring-after(current()/@use,' ')) or                         (@hl7Code = substring-after(current()/@use,' '))                     ])                 )</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="                 @use and                 normalize-space(@use) != '' and                 contains(@use, ' ') and                 not(contains(substring-after(substring-after(@use, ' '), ' '), ' ')) and (                     not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Health_Care_Client_Name_Usage']/code[                         (@code = substring-before(current()/@use,' ')) or                         (@alternativeCode = substring-before(current()/@use,' ')) or                         (@hl7Code = substring-before(current()/@use,' '))                     ]) or                     not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Health_Care_Client_Name_Usage']/code[                         (@code = substring-before(substring-after(current()/@use,' '),' ')) or                         (@alternativeCode = substring-before(substring-after(current()/@use,' '),' ')) or                         (@hl7Code = substring-before(substring-after(current()/@use,' '),' '))                     ]) or                     not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Health_Care_Client_Name_Usage']/code[                         (@code = substring-after(substring-after(current()/@use,' '),' ')) or                         (@alternativeCode = substring-after(substring-after(current()/@use,' '),' ')) or                         (@hl7Code = substring-after(substring-after(current()/@use,' '),' '))                     ])                 )">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for "name" tag - The 'name' tag 'use' attribute shall be coded as per AS 5017-2006: Health Care Client Name Usage. Check all 'cda:name' tags to find the incorrect 'use' attribute. Refer to section 8.5 Person Name of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 @use and                 normalize-space(@use) != '' and                 contains(@use, ' ') and                 not(contains(substring-after(substring-after(@use, ' '), ' '), ' ')) and (                     not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Health_Care_Client_Name_Usage']/code[                         (@code = substring-before(current()/@use,' ')) or                         (@alternativeCode = substring-before(current()/@use,' ')) or                         (@hl7Code = substring-before(current()/@use,' '))                     ]) or                     not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Health_Care_Client_Name_Usage']/code[                         (@code = substring-before(substring-after(current()/@use,' '),' ')) or                         (@alternativeCode = substring-before(substring-after(current()/@use,' '),' ')) or                         (@hl7Code = substring-before(substring-after(current()/@use,' '),' '))                     ]) or                     not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Health_Care_Client_Name_Usage']/code[                         (@code = substring-after(substring-after(current()/@use,' '),' ')) or                         (@alternativeCode = substring-after(substring-after(current()/@use,' '),' ')) or                         (@hl7Code = substring-after(substring-after(current()/@use,' '),' '))                     ])                 )</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M11" />
  </xsl:template>
  <xsl:template match="cda:telecom" priority="3991" mode="M11">
    <xsl:choose>
      <xsl:when test="@value or @nullFlavor" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'cda:telecom' - "Electronic Communication Medium or Electronic Communication Address" - The 'telecom' tag shall have 'value' or 'nullFlavor' attribute. Check all 'cda:telecom' tags 'value' or 'nullFlavor' attributes to find the missing value. Refer to section 8.7 Electronic Communication Detail of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@value or @nullFlavor</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="not(@value) or normalize-space(@value) !=''" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'cda:telecom' - "Electronic Communication Medium or Electronic Communication Address" - The 'telecom' tag 'value' attribute shall contain a value. Check all 'cda:telecom' tags 'value' attributes to find the missing value. Refer to 8.7 Electronic Communication Detail of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">not(@value) or normalize-space(@value) !=''</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="not(@nullFlavor) or normalize-space(@nullFlavor) !=''" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'cda:telecom' - "Electronic Communication Medium or Electronic Communication Address" - The 'telecom' tag 'nullFlavor' attribute shall contain a value. Check all 'cda:telecom' tags 'nullFlavor' attributes to find the missing value. Refer to 8.7 Electronic Communication Detail of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">not(@nullFlavor) or normalize-space(@nullFlavor) !=''</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="not(@value) or contains(@value,':')" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'cda:telecom' - "Electronic Communication Medium or Electronic Communication Address" - The 'telecom' tag 'value' attribute shall contain a ":". Check all 'cda:telecom' tags 'value' attributes to find the incorrect value. Refer to 8.7 Electronic Communication Detail of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">not(@value) or contains(@value,':')</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@value) or                 document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Health_Care_Client_Electronic_Communication_Medium']/code[                     (@code            = substring-before(current()/@value,':')) or                     (@alternativeCode = substring-before(current()/@value,':')) or                     (@hl7Code         = substring-before(current()/@value,':'))                 ]                 " />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'cda:telecom' - "Electronic Communication Medium or Electronic Communication Address" - The 'telecom' tag 'value' attribute shall be as per AS 5017-2006: Health Care Client Electronic Communication Medium. Check all 'cda:telecom' tags 'value' attributes to find the incorrect value. Refer to section 8.7 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@value) or                 document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Health_Care_Client_Electronic_Communication_Medium']/code[                     (@code            = substring-before(current()/@value,':')) or                     (@alternativeCode = substring-before(current()/@value,':')) or                     (@hl7Code         = substring-before(current()/@value,':'))                 ]                 </xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="                 @use and normalize-space(@use) = ''                 ">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'cda:telecom' - "Electronic Communication Usage Code" - The 'telecom' tag 'use' attribute shall contain a value. Check all 'cda:telecom' tags 'use' attributes to find the incorrect value. Refer to section 8.7 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 @use and normalize-space(@use) = ''                 </xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="                 @use and normalize-space(@use) != '' and                 not(contains(@use, ' ')) and                 not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'TelecommunicationAddressUse']/code[(@code = current()/@use)])                 ">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'cda:telecom' - "Electronic Communication Usage Code" - The 'telecom' tag 'use' attribute shall be as per HL7 v3: TelecommunicationAddressUse. Check all 'cda:telecom' tags 'use' attributes to find the incorrect value. Refer to section 8.7 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 @use and normalize-space(@use) != '' and                 not(contains(@use, ' ')) and                 not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'TelecommunicationAddressUse']/code[(@code = current()/@use)])                 </xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="                 @use and normalize-space(@use) != '' and                 contains(@use, ' ') and                 not(contains(substring-after(@use, ' '), ' ')) and (                 not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'TelecommunicationAddressUse']/code[(@code = substring-before(current()/@use,' '))]) or                 not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'TelecommunicationAddressUse']/code[(@code = substring-after(current()/@use,' '))])                 )">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'cda:telecom' - "Electronic Communication Usage Code" - The 'telecom' tag 'use' attribute shall be as per HL7 v3: TelecommunicationAddressUse. Check all 'cda:telecom' tags 'use' attributes to find the incorrect value. Refer to section 8.7 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 @use and normalize-space(@use) != '' and                 contains(@use, ' ') and                 not(contains(substring-after(@use, ' '), ' ')) and (                 not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'TelecommunicationAddressUse']/code[(@code = substring-before(current()/@use,' '))]) or                 not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'TelecommunicationAddressUse']/code[(@code = substring-after(current()/@use,' '))])                 )</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="                 @value and                 (document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Health_Care_Client_Electronic_Communication_Medium']/code[                     (@code            = substring-before(current()/@value,':')) or                     (@alternativeCode = substring-before(current()/@value,':'))                 ]/@alternativeCode = 'M')                 and not (@use)                 ">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'cda:telecom' - "Electronic Communication Usage Code" - The 'telecom' tag shall have 'value' and 'use' attributes with 'use' attribute as 'MC' when 'value' attribute is 'Mobile'. Refer to section 8.7 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 @value and                 (document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Health_Care_Client_Electronic_Communication_Medium']/code[                     (@code            = substring-before(current()/@value,':')) or                     (@alternativeCode = substring-before(current()/@value,':'))                 ]/@alternativeCode = 'M')                 and not (@use)                 </xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="                 @value and                 (document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Health_Care_Client_Electronic_Communication_Medium']/code[                     (@code            = substring-before(current()/@value,':')) or                     (@alternativeCode = substring-before(current()/@value,':'))                 ]/@alternativeCode = 'P')                 and not(@use)                 ">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'cda:telecom' - "Electronic Communication Usage Code" - The 'telecom' tag shall have 'value' and 'use' attributes with 'use' attribute as 'PG' when 'value' attribute is 'Pager'. Refer to section 8.7 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 @value and                 (document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Health_Care_Client_Electronic_Communication_Medium']/code[                     (@code            = substring-before(current()/@value,':')) or                     (@alternativeCode = substring-before(current()/@value,':'))                 ]/@alternativeCode = 'P')                 and not(@use)                 </xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="                 @value and                 @use and normalize-space(@use) != '' and                 not(contains(@use, ' ')) and                 (document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Health_Care_Client_Electronic_Communication_Medium']/code[                     (@code            = substring-before(current()/@value,':')) or                     (@alternativeCode = substring-before(current()/@value,':'))                 ]/@alternativeCode = 'M') and                 (current()/@use != 'MC')                 ">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'cda:telecom' - "Electronic Communication Usage Code" - The 'telecom' tag shall have 'value' and 'use' attributes with 'use' attribute as 'MC' when 'value' attribute is 'Mobile'. Refer to section 8.7 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 @value and                 @use and normalize-space(@use) != '' and                 not(contains(@use, ' ')) and                 (document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Health_Care_Client_Electronic_Communication_Medium']/code[                     (@code            = substring-before(current()/@value,':')) or                     (@alternativeCode = substring-before(current()/@value,':'))                 ]/@alternativeCode = 'M') and                 (current()/@use != 'MC')                 </xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="                 @value and                 @use and normalize-space(@use) != '' and                 not(contains(@use, ' ')) and                 (document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Health_Care_Client_Electronic_Communication_Medium']/code[                     (@code            = substring-before(current()/@value,':')) or                     (@alternativeCode = substring-before(current()/@value,':'))                 ]/@alternativeCode = 'P') and                 (current()/@use != 'PG')                 ">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'cda:telecom' - "Electronic Communication Usage Code" - The 'telecom' tag shall have 'value' and 'use' attributes with 'use' attribute as 'PG' when 'value' attribute is 'Pager'. Refer to section 8.7 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 @value and                 @use and normalize-space(@use) != '' and                 not(contains(@use, ' ')) and                 (document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Health_Care_Client_Electronic_Communication_Medium']/code[                     (@code            = substring-before(current()/@value,':')) or                     (@alternativeCode = substring-before(current()/@value,':'))                 ]/@alternativeCode = 'P') and                 (current()/@use != 'PG')                 </xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="                 @value and                 @use and normalize-space(@use) != '' and                 contains(@use, ' ') and                 not(contains(substring-after(@use, ' '), ' ')) and                 (document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Health_Care_Client_Electronic_Communication_Medium']/code[                     (@code            = substring-before(current()/@value,':')) or                     (@alternativeCode = substring-before(current()/@value,':'))                 ]/@alternativeCode = 'M') and                 (substring-before(current()/@use, ' ') != 'MC') and                 (substring-after (current()/@use, ' ') != 'MC')                 ">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'cda:telecom' - "Electronic Communication Usage Code" - The 'telecom' tag shall have 'value' and 'use' attributes with 'use' attribute as 'MC' when 'value' attribute is 'Mobile'. Refer to section 8.7 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 @value and                 @use and normalize-space(@use) != '' and                 contains(@use, ' ') and                 not(contains(substring-after(@use, ' '), ' ')) and                 (document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Health_Care_Client_Electronic_Communication_Medium']/code[                     (@code            = substring-before(current()/@value,':')) or                     (@alternativeCode = substring-before(current()/@value,':'))                 ]/@alternativeCode = 'M') and                 (substring-before(current()/@use, ' ') != 'MC') and                 (substring-after (current()/@use, ' ') != 'MC')                 </xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="                 @value and                 @use and normalize-space(@use) != '' and                 contains(@use, ' ') and                 not(contains(substring-after(@use, ' '), ' ')) and                 (document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Health_Care_Client_Electronic_Communication_Medium']/code[                     (@code            = substring-before(current()/@value,':')) or                     (@alternativeCode = substring-before(current()/@value,':'))                 ]/@alternativeCode = 'P') and                 (substring-before(current()/@use, ' ') != 'PG') and                 (substring-after (current()/@use, ' ') != 'PG')                 ">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'cda:telecom' - "Electronic Communication Usage Code" - The 'telecom' tag shall have 'value' and 'use' attributes with 'use' attribute as 'MC' when 'value' attribute is 'Mobile'. Refer to section 8.7 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 @value and                 @use and normalize-space(@use) != '' and                 contains(@use, ' ') and                 not(contains(substring-after(@use, ' '), ' ')) and                 (document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Health_Care_Client_Electronic_Communication_Medium']/code[                     (@code            = substring-before(current()/@value,':')) or                     (@alternativeCode = substring-before(current()/@value,':'))                 ]/@alternativeCode = 'P') and                 (substring-before(current()/@use, ' ') != 'PG') and                 (substring-after (current()/@use, ' ') != 'PG')                 </xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M11" />
  </xsl:template>
  <xsl:template match="cda:observation/cda:text |                          cda:observation/cda:value" priority="3990" mode="M11">
    <xsl:if test="@xsi:type and normalize-space(@xsi:type) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'observation/text' or 'observation/value' tag - The 'text' or 'value' tag 'xsi:type' attribute shall contain a value. Check all 'cda:observation/cda:text' or 'cda:observation/cda:value' tags to find the 'text' or 'value' with blank 'xsi:type' attribute value. Refer to Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0 and section 4.4.1 of the Common Conformance Profile for Clinical Documents.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@xsi:type and normalize-space(@xsi:type) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(cda:reference) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'observation/value' tag - The 'reference' tag shall appear only once. Check all 'cda:observation/cda:value' tags to find the duplicated 'reference' tag. Refer to Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0 and section 4.4.1 of the Common Conformance Profile for Clinical Documents.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:reference) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="                 not(@xsi:type) or                 normalize-space(@xsi:type) = '' or                 @xsi:type != 'ED' or                 not(cda:reference) or                 @mediaType" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'observation/text' or 'observation/value' tag - The 'text' or 'value' tag 'mediaType' attribute is missing for having attachment. Check all 'cda:observation/cda:text' or 'cda:observation/cda:value' tags to find the 'observation/text' or 'observation/value' tag with 'mediaType' attribute missing. Refer to Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0 and section 4.4.1 of the Common Conformance Profile for Clinical Documents.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@xsi:type) or                 normalize-space(@xsi:type) = '' or                 @xsi:type != 'ED' or                 not(cda:reference) or                 @mediaType</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="@mediaType and normalize-space(@mediaType) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'observation/value' tag - The 'mediaType' attribute shall contain a value. Check all 'cda:observation/cda:value' tags to find the 'mediaType' attribute of missing value. Refer to Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0 and section 4.4.1 of the Common Conformance Profile for Clinical Documents.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@mediaType and normalize-space(@mediaType) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="                 cda:reference and                 @mediaType and                 normalize-space(@mediaType) != '' and (                     not (contains(@mediaType, ';')) and                     not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'CDA_MIME_Type']/code[@displayName = (current()/@mediaType)])                 )">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'observation/text' or 'observation/value' tag - The 'text' or 'value' tag 'mediaType' attribute shall be as per CDA Limitation MIME Type defined inside "Common Conformance Profile for Clinical Documents". Check all 'cda:observation/cda:text' or 'cda:observation/cda:value' tags to find the incorrect 'mediaType' attribute. Refer to Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0 and section 4.4.1 of the Common Conformance Profile for Clinical Documents.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 cda:reference and                 @mediaType and                 normalize-space(@mediaType) != '' and (                     not (contains(@mediaType, ';')) and                     not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'CDA_MIME_Type']/code[@displayName = (current()/@mediaType)])                 )</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="                 cda:reference and                 @mediaType and                 normalize-space(@mediaType) != '' and (                     contains(@mediaType, ';') and                     not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'CDA_MIME_Type']/code[@displayName = substring-before(current()/@mediaType, ';')])                 )">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'observation/text' or 'observation/value' tag - The 'text' or 'value' tag 'mediaType' attribute shall be as per CDA Limitation MIME Type defined inside "Common Conformance Profile for Clinical Documents". Check all 'cda:observation/cda:text' or 'cda:observation/cda:value' tags to find the incorrect 'mediaType' attribute. Refer to Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0 and section 4.4.1 of the Common Conformance Profile for Clinical Documents.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 cda:reference and                 @mediaType and                 normalize-space(@mediaType) != '' and (                     contains(@mediaType, ';') and                     not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'CDA_MIME_Type']/code[@displayName = substring-before(current()/@mediaType, ';')])                 )</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M11" />
  </xsl:template>
  <xsl:template match="cda:observation/cda:text[@mediaType]/cda:reference |                          cda:observation/cda:value[@mediaType]/cda:reference |                          cda:observationMedia/cda:value[@mediaType]/cda:reference" priority="3989" mode="M11">
    <xsl:choose>
      <xsl:when test="@value" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'observation/text', 'observation/value' and 'observationMedia/value' tag - The 'reference' tag 'value' attribute is missing. Check all 'cda:observation/cda:text/cda:reference', 'cda:observation/cda:value/cda:reference' and 'cda:observationMedia/cda:value/cda:reference' tags to find the missing 'value' attribute. Refer to Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0 and section 4.4.1 of the Common Conformance Profile for Clinical Documents.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@value</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="not(@value) or normalize-space(@value) != ''" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'observation/text', 'observation/value' and 'observationMedia/value' tag - The 'reference' tag 'value' attribute shall contain a value. Check all 'cda:observation/cda:text/cda:reference', 'cda:observation/cda:value/cda:reference' and 'cda:observationMedia/cda:value/cda:reference' tags to find the empty 'value' attribute. Refer to Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0 and section 4.4.1 of the Common Conformance Profile for Clinical Documents.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">not(@value) or normalize-space(@value) != ''</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M11" />
  </xsl:template>
  <xsl:template match="cda:observationMedia" priority="3988" mode="M11">
    <xsl:choose>
      <xsl:when test="ancestor::cda:component[cda:section]" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'observationMedia' tag - The 'narrative' block of 'observationMedia' tag is missing. Check all 'cda:observationMedia' tags to find the missing 'narrative ' block. Refer to Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0 and section 4.4.1 of the Common Conformance Profile for Clinical Documents.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">ancestor::cda:component[cda:section]</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 name(parent::*) = 'entry' or                 name(parent::*) = 'entryRelationship'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'observationMedia' tag - The 'observationMedia' tag shall be a child of 'entry' or 'entryRelationship' tag. Check all 'cda:observationMedia' tags to find the incorrect 'observationMedia' tag. Refer to Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0 and section 4.4.1 of the Common Conformance Profile for Clinical Documents.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 name(parent::*) = 'entry' or                 name(parent::*) = 'entryRelationship'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="@ID" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'observationMedia' tag - The 'observationMedia' tag 'ID' attribute is missing. Check all 'cda:observationMedia' tags to find the missing 'ID' attribute. Refer to Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0 and section 4.4.1 of the Common Conformance Profile for Clinical Documents.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@ID</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="not(@ID) or normalize-space(@ID) != ''" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'observationMedia' tag - The 'observationMedia' tag 'ID' attribute shall contain a value. Check all 'cda:observationMedia' tags to find the empty 'ID' attribute. Refer to Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0 and section 4.4.1 of the Common Conformance Profile for Clinical Documents.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">not(@ID) or normalize-space(@ID) != ''</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@ID) or                 @ID = 'LOGO' or                 not(ancestor::cda:component/cda:section/cda:text) or                 not(ancestor::cda:component/cda:section/cda:text//cda:renderMultiMedia) or                 not(ancestor::cda:component/cda:section/cda:text//cda:renderMultiMedia/@referencedObject) or                 ancestor::cda:component/cda:section/cda:text//cda:renderMultiMedia/@referencedObject = @ID" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">&gt;Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'observationMedia' tag - The 'ID' attribute shall match the 'referencedObject' attribute inside 'narrative' block of 'observationMedia'. Refer to Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0 and section 4.4.1 of the Common Conformance Profile for Clinical Documents.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@ID) or                 @ID = 'LOGO' or                 not(ancestor::cda:component/cda:section/cda:text) or                 not(ancestor::cda:component/cda:section/cda:text//cda:renderMultiMedia) or                 not(ancestor::cda:component/cda:section/cda:text//cda:renderMultiMedia/@referencedObject) or                 ancestor::cda:component/cda:section/cda:text//cda:renderMultiMedia/@referencedObject = @ID</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="cda:value" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'observationMedia' tag - The 'value' tag is missing. Check all 'cda:observationMedia' tags to find the missing 'value ' tag. Refer to Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0 and section 4.4.1 of the Common Conformance Profile for Clinical Documents.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:value</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="not(cda:value) or cda:value[@mediaType]" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'observationMedia' tag - The 'value' tag 'mediaType' attribute is missing. Check all 'cda:observationMedia/cda:value' tags to find the missing 'mediaType ' attribute. Refer to Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0 and section 4.4.1 of the Common Conformance Profile for Clinical Documents.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">not(cda:value) or cda:value[@mediaType]</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:value) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'observationMedia' tag - The 'value' tag shall appear only once. Check all 'cda:observationMedia' tags to find the duplicated 'value ' tag. Refer to Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0 and section 4.4.1 of the Common Conformance Profile for Clinical Documents.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:value) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M11" />
  </xsl:template>
  <xsl:template match="cda:observationMedia/cda:value[@mediaType]" priority="3987" mode="M11">
    <xsl:choose>
      <xsl:when test="                 normalize-space(@mediaType) = '' or                 contains(@mediaType, ';') or                 document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'CDA_MIME_Type']/code[@displayName = (current()/@mediaType)]" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'observationMedia/value' tag - The 'text' tag 'mediaType' attribute shall be as per CDA Limitation MIME Type defined inside "Common Conformance Profile for Clinical Documents". NOTE: This restriction shall be applied to PCEHR message only. Ignore this error for non-PCEHR messages. Check all 'cda:observationMedia/cda:value' tags to find the incorrect 'mediaType' attribute. Refer to Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0 and section 4.4.1 of the Common Conformance Profile for Clinical Documents.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 normalize-space(@mediaType) = '' or                 contains(@mediaType, ';') or                 document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'CDA_MIME_Type']/code[@displayName = (current()/@mediaType)]</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 normalize-space(@mediaType) = '' or                 not(contains(@mediaType, ';')) or                 document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'CDA_MIME_Type']/code[@displayName = substring-before(current()/@mediaType, ';')]" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'observationMedia/value' tag - The 'text' tag 'mediaType' attribute shall be as per CDA Limitation MIME Type defined inside "Common Conformance Profile for Clinical Documents". NOTE: This restriction shall be applied to PCEHR message only. Ignore this error for non-PCEHR messages. Check all 'cda:observationMedia/cda:value' tags to find the incorrect 'mediaType' attribute. Refer to Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0 and section 4.4.1 of the Common Conformance Profile for Clinical Documents.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 normalize-space(@mediaType) = '' or                 not(contains(@mediaType, ';')) or                 document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'CDA_MIME_Type']/code[@displayName = substring-before(current()/@mediaType, ';')]</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="not(@integrityCheck) or normalize-space(@integrityCheck) != ''" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'observationMedia/value' tag - The 'integrityCheck' attribute shall contain a value. Check all 'cda:observationMedia/cda:value' tags to find the empty 'integrityCheck' attribute. Refer to Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0 and section 4.4.1 of the Common Conformance Profile for Clinical Documents.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">not(@integrityCheck) or normalize-space(@integrityCheck) != ''</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="cda:reference" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'observationMedia/value' tag - The 'reference' tag is missing. Check all 'cda:observationMedia/cda:value' tags to find the missing 'reference' tag. Refer to Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0 and section 4.4.1 of the Common Conformance Profile for Clinical Documents.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:reference</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:reference) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'observationMedia/value' tag - The 'reference' tag shall appear only once. Check all 'cda:observationMedia/cda:value' tags to find the duplicated 'reference' tag. Refer to Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0 and section 4.4.1 of the Common Conformance Profile for Clinical Documents.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:reference) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M11" />
  </xsl:template>
  <xsl:template match="cda:component/cda:section[not(descendant::cda:component/cda:section) and                                                        descendant::cda:observationMedia and                                                        descendant::cda:observationMedia[@ID!='LOGO']]" priority="3986" mode="M11">
    <xsl:choose>
      <xsl:when test="cda:title" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'observationMedia' tag - The 'title' tag is missing for 'narrative' block of 'observationMedia'. Check all 'cda:observationMedia' tags to find the missing 'narrative ' block 'title' tag. Refer to Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0 and section 4.4.1 of the Common Conformance Profile for Clinical Documents.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:title</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="not(cda:title) or normalize-space(cda:title) != ''" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'observationMedia' tag - The 'title' tag for 'narrative' block of 'observationMedia' shall contain a value. Check all 'cda:observationMedia' tags to find the empty 'narrative ' block 'title' tag. Refer to Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0 and section 4.4.1 of the Common Conformance Profile for Clinical Documents.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">not(cda:title) or normalize-space(cda:title) != ''</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:title) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'observationMedia' tag - The 'title' tag shall appear only once for 'narrative' block of 'observationMedia'. Check all 'cda:observationMedia' tags to find the duplicated 'narrative ' block 'title' tag. Refer to Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0 and section 4.4.1 of the Common Conformance Profile for Clinical Documents.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:title) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="cda:text" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'observationMedia' tag - The 'text' tag is missing for 'narrative' block of 'observationMedia'. Check all 'cda:observationMedia' tags to find the missing 'narrative ' block 'text' tag. Refer to Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0 and section 4.4.1 of the Common Conformance Profile for Clinical Documents.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:text</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:text) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'observationMedia' tag - The 'text' tag shall appear only once for 'narrative' block of 'observationMedia'. Check all 'cda:observationMedia' tags to find the duplicated 'narrative ' block 'text' tag. Refer to Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0 and section 4.4.1 of the Common Conformance Profile for Clinical Documents.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:text) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M11" />
  </xsl:template>
  <xsl:template match="cda:component/cda:section[not(descendant::cda:component/cda:section) and                                                        descendant::cda:observationMedia and                                                        descendant::cda:observationMedia[@ID!='LOGO']]/                          cda:text" priority="3985" mode="M11">
    <xsl:if test="@mediaType and normalize-space(@mediaType) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'observationMedia' tag - The 'text' tag 'mediaType' attribute for 'narrative' block of 'observationMedia' shall contain a value. Check all 'cda:observationMedia' tags to find the empty 'mediaType' attribute for 'narrative ' block 'text' tag. Refer to Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0 and section 4.4.1 of the Common Conformance Profile for Clinical Documents.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@mediaType and normalize-space(@mediaType) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="not(@mediaType) or                 normalize-space(@mediaType) = '' or                 @mediaType = 'text/x-hl7-text+xml'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'observationMedia' tag - The 'text' tag 'mediaType' attribute for 'narrative' block of 'observationMedia' shall be 'text/x-hl7-text+xml'. Check all 'cda:observationMedia' tags to find the incorrect 'mediaType' attribute for 'narrative ' block 'text' tag. Refer to Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0 and section 4.4.1 of the Common Conformance Profile for Clinical Documents.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">not(@mediaType) or                 normalize-space(@mediaType) = '' or                 @mediaType = 'text/x-hl7-text+xml'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="descendant::cda:renderMultiMedia" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'observationMedia' tag - The 'renderMultiMedia' tag is missing inside 'text' tag for 'narrative' block of 'observationMedia'. Check all 'cda:observationMedia' tags to find the missing 'renderMultiMedia' tag inside 'text' tag for 'narrative ' block 'text' tag. Refer to Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0 and section 4.4.1 of the Common Conformance Profile for Clinical Documents.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">descendant::cda:renderMultiMedia</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M11" />
  </xsl:template>
  <xsl:template match="cda:component/cda:section[not(descendant::cda:component/cda:section) and                                                        descendant::cda:observationMedia and                                                        descendant::cda:observationMedia[@ID!='LOGO']]/                          cda:text//cda:renderMultiMedia" priority="3984" mode="M11">
    <xsl:choose>
      <xsl:when test="@referencedObject" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'renderMultiMedia' tag - The 'renderMultiMedia' tag 'referencedObject' attribute is missing. Check all 'cda:renderMultiMedia' tags to find the missing 'referencedObject' attribute. Refer to Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0 and section 4.4.1 of the Common Conformance Profile for Clinical Documents.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@referencedObject</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="not(@referencedObject) or normalize-space(@referencedObject) != ''" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'renderMultiMedia' tag - The 'renderMultiMedia' tag 'referencedObject' attribute shall contain a value. Check all 'cda:renderMultiMedia' tags to find the empty 'referencedObject' attribute. Refer to Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0 and section 4.4.1 of the Common Conformance Profile for Clinical Documents.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">not(@referencedObject) or normalize-space(@referencedObject) != ''</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M11" />
  </xsl:template>
  <xsl:template match="text()" priority="-1" mode="M11" />
  <xsl:template match="cda:addr[not((ancestor::cda:birthplace) or(parent::cda:patientRole))]" priority="4000" mode="M12">
    <xsl:if test="cda:streetAddressLine and normalize-space(cda:streetAddressLine) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Australian or International Address / Australian Address / Unstructured Australian Address Line" or "Address / Australian or International Address / International Address / International Address Line" - The 'streetAddressLine' tag shall contain a value. Check all 'cda:addr' tags to find the incorrect 'streetAddressLine' tag. Refer to section 8.6 Address of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">cda:streetAddressLine and normalize-space(cda:streetAddressLine) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(cda:unitType) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Unit Type" - The 'unitType' tag shall appear only once. Check all 'cda:addr' tags to find the duplicate 'unitType' tag. Refer to section 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:unitType) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="                 (not(cda:country) or document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'ISO3166-1']                 /code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =                 translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')]/@code = 'AU') and                 cda:unitType and                 not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Australian_Unit_Type']/code[@code = current()/cda:unitType])">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Unit Type" - The 'unitType' tag shall contain values coded as per 'AS 4846-2006' - Healthcare Provider Identification: Australian Unit Type. Refer to section 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 (not(cda:country) or document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'ISO3166-1']                 /code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =                 translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')]/@code = 'AU') and                 cda:unitType and                 not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Australian_Unit_Type']/code[@code = current()/cda:unitType])</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(cda:unitID) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Unit Number" - The 'unitID' tag shall appear only once. Check all 'cda:addr' tags to find the duplicate 'unitID' tag. Refer to section 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:unitID) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="cda:unitID and normalize-space(cda:unitID) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Unit Number" - The 'unitID' tag shall contain a value. Check all 'cda:addr' tags to find the empty 'unitID' tag. Refer to section 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">cda:unitID and normalize-space(cda:unitID) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(cda:additionalLocator) &gt; 5">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Address Site Name" and/or "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Level Type" and/or "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Level Number" and/or "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Lot Number" and/or "Address / Australian or International Address / Australian Address / Australian Delivery Point Identifier". The 'additionalLocator' tag shall appear only 5 times. Refer to section 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:additionalLocator) &gt; 5</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="cda:additionalLocator and normalize-space(cda:additionalLocator) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Address Site Name" and/or "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Level Type" and/or "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Level Number" and/or "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Lot Number" and/or "Address / Australian or International Address / Australian Address / Australian Delivery Point Identifier". The 'additionalLocator' tag shall contain a value. Check all 'cda:addr' tags to find the empty 'additionalLocator' tag(s). Refer to section 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">cda:additionalLocator and normalize-space(cda:additionalLocator) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(cda:houseNumber) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Street Number" - The 'houseNumber' tag shall appear only once. Check all 'cda:addr' tags to find the duplicate 'houseNumber' tag. Refer to section 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:houseNumber) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="cda:houseNumber and normalize-space(cda:houseNumber) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Street Number" - The 'houseNumber' tag shall contain a value. Check all 'cda:addr' tags to find the empty 'houseNumber' tag. Refer to section 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">cda:houseNumber and normalize-space(cda:houseNumber) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(cda:streetName) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Street Name" - The 'streetName' tag shall appear only once. Check all 'cda:addr' tags to find the duplicate 'streetName' tag. Refer to section 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:streetName) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="cda:streetName and normalize-space(cda:streetName) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Street Name" - The 'streetName' tag shall contain a value. Check all 'cda:addr' tags to find the empty 'streetName' tag. Refer to section 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">cda:streetName and normalize-space(cda:streetName) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(cda:streetNameType) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Street Type" - The 'streetNameType' tag shall appear only once. Check all 'cda:addr' tags to find the duplicate 'streetNameType' tag. Refer to section 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:streetNameType) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="cda:streetNameType and normalize-space(cda:streetNameType) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Street Type" - The 'streetNameType' tag shall contain a value. Check all 'cda:addr' tags to find the empty 'streetNameType' tag. Refer to section 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">cda:streetNameType and normalize-space(cda:streetNameType) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(cda:direction) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Street Suffix" - The 'direction' tag shall appear only once. Check all 'cda:addr' tags to find the duplicate 'direction' tag. Refer to section 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:direction) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="                 (not(cda:country) or document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'ISO3166-1']                 /code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =                 translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')]/@code = 'AU') and                 cda:direction and                 not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Australian_Street_Suffix_Code']/code[@code = current()/cda:direction])">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Street Suffix" - The 'direction' tag shall contain values coded as per 'AS 4846-2006' - Healthcare Client Identification: Australian Street Suffix. Refer to section 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 (not(cda:country) or document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'ISO3166-1']                 /code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =                 translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')]/@code = 'AU') and                 cda:direction and                 not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Australian_Street_Suffix_Code']/code[@code = current()/cda:direction])</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(cda:deliveryAddressLine) &gt; 2">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Postal Delivery Type" and/or "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Postal Delivery Number" - The 'deliveryAddressLine' tag shall appear only twice. Check all 'cda:addr' tags to find the excessive 'deliveryAddressLine' tag(s). Refer to section 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:deliveryAddressLine) &gt; 2</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="                 cda:deliveryAddressLine and normalize-space(cda:deliveryAddressLine[1]) = '' or                 count(cda:deliveryAddressLine) &gt; 1 and normalize-space(cda:deliveryAddressLine[2]) = ''                 ">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Postal Delivery Type" and/or "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Postal Delivery Number" - The 'deliveryAddressLine' tag shall contain a value. Check all 'cda:addr' tags to find the empty 'deliveryAddressLine' tag(s). Refer to section 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 cda:deliveryAddressLine and normalize-space(cda:deliveryAddressLine[1]) = '' or                 count(cda:deliveryAddressLine) &gt; 1 and normalize-space(cda:deliveryAddressLine[2]) = ''                 </xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="                 (not(cda:country) or document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'ISO3166-1']                 /code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =                 translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')]/@code = 'AU') and                 cda:deliveryAddressLine and                 normalize-space(cda:deliveryAddressLine) != '' and                 count(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Australian_Postal_Delivery_Type_Code']/code[@code = current()/cda:deliveryAddressLine]) != 1                 ">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Postal Delivery Type" and/or "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Postal Delivery Number" - The 'deliveryAddressLine' tag shall contain values coded as per 'AS 5017-2006' - Healthcare Client Identification: Australian Postal Delivery Type Code. Refer to section 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 (not(cda:country) or document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'ISO3166-1']                 /code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =                 translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')]/@code = 'AU') and                 cda:deliveryAddressLine and                 normalize-space(cda:deliveryAddressLine) != '' and                 count(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Australian_Postal_Delivery_Type_Code']/code[@code = current()/cda:deliveryAddressLine]) != 1                 </xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="                 (not(cda:country) or document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'ISO3166-1']                 /code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =                 translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')]/@code = 'AU') and                 count(cda:deliveryAddressLine) = 1 and                 count(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Australian_Postal_Delivery_Type_Code']/code[@code = current()/cda:deliveryAddressLine]) = 1 and                 not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Australian_Postal_Delivery_Number']/code[@code = current()/cda:deliveryAddressLine])                 ">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Postal Delivery Type" and/or "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Postal Delivery Number" - The 'deliveryAddressLine(Australian_Postal_Delivery_Number)' tag is missing for given 'deliveryAddressLine(Australian_Postal_Delivery_Type_Code)'. The 'deliveryAddressLine' tag(s) shall contain values coded as per 'AS 5017-2006' - Healthcare Client Identification: Australian Postal Delivery Type Code. Check all 'cda:addr' tags to find the non-conforming 'devliveryAddressLine' tag. Refer to section 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 (not(cda:country) or document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'ISO3166-1']                 /code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =                 translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')]/@code = 'AU') and                 count(cda:deliveryAddressLine) = 1 and                 count(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Australian_Postal_Delivery_Type_Code']/code[@code = current()/cda:deliveryAddressLine]) = 1 and                 not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Australian_Postal_Delivery_Number']/code[@code = current()/cda:deliveryAddressLine])                 </xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(cda:city) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address/ Australian or International Address / Australian Address / Australian Suburb/Town/Locality" - The 'city' tag shall appear only once. Check all 'cda:addr' tags to find the duplicate 'city' tag. Refer to section 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:city) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="cda:city and normalize-space(cda:city) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address/ Australian or International Address / Australian Address / Australian Suburb/Town/Locality" - The 'city' tag shall contain a value. Check all 'cda:addr' tags to find the empty 'city' tag. Refer to section 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">cda:city and normalize-space(cda:city) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(cda:state) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Australian or International Address / Australian Address / Australian State/Territory" - The 'state' tag shall appear only once. Check all 'cda:addr' tags to find the duplicate 'state' tag. Refer to section 8.6 and 10.10 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:state) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="                 (not(cda:country) or document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'ISO3166-1']                 /code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =                 translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')]/@code = 'AU') and                 cda:state and                 not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Australian_State_Territory_Identifier_-_Postal']/code[@code = current()/cda:state])">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Australian or International Address / Australian Address / Australian State/Territory" - The 'state' tag shall be as per 'AS 5017-2006' - Australian State/Territory Identifier - Postal. Refer to section 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 (not(cda:country) or document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'ISO3166-1']                 /code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =                 translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')]/@code = 'AU') and                 cda:state and                 not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Australian_State_Territory_Identifier_-_Postal']/code[@code = current()/cda:state])</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="                 (cda:country and not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'ISO3166-1']                 /code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =                 translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')]/@code = 'AU')) and                 cda:state and                 normalize-space(cda:state) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Australian or International Address / International Address / International State/Province" - The 'state' tag shall contain a value. Check all 'cda:addr' tags to find the empty 'state' tag(s). Refer to section 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 (cda:country and not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'ISO3166-1']                 /code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =                 translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')]/@code = 'AU')) and                 cda:state and                 normalize-space(cda:state) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(cda:postalCode) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address/ Australian or International Address / Australian Address / Australian Postcode" - The 'postalCode' tag shall appear only once. Check all 'cda:addr' tags to find the duplicate 'postalCode' tag. Refer to section 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:postalCode) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="cda:postalCode and normalize-space(cda:postalCode) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address/ Australian or International Address / Australian Address / Australian Postcode" - The 'postalCode' tag shall contain a value. Check all 'cda:addr' tags to find the empty 'postalCode' tag. Refer to section 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">cda:postalCode and normalize-space(cda:postalCode) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(cda:country) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Australian or International Address / International Address / Country" - The 'country' tag shall appear only once. Check all 'cda:addr' tags to find the duplicate 'country' tag. Refer to section 8.6 Address of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:country) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="cda:country and normalize-space(cda:country) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Australian or International Address / International Address / Country" - The 'country' tag shall contain a value. Check all 'cda:addr' tags to find the empty 'country' tag. Refer to section 8.6 Address of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">cda:country and normalize-space(cda:country) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="cda:country and not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'ISO3166-1']                 /code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =                 translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')])">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Australian or International Address / International Address / Country" - The 'country' tag shall contain values coded as per Australia Bureau of Statistics, Standard Australian Classification of Countries (SACC) Cat. No. 1269. Refer to section 8.6 Address of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">cda:country and not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'ISO3166-1']                 /code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =                 translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')])</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="                 (@use and @nullFlavor and @nullFlavor='NA') or                 (not(@use) and (not(@nullFlavor) or (@nullFlavor!='NA')))">
      <xsl:element name="issue">
        <xsl:element name="message">rrrrrrrError: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Address Purpose" and "Address / No Fixed Address Indicator" - The 'addr' tag shall have 'use' OR 'nullFlavor=NA' attribute but not both. Refer to section 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 (@use and @nullFlavor and @nullFlavor='NA') or                 (not(@use) and (not(@nullFlavor) or (@nullFlavor!='NA')))</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="                 @use and                 not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Health_Care_Client_Identifier_Address_Purpose']/code[                 (@code            = current()/@use) or                 (@alternativeCode = current()/@use) or                 (@hl7Code         = current()/@use)])">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Address Purpose" - The 'addr' tag 'use' attribute shall be coded as per 'AS 5017-2006' - Health Care Client Identifier Address Purpose. Refer to section 8.6 and 10.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 @use and                 not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Health_Care_Client_Identifier_Address_Purpose']/code[                 (@code            = current()/@use) or                 (@alternativeCode = current()/@use) or                 (@hl7Code         = current()/@use)])</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M12" />
  </xsl:template>
  <xsl:template match="text()" priority="-1" mode="M12" />
  <xsl:template match="/cda:ClinicalDocument/cda:recordTarget/cda:patientRole" priority="4000" mode="M13">
    <xsl:choose>
      <xsl:when test="cda:addr" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Address" - The 'addr' tag is missing. Refer to section 6.1.2 and 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:addr</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M13" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:addr[@use]" priority="3999" mode="M13">
    <xsl:if test="cda:streetAddressLine and normalize-space(cda:streetAddressLine) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Australian or International Address / Australian Address / Unstructured Australian Address Line" or "Address / Australian or International Address / International Address / International Address Line" - The 'streetAddressLine' tag shall contain a value. Check all 'cda:addr' tags to find the incorrect 'streetAddressLine' tag. Refer to section 8.6 Address of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">cda:streetAddressLine and normalize-space(cda:streetAddressLine) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(cda:unitType) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Unit Type" - The 'unitType' tag shall appear only once. Check all 'cda:addr' tags to find the duplicate 'unitType' tag. Refer to section 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:unitType) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="                 (not(cda:country) or document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'ISO3166-1']                 /code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =                 translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')]/@code = 'AU') and                 cda:unitType and                 not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Australian_Unit_Type']/code[@code = current()/cda:unitType])">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Unit Type" - The 'unitType' tag shall contain values coded as per 'AS 4846-2006' - Healthcare Provider Identification: Australian Unit Type. Refer to section 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 (not(cda:country) or document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'ISO3166-1']                 /code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =                 translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')]/@code = 'AU') and                 cda:unitType and                 not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Australian_Unit_Type']/code[@code = current()/cda:unitType])</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(cda:unitID) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Unit Number" - The 'unitID' tag shall appear only once. Check all 'cda:addr' tags to find the duplicate 'unitID' tag. Refer to section 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:unitID) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="cda:unitID and normalize-space(cda:unitID) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Unit Number" - The 'unitID' tag shall contain a value. Check all 'cda:addr' tags to find the empty 'unitID' tag. Refer to section 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">cda:unitID and normalize-space(cda:unitID) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(cda:additionalLocator) &gt; 5">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Address Site Name" and/or "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Level Type" and/or "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Level Number" and/or "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Lot Number" and/or "Address / Australian or International Address / Australian Address / Australian Delivery Point Identifier". The 'additionalLocator' tag shall appear only 5 times. Refer to section 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:additionalLocator) &gt; 5</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="cda:additionalLocator and normalize-space(cda:additionalLocator) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Address Site Name" and/or "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Level Type" and/or "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Level Number" and/or "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Lot Number" and/or "Address / Australian or International Address / Australian Address / Australian Delivery Point Identifier". The 'additionalLocator' tag shall contain a value. Check all 'cda:addr' tags to find the empty 'additionalLocator' tag(s). Refer to section 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">cda:additionalLocator and normalize-space(cda:additionalLocator) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(cda:houseNumber) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Street Number" - The 'houseNumber' tag shall appear only once. Check all 'cda:addr' tags to find the duplicate 'houseNumber' tag. Refer to section 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:houseNumber) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="cda:houseNumber and normalize-space(cda:houseNumber) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Street Number" - The 'houseNumber' tag shall contain a value. Check all 'cda:addr' tags to find the empty 'houseNumber' tag. Refer to section 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">cda:houseNumber and normalize-space(cda:houseNumber) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(cda:streetName) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Street Name" - The 'streetName' tag shall appear only once. Check all 'cda:addr' tags to find the duplicate 'streetName' tag. Refer to section 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:streetName) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="cda:streetName and normalize-space(cda:streetName) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Street Name" - The 'streetName' tag shall contain a value. Check all 'cda:addr' tags to find the empty 'streetName' tag. Refer to section 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">cda:streetName and normalize-space(cda:streetName) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(cda:streetNameType) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Street Type" - The 'streetNameType' tag shall appear only once. Check all 'cda:addr' tags to find the duplicate 'streetNameType' tag. Refer to section 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:streetNameType) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="cda:streetNameType and normalize-space(cda:streetNameType) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Street Type" - The 'streetNameType' tag shall contain a value. Check all 'cda:addr' tags to find the empty 'streetNameType' tag. Refer to section 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">cda:streetNameType and normalize-space(cda:streetNameType) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(cda:direction) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Street Suffix" - The 'direction' tag shall appear only once. Check all 'cda:addr' tags to find the duplicate 'direction' tag. Refer to section 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:direction) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="                 (not(cda:country) or document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'ISO3166-1']                 /code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =                 translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')]/@code = 'AU') and                 cda:direction and                 not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Australian_Street_Suffix_Code']/code[@code = current()/cda:direction])">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Street Suffix" - The 'direction' tag shall contain values coded as per 'AS 4846-2006' - Healthcare Client Identification: Australian Street Suffix. Refer to section 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 (not(cda:country) or document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'ISO3166-1']                 /code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =                 translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')]/@code = 'AU') and                 cda:direction and                 not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Australian_Street_Suffix_Code']/code[@code = current()/cda:direction])</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(cda:deliveryAddressLine) &gt; 2">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Postal Delivery Type" and/or "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Postal Delivery Number" - The 'deliveryAddressLine' tag shall appear only twice. Check all 'cda:addr' tags to find the excessive 'deliveryAddressLine' tag(s). Refer to section 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:deliveryAddressLine) &gt; 2</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="                 cda:deliveryAddressLine and normalize-space(cda:deliveryAddressLine[1]) = '' or                 count(cda:deliveryAddressLine) &gt; 1 and normalize-space(cda:deliveryAddressLine[2]) = ''                 ">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Postal Delivery Type" and/or "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Postal Delivery Number" - The 'deliveryAddressLine' tag shall contain a value. Check all 'cda:addr' tags to find the empty 'deliveryAddressLine' tag(s). Refer to section 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 cda:deliveryAddressLine and normalize-space(cda:deliveryAddressLine[1]) = '' or                 count(cda:deliveryAddressLine) &gt; 1 and normalize-space(cda:deliveryAddressLine[2]) = ''                 </xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="                 (not(cda:country) or document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'ISO3166-1']                 /code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =                 translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')]/@code = 'AU') and                 cda:deliveryAddressLine and                 normalize-space(cda:deliveryAddressLine) != '' and                 count(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Australian_Postal_Delivery_Type_Code']/code[@code = current()/cda:deliveryAddressLine]) != 1                 ">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Postal Delivery Type" and/or "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Postal Delivery Number" - The 'deliveryAddressLine' tag shall contain values coded as per 'AS 5017-2006' - Healthcare Client Identification: Australian Postal Delivery Type Code. Refer to section 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 (not(cda:country) or document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'ISO3166-1']                 /code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =                 translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')]/@code = 'AU') and                 cda:deliveryAddressLine and                 normalize-space(cda:deliveryAddressLine) != '' and                 count(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Australian_Postal_Delivery_Type_Code']/code[@code = current()/cda:deliveryAddressLine]) != 1                 </xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="                 (not(cda:country) or document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'ISO3166-1']                 /code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =                 translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')]/@code = 'AU') and                 count(cda:deliveryAddressLine) = 1 and                 count(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Australian_Postal_Delivery_Type_Code']/code[@code = current()/cda:deliveryAddressLine]) = 1 and                 not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Australian_Postal_Delivery_Number']/code[@code = current()/cda:deliveryAddressLine])                 ">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Postal Delivery Type" and/or "Address / Australian or International Address / Australian Address / Structured Australian Address Line / Australian Postal Delivery Number" - The 'deliveryAddressLine(Australian_Postal_Delivery_Number)' tag is missing for given 'deliveryAddressLine(Australian_Postal_Delivery_Type_Code)'. The 'deliveryAddressLine' tag(s) shall contain values coded as per 'AS 5017-2006' - Healthcare Client Identification: Australian Postal Delivery Type Code. Check all 'cda:addr' tags to find the non-conforming 'devliveryAddressLine' tag. Refer to section 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 (not(cda:country) or document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'ISO3166-1']                 /code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =                 translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')]/@code = 'AU') and                 count(cda:deliveryAddressLine) = 1 and                 count(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Australian_Postal_Delivery_Type_Code']/code[@code = current()/cda:deliveryAddressLine]) = 1 and                 not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Australian_Postal_Delivery_Number']/code[@code = current()/cda:deliveryAddressLine])                 </xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(cda:city) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address/ Australian or International Address / Australian Address / Australian Suburb/Town/Locality" - The 'city' tag shall appear only once. Check all 'cda:addr' tags to find the duplicate 'city' tag. Refer to section 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:city) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="cda:city and normalize-space(cda:city) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address/ Australian or International Address / Australian Address / Australian Suburb/Town/Locality" - The 'city' tag shall contain a value. Check all 'cda:addr' tags to find the empty 'city' tag. Refer to section 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">cda:city and normalize-space(cda:city) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(cda:state) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Australian or International Address / Australian Address / Australian State/Territory" - The 'state' tag shall appear only once. Check all 'cda:addr' tags to find the duplicate 'state' tag. Refer to section 8.6 and 10.10 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:state) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="                 (not(cda:country) or document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'ISO3166-1']                 /code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =                 translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')]/@code = 'AU') and                 cda:state and                 not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Australian_State_Territory_Identifier_-_Postal']/code[@code = current()/cda:state])">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Australian or International Address / Australian Address / Australian State/Territory" - The 'state' tag shall be as per 'AS 5017-2006' - Australian State/Territory Identifier - Postal. Refer to section 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 (not(cda:country) or document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'ISO3166-1']                 /code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =                 translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')]/@code = 'AU') and                 cda:state and                 not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Australian_State_Territory_Identifier_-_Postal']/code[@code = current()/cda:state])</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="                 (cda:country and not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'ISO3166-1']                 /code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =                 translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')]/@code = 'AU')) and                 cda:state and                 normalize-space(cda:state) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Australian or International Address / International Address / International State/Province" - The 'state' tag shall contain a value. Check all 'cda:addr' tags to find the empty 'state' tag(s). Refer to section 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 (cda:country and not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'ISO3166-1']                 /code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =                 translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')]/@code = 'AU')) and                 cda:state and                 normalize-space(cda:state) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(cda:postalCode) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address/ Australian or International Address / Australian Address / Australian Postcode" - The 'postalCode' tag shall appear only once. Check all 'cda:addr' tags to find the duplicate 'postalCode' tag. Refer to section 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:postalCode) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="cda:postalCode and normalize-space(cda:postalCode) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address/ Australian or International Address / Australian Address / Australian Postcode" - The 'postalCode' tag shall contain a value. Check all 'cda:addr' tags to find the empty 'postalCode' tag. Refer to section 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">cda:postalCode and normalize-space(cda:postalCode) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(cda:country) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Australian or International Address / International Address / Country" - The 'country' tag shall appear only once. Check all 'cda:addr' tags to find the duplicate 'country' tag. Refer to section 8.6 Address of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:country) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="cda:country and normalize-space(cda:country) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Australian or International Address / International Address / Country" - The 'country' tag shall contain a value. Check all 'cda:addr' tags to find the empty 'country' tag. Refer to section 8.6 Address of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">cda:country and normalize-space(cda:country) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="cda:country and not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'ISO3166-1']                 /code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =                 translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')])">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Australian or International Address / International Address / Country" - The 'country' tag shall contain values coded as per Australia Bureau of Statistics, Standard Australian Classification of Countries (SACC) Cat. No. 1269. Refer to section 8.6 Address of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">cda:country and not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'ISO3166-1']                 /code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') =                 translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')])</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="                 @use and                 not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Health_Care_Client_Identifier_Address_Purpose']/code[                 (@code            = current()/@use) or                 (@alternativeCode = current()/@use) or                 (@hl7Code         = current()/@use)])">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Address Purpose" - The 'addr' tag 'use' attribute shall be coded as per 'AS 5017-2006' - Health Care Client Identifier Address Purpose. Refer to section 8.6 and 10.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 @use and                 not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Health_Care_Client_Identifier_Address_Purpose']/code[                 (@code            = current()/@use) or                 (@alternativeCode = current()/@use) or                 (@hl7Code         = current()/@use)])</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="@use and normalize-space(@use) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Address Purpose" - The 'addr' tag shall 'use' attribute shall contain a value. Refer to section 8.6 and 10.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@use and normalize-space(@use) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M13" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:addr[not(@use)]" priority="3998" mode="M13">
    <xsl:choose>
      <xsl:when test="(@use and not(@nullFlavor)) or (not(@use) and @nullFlavor)" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Address Purpose" and "Address / No Fixed Address Indicator" - The 'addr' tag shall have 'use' OR 'nullFlavor' attribute but not both. Refer to section 8.6 Address of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">(@use and not(@nullFlavor)) or (not(@use) and @nullFlavor)</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="@nullFlavor and normalize-space(@nullFlavor) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Address Purpose" and "Address / No Fixed Address Indicator" - The 'addr' tag shall 'nullFlavor' attribute shall contain a value. Refer to section 8.6 Address of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@nullFlavor and normalize-space(@nullFlavor) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="@nullFlavor and ((@nullFlavor!='NA') and (@nullFlavor!='UNK') and (@nullFlavor!='MSK'))">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Clinical Document check for 'addr' tag - "Address / Address Purpose" and "Address / No Fixed Address Indicator" - The 'addr' tag 'nullFlavor' attribute shall contain 'NA' or 'UNK' or 'MSK'. Refer to section 8.6 Address of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@nullFlavor and ((@nullFlavor!='NA') and (@nullFlavor!='UNK') and (@nullFlavor!='MSK'))</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M13" />
  </xsl:template>
  <xsl:template match="text()" priority="-1" mode="M13" />
  <xsl:template match="/cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:patient" priority="4000" mode="M14">
    <xsl:choose>
      <xsl:when test="cda:administrativeGenderCode" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Sex" - The 'administrativeGenderCode' tag is missing. Refer to section 6.1.2 and 10.2 AS 5017-2006 Health Care Client Identifier Sex of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:administrativeGenderCode</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:administrativeGenderCode) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Sex" - The 'administrativeGenderCode' tag shall appear only once. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:administrativeGenderCode) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M14" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:patient/cda:administrativeGenderCode" priority="3999" mode="M14">
    <xsl:choose>
      <xsl:when test="@code" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Sex" - The 'administrativeGenderCode' tag 'code' attribute is missing. Refer to section 10.2 AS 5017-2006 Health Care Client Identifier Sex of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@code</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="@codeSystem" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Sex" - The 'administrativeGenderCode' tag 'codeSystem' attribute is missing. Refer to section 10.2 AS 5017-2006 Health Care Client Identifier Sex of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@codeSystem</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'AS_5017-2006_Health_Care_Client_Identifier_Sex']/code[(@code = current()/@code)]" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Sex" - The 'administrativeGenderCode' tag 'code' attribute shall be as per AS 5017-2006 Health Care Client Identifier Sex. Refer to section 10.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'AS_5017-2006_Health_Care_Client_Identifier_Sex']/code[(@code = current()/@code)]</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'AS_5017-2006_Health_Care_Client_Identifier_Sex']/code[(@codeSystem = current()/@codeSystem)]" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Sex" - The 'administrativeGenderCode' tag 'codeSystem' attribute shall be as per AS 5017-2006 Health Care Client Identifier Sex. Refer to section 10.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'AS_5017-2006_Health_Care_Client_Identifier_Sex']/code[(@codeSystem = current()/@codeSystem)]</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="@codeSystemName and not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'AS_5017-2006_Health_Care_Client_Identifier_Sex']/code[(@codeSystemName = current()/@codeSystemName)])">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Sex" - The 'administrativeGenderCode' tag 'codeSystemName' attribute shall be as per AS 5017-2006 Health Care Client Identifier Sex. Refer to section 10.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@codeSystemName and not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'AS_5017-2006_Health_Care_Client_Identifier_Sex']/code[(@codeSystemName = current()/@codeSystemName)])</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="@displayName and not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'AS_5017-2006_Health_Care_Client_Identifier_Sex']/code[(translate(@displayName,  'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = translate(current()/@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'))])">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Sex" - The 'administrativeGenderCode' tag 'displayName' attribute shall be as per AS 5017-2006 Health Care Client Identifier Sex. Refer to section 10.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@displayName and not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'AS_5017-2006_Health_Care_Client_Identifier_Sex']/code[(translate(@displayName,  'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = translate(current()/@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'))])</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="@displayName and @code !=  substring(@displayName,1,1)">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Sex" - The 'administrativeGenderCode' tag: 'code' and 'displayName' attributes shall match as per AS 5017-2006 Health Care Client Identifier Sex. Refer to section 6.1.2 and 10.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@displayName and @code !=  substring(@displayName,1,1)</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M14" />
  </xsl:template>
  <xsl:template match="text()" priority="-1" mode="M14" />
  <xsl:template match="/cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:patient" priority="4000" mode="M15">
    <xsl:if test="(ext:multipleBirthInd[@value='true'] and not(ext:multipleBirthOrderNumber))">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Birth Order" - The 'multipleBirthOrderNumber' tag is missing. Refer to section 6.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">(ext:multipleBirthInd[@value='true'] and not(ext:multipleBirthOrderNumber))</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="(ext:multipleBirthInd[@value='false'] and (ext:multipleBirthOrderNumber))">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Birth Order" - The 'multipleBirthOrderNumber' tag shall be missing. Refer to section 6.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">(ext:multipleBirthInd[@value='false'] and (ext:multipleBirthOrderNumber))</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(ext:multipleBirthInd) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Birth Order" - The 'multipleBirthInd' tag shall appear only once. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(ext:multipleBirthInd) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(ext:multipleBirthOrderNumber) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Birth Order" - The 'multipleBirthOrderNumber' tag shall appear only once. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(ext:multipleBirthOrderNumber) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="ext:multipleBirthInd and ext:multipleBirthInd[not(@value)]">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Birth Order" - The 'multipleBirthInd' tag 'value' attribute is missing. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">ext:multipleBirthInd and ext:multipleBirthInd[not(@value)]</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="ext:multipleBirthOrderNumber and ext:multipleBirthOrderNumber[not(@value)]">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Birth Order" - The 'multipleBirthOrderNumber' tag 'value' attribute is missing. Refer to section 6.1.2 in the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">ext:multipleBirthOrderNumber and ext:multipleBirthOrderNumber[not(@value)]</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="ext:multipleBirthInd[@value] and ext:multipleBirthInd[not(@value = 'true' or @value = 'false')]">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Birth Order" - The 'multipleBirthInd' tag 'value' attribute shall contain an boolean value. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">ext:multipleBirthInd[@value] and ext:multipleBirthInd[not(@value = 'true' or @value = 'false')]</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="ext:multipleBirthOrderNumber[@value] and not(number(ext:multipleBirthOrderNumber/@value))">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Birth Order" - The 'multipleBirthOrderNumber' tag 'value' attribute shall contain an integer value. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">ext:multipleBirthOrderNumber[@value] and not(number(ext:multipleBirthOrderNumber/@value))</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="ext:multipleBirthOrderNumber[@value] and number(ext:multipleBirthOrderNumber/@value) and not(floor(ext:multipleBirthOrderNumber/@value) = number(ext:multipleBirthOrderNumber/@value))">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Birth Order" - The 'multipleBirthOrderNumber' tag 'value' attribute shall contain an integer value. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">ext:multipleBirthOrderNumber[@value] and number(ext:multipleBirthOrderNumber/@value) and not(floor(ext:multipleBirthOrderNumber/@value) = number(ext:multipleBirthOrderNumber/@value))</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M15" />
  </xsl:template>
  <xsl:template match="text()" priority="-1" mode="M15" />
  <xsl:template match="/cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:patient/cda:birthplace/cda:place/cda:addr" priority="4000" mode="M16">
    <xsl:if test="count(cda:country) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Country of Birth" - The 'country' tag shall appear only once. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:country) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="cda:country and normalize-space(cda:country) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Country of Birth" - The 'country' tag shall contain a value. Refer to section 8.6 Address of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">cda:country and normalize-space(cda:country) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="cda:country and not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'ISO3166-1']/code[(@code = current()/cda:country) or (translate(@displayName,  'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'))])">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Country of Birth" - The 'country' tag shall contain a value as per the Australia Bureau of Statistics, Standard Australian Classification of Countries SACC) Cat. No. 1269. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">cda:country and not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'ISO3166-1']/code[(@code = current()/cda:country) or (translate(@displayName,  'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'))])</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M16" />
  </xsl:template>
  <xsl:template match="text()" priority="-1" mode="M16" />
  <xsl:template match="/cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:patient" priority="4000" mode="M17">
    <xsl:choose>
      <xsl:when test="cda:birthTime" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth" - The 'birthTime' tag is missing. Refer to section 6.1.2 and 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:birthTime</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:birthTime) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth" - The 'birthTime' tag shall appear only once. Refer to section 6.1.2 and 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:birthTime) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="cda:birthTime[@value]" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth" - The 'birthTime' tag 'value' attribute is missing. Refer to section 6.1.2 and 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:birthTime[@value]</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="cda:birthTime[normalize-space(@value) !=  '']" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth" - The 'birthTime' tag 'value' attribute shall contain a value. Refer to section 6.1.2 and 8.3 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:birthTime[normalize-space(@value) !=  '']</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M17" />
  </xsl:template>
  <xsl:template match="text()" priority="-1" mode="M17" />
  <xsl:template match="/cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:patient" priority="4000" mode="M18">
    <xsl:if test="(ext:deceasedInd[@value='true'] and not(ext:deceasedTime))">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Death Detail / Date of Death" - The 'deceasedTime' tag is missing. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">(ext:deceasedInd[@value='true'] and not(ext:deceasedTime))</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="(ext:deceasedInd[@value='false'] and (ext:deceasedTime))">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Death Detail / Date of Death" - The 'deceasedTime' tag shall be missing. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">(ext:deceasedInd[@value='false'] and (ext:deceasedTime))</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(ext:deceasedInd) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Death Detail / Date of Death" - The 'deceasedInd' tag shall appear only once. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(ext:deceasedInd) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(ext:deceasedTime) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Death Detail / Date of Death" - The 'deceasedTime' tag shall appear only once. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(ext:deceasedTime) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="ext:deceasedInd and ext:deceasedInd[not(@value)]">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Death Detail / Date of Death" - The 'deceasedInd' tag 'value' attribute is missing. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">ext:deceasedInd and ext:deceasedInd[not(@value)]</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="ext:deceasedInd[@value] and ext:deceasedInd[not(@value = 'true' or @value = 'false')]">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Death Detail / Date of Death" - The 'deceasedInd' tag 'value' attribute shall contain an boolean value. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">ext:deceasedInd[@value] and ext:deceasedInd[not(@value = 'true' or @value = 'false')]</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M18" />
  </xsl:template>
  <xsl:template match="text()" priority="-1" mode="M18" />
  <xsl:template match="/cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:patient" priority="4000" mode="M19">
    <xsl:choose>
      <xsl:when test="ext:asEntityIdentifier" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject of Care - "Subject of Care / Participant / Entity Identifier" - The 'asEntityIdentifier' tag is missing. Refer to section 6.1.2 and 8.4 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">ext:asEntityIdentifier</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="ext:asEntityIdentifier/ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.800360')]" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject of Care - "Subject of Care / Participant / Entity Identifier" - The 'IHI asEntityIdentifier' tag is missing. "The value of one Entity Identifier SHALL be an Australian IHI." although there could be multiple Entity Identifiers. Refer to section 6.1.2 and 8.4 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">ext:asEntityIdentifier/ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.800360')]</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M19" />
  </xsl:template>
  <xsl:template match="text()" priority="-1" mode="M19" />
  <xsl:template match="/cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:patient" priority="4000" mode="M20">
    <xsl:choose>
      <xsl:when test="cda:ethnicGroupCode" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record- 6.1.2 Subject of Care - Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Indigenous Status - The 'ethnicGroupCode' tag is missing. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:ethnicGroupCode</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:ethnicGroupCode) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record- 6.1.2 Subject of Care - Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Indigenous Status - The 'ethnicGroupCode' tag shall appear only once. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:ethnicGroupCode) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M20" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:patient/cda:ethnicGroupCode" priority="3999" mode="M20">
    <xsl:choose>
      <xsl:when test="@code" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject of Care - Subject of Care / Participant / Person or Organisation or Device / Person &gt; Demographic Data / Indigenous Status - The 'ethnicGroupCode' tag 'code' attribute is missing. Refer to section 10.19 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@code</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="@codeSystem" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject of Care - Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Indigenous Status - The 'ethnicGroupCode' tag 'codeSystem' attribute is missing. Refer to section 10.19 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@codeSystem</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'METeOR_Indigenous_Status']/code[(@code = current()/@code) ]" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject of Care - Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Indigenous Status - The 'ethnicGroupCode' tag 'code' attribute shall be as per METeOR 291036: Indigenous Status. Refer to section 10.19 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'METeOR_Indigenous_Status']/code[(@code = current()/@code) ]</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'METeOR_Indigenous_Status']/code[(@codeSystem = current()/@codeSystem)]" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject of Care - Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Indigenous Status - The 'ethnicGroupCode' tag 'codeSystem' attribute shall be as per METeOR 291036: Indigenous Status. Refer to section 10.19 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'METeOR_Indigenous_Status']/code[(@codeSystem = current()/@codeSystem)]</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="@codeSystemName and not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'METeOR_Indigenous_Status']/code[(@codeSystemName = current()/@codeSystemName)])">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject of Care - Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Indigenous Status - The 'ethnicGroupCode' tag 'codeSystemName' attribute shall be as per METeOR 291036: Indigenous Status. Refer to section 10.19 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@codeSystemName and not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'METeOR_Indigenous_Status']/code[(@codeSystemName = current()/@codeSystemName)])</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="@displayName and not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'METeOR_Indigenous_Status']/code[(translate(@displayName,  'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = translate(current()/@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'))])">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject of Care - Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Indigenous Status - The 'ethnicGroupCode' tag 'displayName' attribute shall be as per METeOR 291036: Indigenous Status. Refer to section 10.19 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@displayName and not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'METeOR_Indigenous_Status']/code[(translate(@displayName,  'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = translate(current()/@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'))])</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="@displayName and not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'METeOR_Indigenous_Status']/code[(@code = current()/@code) and (translate(@displayName,  'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = translate(current()/@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'))])">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject of Care - Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Indigenous Status - The 'ethnicGroupCode' tag 'code' and 'displayName' attributes shall be as per METeOR 291036: Indigenous Status. Refer to section 10.19 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@displayName and not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'METeOR_Indigenous_Status']/code[(@code = current()/@code) and (translate(@displayName,  'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = translate(current()/@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'))])</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M20" />
  </xsl:template>
  <xsl:template match="text()" priority="-1" mode="M20" />
  <xsl:template match="/cda:ClinicalDocument/cda:recordTarget/cda:patientRole" priority="4000" mode="M21">
    <xsl:choose>
      <xsl:when test="cda:patient" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject of Care - "Subject of Care / Participant" - The 'patient' tag is missing. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:patient</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:patient) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject of Care - "Subject of Care / Participant" - The 'patient' tag shall appear only once. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:patient) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M21" />
  </xsl:template>
  <xsl:template match="text()" priority="-1" mode="M21" />
  <xsl:template match="/cda:ClinicalDocument" priority="4000" mode="M22">
    <xsl:choose>
      <xsl:when test="cda:recordTarget" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject of Care - The 'recordTarget' tag is missing. Refer to section 6.1.2 Subject of Care of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:recordTarget</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:recordTarget) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject of Care - The 'recordTarget' tag shall appear only once. Refer to section 6.1.2 Subject of Care of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:recordTarget) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="cda:recordTarget[@typeCode] and cda:recordTarget[@typeCode !=  'RCT']">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject of Care - The 'recordTarget' tag 'typeCode' attribute shall contain the value 'RCT'. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">cda:recordTarget[@typeCode] and cda:recordTarget[@typeCode !=  'RCT']</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M22" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:recordTarget" priority="3999" mode="M22">
    <xsl:choose>
      <xsl:when test="cda:patientRole" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject of Care - The 'patientRole' tag is missing. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:patientRole</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:patientRole) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject of Care - The 'patientRole' tag shall appear only once. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:patientRole) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="cda:patientRole[@classCode] and cda:patientRole[@classCode !=  'PAT']">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject of Care - The value of the 'patientRole' tag 'classCode' attribute shall contain the value 'PAT'. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">cda:patientRole[@classCode] and cda:patientRole[@classCode !=  'PAT']</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M22" />
  </xsl:template>
  <xsl:template match="text()" priority="-1" mode="M22" />
  <xsl:template match="/cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:patient" priority="4000" mode="M23">
    <xsl:choose>
      <xsl:when test="cda:name" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Person Name" - The 'name' tag is missing. Refer to section 8.5 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:name</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M23" />
  </xsl:template>
  <xsl:template match="text()" priority="-1" mode="M23" />
  <xsl:template match="/cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:patient/cda:birthplace" priority="4000" mode="M24">
    <xsl:choose>
      <xsl:when test="cda:place" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / State/Territory of Birth" - The 'place' tag is missing. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:place</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M24" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:patient/cda:birthplace/cda:place" priority="3999" mode="M24">
    <xsl:choose>
      <xsl:when test="cda:addr" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / State/Territory of Birth" - The 'addr' tag is missing. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:addr</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M24" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:patient/cda:birthplace/cda:place/cda:addr" priority="3998" mode="M24">
    <xsl:if test="count(cda:state) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / State/Territory of Birth" - The 'state' tag shall appear only once. Refer to section 10.10 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:state) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="                 (not(cda:country) or document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'ISO3166-1']/code[translate(@displayName,  'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')]/@code = 'AU') and                 cda:state and                 not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Australian_State_Territory_Identifier_-_Postal']/code[(@code = current()/cda:state)])">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / State/Territory of Birth" - The 'state' tag shall be coded as per AS 5017-2006 Australian State/Territory Identifier - Postal. Refer to section 10.10 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 (not(cda:country) or document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'ISO3166-1']/code[translate(@displayName,  'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')]/@code = 'AU') and                 cda:state and                 not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Australian_State_Territory_Identifier_-_Postal']/code[(@code = current()/cda:state)])</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="                 (cda:country and not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'ISO3166-1']/code[translate(@displayName,  'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')]/@code = 'AU')) and                 cda:state and                 normalize-space(cda:state) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / State/Territory of Birth" - The 'state' tag shall contain a value. Refer to section 10.10 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 (cda:country and not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'ISO3166-1']/code[translate(@displayName,  'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')]/@code = 'AU')) and                 cda:state and                 normalize-space(cda:state) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M24" />
  </xsl:template>
  <xsl:template match="text()" priority="-1" mode="M24" />
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section" priority="4000" mode="M25">
    <xsl:if test="cda:title and normalize-space(cda:title) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - The 'title' tag shall contain a value. Refer to Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">cda:title and normalize-space(cda:title) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(cda:title) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - The 'title' tag shall appear only once. Refer to the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:title) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="cda:text and (                 (cda:text/child::* and not(                     cda:text/cda:content   or                     cda:text/cda:paragraph or                     cda:text/cda:linkHtml  or                     cda:text/cda:sub       or                     cda:text/cda:footnote  or                     cda:text/cda:list      or                     cda:text/cda:table     or                     cda:text/cda:sup                     )                 ) or (not(cda:text/child::*) and normalize-space(cda:text) = ''))">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - The 'text' tag shall contain a value for narrative content. Refer to Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">cda:text and (                 (cda:text/child::* and not(                     cda:text/cda:content   or                     cda:text/cda:paragraph or                     cda:text/cda:linkHtml  or                     cda:text/cda:sub       or                     cda:text/cda:footnote  or                     cda:text/cda:list      or                     cda:text/cda:table     or                     cda:text/cda:sup                     )                 ) or (not(cda:text/child::*) and normalize-space(cda:text) = ''))</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(cda:text) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - The 'text' tag shall appear only once. Refer to Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:text) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M25" />
  </xsl:template>
  <xsl:template match="text()" priority="-1" mode="M25" />
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component[cda:section/cda:code/@code = '101.16694']" priority="4000" mode="M26">
    <xsl:if test="count(cda:section) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1 ACD Custodian Entries - "ACD Custodian Entries" - The 'section' tag shall appear only once. Refer to section 7.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:section) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M26" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16694']" priority="3999" mode="M26">
    <xsl:choose>
      <xsl:when test="cda:title" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1 ACD Custodian Entries - "ACD Custodian Entries" - The 'title' tag is missing. Refer to section 7.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:title</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="cda:title and not(translate(cda:title, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'ACD CUSTODIAN ENTRIES')">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1 ACD Custodian Entries - "ACD Custodian Entries" - The 'title' tag shall contain the value 'ACD CUSTODIAN ENTRIES'. Refer to section 7.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">cda:title and not(translate(cda:title, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'ACD CUSTODIAN ENTRIES')</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="cda:text" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1 ACD Custodian Entries - "ACD Custodian Entries" - The 'text' tag is missing. Refer to section 7.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:text</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M26" />
  </xsl:template>
  <xsl:template match="cda:code[@code = '101.16694']" priority="3998" mode="M26">
    <xsl:choose>
      <xsl:when test="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16694']" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1 ACD Custodian Entries - "ACD Custodian Entries" - The "/ClinicalDocument/component/structuredBody/component/section[code/@code = '101.16694']" path - 1 or more tags are missing. Refer to section 7.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16694']</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="@codeSystem  = '1.2.36.1.2001.1001.101'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1 ACD Custodian Entries - "ACD Custodian Entries" - The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'. Refer to section 7.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@codeSystem  = '1.2.36.1.2001.1001.101'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="translate(@codeSystemName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'NCTIS DATA COMPONENTS'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1 ACD Custodian Entries - "ACD Custodian Entries" - The 'code' tag 'codeSystemName' attribute shall contain the value 'NCTIS Data Components'. Refer to section 7.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">translate(@codeSystemName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'NCTIS DATA COMPONENTS'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'ACD CUSTODIAN ENTRIES'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1 ACD Custodian Entries - "ACD Custodian Entries" - The 'code' tag 'displayName' attribute shall contain the value 'ACD Custodian Entries'. Refer to section 7.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'ACD CUSTODIAN ENTRIES'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M26" />
  </xsl:template>
  <xsl:template match="text()" priority="-1" mode="M26" />
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody" priority="4000" mode="M27">
    <xsl:choose>
      <xsl:when test="cda:component[cda:section/cda:code/@code = '102.16080']" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 4. Administrative Observations - The 'section' tag is missing. Refer to section 4 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:component[cda:section/cda:code/@code = '102.16080']</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:component[cda:section/cda:code/@code = '102.16080']) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 4. Administrative Observations - The 'section' tag shall appear only once. Refer to section 4 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:component[cda:section/cda:code/@code = '102.16080']) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M27" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component[cda:section/cda:code/@code = '102.16080']" priority="3999" mode="M27">
    <xsl:if test="count(cda:section) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 4. Administrative Observations - The 'section' tag with 'code = 102.16080' attribute shall appear only once. Refer to section 4 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:section) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M27" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']" priority="3998" mode="M27">
    <xsl:if test="count(cda:id) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 4. Administrative Observations - "component/section/[admin_obs]/id" - The 'id' tag shall appear only once. Refer to section 4 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:id) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(cda:code) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 4. Administrative Observations - "component/section/[admin_obs]/code" - The 'code' tag shall appear only once. Refer to section 4 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:code) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="cda:title" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 4. Administrative Observations - "component/section/[admin_obs]/title" - The 'title' tag is missing. Refer to section 4 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:title</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="cda:title and not(translate(cda:title, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'ADMINISTRATIVE OBSERVATIONS')">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 4. Administrative Observations - "component/section/[admin_obs]/code" - The 'title' tag shall contain the value 'Administrative Observations'. Refer to section 4 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">cda:title and not(translate(cda:title, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'ADMINISTRATIVE OBSERVATIONS')</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="cda:text" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 4. Administrative Observations - "component/section/[admin_obs]/text" - The 'text' tag is missing. Refer to section 4 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:text</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M27" />
  </xsl:template>
  <xsl:template match="cda:code[@code = '102.16080']" priority="3997" mode="M27">
    <xsl:choose>
      <xsl:when test="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 4. Administrative Observations - The "/ClinicalDocument/component/structuredBody/component/section[code/@code = '102.16080']" path - 1 or more tags are missing. Refer to section 4 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="@codeSystem = '1.2.36.1.2001.1001.101'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 4. Administrative Observations - "component/section/[admin_obs]/code" - The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'. Refer to section 4 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@codeSystem = '1.2.36.1.2001.1001.101'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="translate(@codeSystemName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'NCTIS DATA COMPONENTS'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 4. Administrative Observations - "component/section/[admin_obs]/code" - The 'code' tag 'codeSystemName' attribute shall contain the value 'NCTIS Data Components'. Refer to section 4 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">translate(@codeSystemName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'NCTIS DATA COMPONENTS'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'ADMINISTRATIVE OBSERVATIONS'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 4. Administrative Observations - "component/section/[admin_obs]/code" - The 'code' tag 'displayName' attribute shall contain the value 'Administrative Observations'. Refer to section 4 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'ADMINISTRATIVE OBSERVATIONS'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M27" />
  </xsl:template>
  <xsl:template match="text()" priority="-1" mode="M27" />
  <xsl:template match="/cda:ClinicalDocument/cda:component" priority="4000" mode="M28">
    <xsl:choose>
      <xsl:when test="((cda:structuredBody and not (cda:nonXMLBody)) or (not (cda:structuredBody) and cda:nonXMLBody))" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - '/ClinicalDocument/component/' section 'structuredBody' tag is missing. Refer to section 4 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">((cda:structuredBody and not (cda:nonXMLBody)) or (not (cda:structuredBody) and cda:nonXMLBody))</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M28" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody" priority="3999" mode="M28">
    <xsl:choose>
      <xsl:when test="cda:component" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - '/ClinicalDocument/component/structuredBody/' section 'component' tag is missing. Refer to section 4 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:component</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="cda:component/cda:section[cda:code/@code = '102.16080']" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 4. Administrative Observations - The '/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']' tag is missing. Refer to section 4 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:component/cda:section[cda:code/@code = '102.16080']</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:component/cda:section[cda:code/@code = '102.16080']) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 4. Administrative Observations - The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '102.16080']' tag shall appear only once. Refer to section 4 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:component/cda:section[cda:code/@code = '102.16080']) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="cda:component/cda:section[cda:code/@code = '101.16694']" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1 ACD Custodian Entries - The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '101.16694']' tag is missing. Refer to section 7.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:component/cda:section[cda:code/@code = '101.16694']</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:component[cda:section[cda:code/@code = '101.16694'] ]) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1 ACD Custodian Entries - The '/ClinicalDocument/component/structuredBody/component/section[code/@code = '101.16694']' tag shall appear only once. Refer to section 7.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:component[cda:section[cda:code/@code = '101.16694'] ]) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M28" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component" priority="3998" mode="M28">
    <xsl:choose>
      <xsl:when test="cda:section" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - '/ClinicalDocument/component/structuredBody/component' section - The 'section' tag is missing. Refer to sections 4 and 7.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:section</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M28" />
  </xsl:template>
  <xsl:template match="text()" priority="-1" mode="M28" />
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[                       (translate(cda:title , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='ADMINISTRATIVE OBSERVATIONS' or                        translate(cda:title , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='ACD CUSTODIAN ENTRIES') or                        (cda:code[(                                 @code = '102.16080' or                                 @code = '101.16694')]                                 )]" priority="4000" mode="M29">
    <xsl:choose>
      <xsl:when test="cda:code" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Code Checks - The 'code' tag is missing. Refer to section "4. Administrative Observations' or '7.1.1 ACD Custodian Entries' of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:code</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="cda:code[(@code = '102.16080' or                                      @code = '101.16694')]" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Code Checks - The 'code' tag 'code' attribute shall be '102.16080' or '101.16694'. Refer to section "'4. Administrative Observations' or '7.1.1 ACD Custodian Entries' of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:code[(@code = '102.16080' or                                      @code = '101.16694')]</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="(translate(cda:title , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'ADMINISTRATIVE OBSERVATIONS' or                             translate(cda:title , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'ACD CUSTODIAN ENTRIES')" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Code Checks - The 'title' tag shall be 'Administrative Observations' or 'Event'. Refer to section "'4. Administrative Observations' or '7.1.1 ACD Custodian Entries'" of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">(translate(cda:title , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'ADMINISTRATIVE OBSERVATIONS' or                             translate(cda:title , 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'ACD CUSTODIAN ENTRIES')</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M29" />
  </xsl:template>
  <xsl:template match="text()" priority="-1" mode="M29" />
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16694']/cda:entry[cda:act/cda:code/@code = '102.16690']" priority="4000" mode="M30">
    <xsl:if test="count(cda:act[cda:code/@code = '102.16690']) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1 ACD Custodian Entry - "ACD Custodian Entry" - The 'act' tag shall appear only once. Refer to section 7.1.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:act[cda:code/@code = '102.16690']) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="@typeCode and not(@typeCode = 'COMP')">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1 Clinical Synopsis - "ACD Custodian Entry" - The 'entry' tag 'typeCode' attribute shall containt the value 'COMP'. Refer to section 7.1.1.1 ACD Custodian Entry of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@typeCode and not(@typeCode = 'COMP')</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M30" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16694']/cda:entry/cda:act[cda:code/@code = '102.16690']" priority="3999" mode="M30">
    <xsl:choose>
      <xsl:when test="@classCode" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1 ACD Custodian Entry - "ACD Custodian Entry" - The 'act' tag 'classCode' attribute is missing. Refer to section 7.1.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@classCode</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="@classCode = 'INFRM'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1 Clinical Synopsis - "ACD Custodian Entry" - The 'act' tag 'classCode' attribute shall contain the value 'INFRM'. Refer to section 7.1.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@classCode = 'INFRM'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="@moodCode" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1 ACD Custodian Entry - "ACD Custodian Entry" - The 'act' tag 'moodCode' attribute is missing. Refer to section 7.1.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@moodCode</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="@moodCode = 'EVN'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1 Clinical Synopsis - "ACD Custodian Entry" - The 'act' tag 'moodCode' attribute shall contain the value 'EVN'. Refer to section 7.1.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@moodCode = 'EVN'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M30" />
  </xsl:template>
  <xsl:template match="cda:code[@code = '102.16690']" priority="3998" mode="M30">
    <xsl:choose>
      <xsl:when test="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16694']/cda:entry/cda:act/cda:code[@code = '102.16690']" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1 ACD Custodian Entry - "ACD Custodian Entry" - The "/ClinicalDocument/component/structuredBody/component/section[code/@code = '101.16694']/entry/act/code[@code = '102.16690']" path - 1 or more tags are missing. Refer section 7.1.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16694']/cda:entry/cda:act/cda:code[@code = '102.16690']</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="@codeSystem" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1 ACD Custodian Entry - "ACD Custodian Entry" - The 'code' tag 'codeSystem' attribute is missing. Refer to section 7.1.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@codeSystem</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="@codeSystem = '1.2.36.1.2001.1001.101'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1 ACD Custodian Entry - "ACD Custodian Entry" - The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'. Refer to section 7.1.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@codeSystem = '1.2.36.1.2001.1001.101'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="translate(@codeSystemName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'NCTIS DATA COMPONENTS'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1 ACD Custodian Entry - "ACD Custodian Entry" - The 'code' tag 'codeSystemName' attribute shall contain the value 'NCTIS Data Components'. Refer to section 7.1.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">translate(@codeSystemName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'NCTIS DATA COMPONENTS'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'ACD CUSTODIAN ENTRY'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1 ACD Custodian Entry - "ACD Custodian Entry" - The 'code' tag 'displayName' attribute shall contain the value 'ACD Custodian Entry'. Refer to section 7.1.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'ACD CUSTODIAN ENTRY'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M30" />
  </xsl:template>
  <xsl:template match="text()" priority="-1" mode="M30" />
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16694']/cda:entry[cda:act/cda:code/@code = '102.16690']/cda:act/cda:performer[not(cda:assignedEntity/cda:assignedPerson)]" priority="4000" mode="M31">
    <xsl:if test="count(cda:assignedEntity) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1.1.2 ACD Custodian (Organisation) - "ACD Custodian / Role" - The 'assignedEntity' tag shall appear only once. Refer to section 7.1.1.1.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:assignedEntity) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="@typeCode" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1.1.2 ACD Custodian (Organisation) - "ACD Custodian / Participation Type" - The 'performer' tag 'typeCode' attribute is missing. Refer to section 7.1.1.1.1.2 Organisation of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@typeCode</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="@typeCode = 'PRF'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1.1.2 ACD Custodian (Organisation) - "ACD Custodian / Participation Type" - The 'performer' tag 'typeCode' attribute shall contain the value 'PRF'. Refer to section 7.1.1.1.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@typeCode = 'PRF'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:time) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1.1.2 ACD Custodian (Organisation) - "ACD Custodian / Participation Period" - The 'time' tag shall appear only once. Refer to section 7.1.1.1.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:time) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M31" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16694']/cda:entry[cda:act/cda:code/@code = '102.16690']/cda:act/cda:performer[not(cda:assignedEntity/cda:assignedPerson)]/cda:assignedEntity" priority="3999" mode="M31">
    <xsl:choose>
      <xsl:when test="cda:code" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1.1.2 ACD Custodian (Organisation) - "ACD Custodian / Role" - The 'code' tag is missing. Refer to section 7.1.1.1.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:code</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:code) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1.1.2 ACD Custodian (Organisation) - "ACD Custodian / Role" - The 'code' tag shall appear only once. Refer to section 7.1.1.1.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:code) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="cda:id" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1.1.2 ACD Custodian (Organisation) - "Performer / Assigned Entity / id" - The 'id' tag is missing. Refer to section 7.1.1.1.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:id</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:id) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1.1.2 ACD Custodian (Organisation) - "Performer / Assigned Entity / id" - The 'id' tag shall appear only once. Refer to section 7.1.1.1.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:id) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="cda:representedOrganization" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1.1.2 ACD Custodian (Organisation) - "ACD Custodian / Participant" - The 'representedOrganization' tag is missing. Refer to section 7.1.1.1.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:representedOrganization</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:representedOrganization) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1.1.2 ACD Custodian (Organisation) - "ACD Custodian / Participant" - The 'representedOrganization' tag shall appear only once. Refer to section 7.1.1.1.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:representedOrganization) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M31" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16694']/cda:entry[cda:act/cda:code/@code = '102.16690']/cda:act/cda:performer[not(cda:assignedEntity/cda:assignedPerson)]/cda:assignedEntity/cda:addr[@use]" priority="3998" mode="M31">
    <xsl:choose>
      <xsl:when test="document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'ISO3166-1']/code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')]/@code = 'AU'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1.1.2 ACD Custodian (Organisation) - "ACD Custodian / Participant / Address / Australia or International Address / International Address / Country" - The 'country' tag shall contain the value 'Australia'. Refer to section 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'ISO3166-1']/code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')]/@code = 'AU'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M31" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16694']/cda:entry[cda:act/cda:code/@code = '102.16690']/cda:act/cda:performer[not(cda:assignedEntity/cda:assignedPerson)]/cda:assignedEntity/cda:representedOrganization/cda:asOrganizationPartOf/cda:wholeOrganization" priority="3997" mode="M31">
    <xsl:choose>
      <xsl:when test="cda:name" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1.1.2 ACD Custodian (Organisation) - Organisation - "ACD Custodian / Participant / Organisation or Organisation or Device / Organisation / Employer Organisation / Organisation / Organisation Name" - The 'name' tag is missing. Refer to section 7.1.1.1.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:name</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="normalize-space(cda:name) !=  ''" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1.1.2 ACD Custodian (Organisation) - "ACD Custodian / Participant / Organisation or Organisation or Device / Organisation / Employer Organisation / Organisation / Organisation Name" - The 'name' tag shall contain a value. Refer to section 7.1.1.1.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">normalize-space(cda:name) !=  ''</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:name) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1.1.2 ACD Custodian (Organisation) - "ACD Custodian / Participant / Organisation or Organisation or Device / Organisation / Employer Organisation / Organisation / Organisation Name" - The 'name' tag shall appear only once. Refer to section 7.1.1.1.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:name) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="cda:name[@use] and not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Health_Care_Provider_Organisation_Name_Usage']/code[(@code = current()/cda:name/@use) or (@alternativeCode = current()/cda:name/@use) or (@hl7Code = current()/cda:name/@use)])">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1.1.2 ACD Custodian (Organisation) - "ACD Custodian / Participant / Person or Organisation or Device / Person / Employer Organisation / Organisation / Organisation Name Usage" - The 'name' tag 'use' attribute shall be as per AS 4846-2006: Health Care Provider Organisation Name Usage. Refer to section 7.1.1.1.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">cda:name[@use] and not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Health_Care_Provider_Organisation_Name_Usage']/code[(@code = current()/cda:name/@use) or (@alternativeCode = current()/cda:name/@use) or (@hl7Code = current()/cda:name/@use)])</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M31" />
  </xsl:template>
  <xsl:template match="text()" priority="-1" mode="M31" />
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16694']/cda:entry[cda:act/cda:code/@code = '102.16690']/cda:act" priority="4000" mode="M32">
    <xsl:choose>
      <xsl:when test="cda:performer" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1.1.1 ACD Custodian (Person) - "ACD Custodian (Person)" or 7.1.1.1.1.2 ACD Custodian (Organisation) - "ACD Custodian (Organisation)" - The 'performer' tag is missing. Refer to section 7.1.1.1.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:performer</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:performer) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1.1.1 ACD Custodian (Person) - "ACD Custodian (Person)" or 7.1.1.1.1.2 ACD Custodian (Organisation) - "ACD Custodian (Organisation)" - The 'performer' tag shall appear only once. Refer to section 7.1.1.1.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:performer) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M32" />
  </xsl:template>
  <xsl:template match="cda:performer[cda:assignedEntity/cda:assignedPerson]" priority="3999" mode="M32">
    <xsl:if test="count(cda:time) &gt;1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1.1.1 ACD Custodian (Person) - "ACD Custodian / Participation Period" - The 'time' tag shall appear only once. Refer to section 7.1.1.1.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:time) &gt;1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="@typeCode" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1.1.1 ACD Custodian (Person) - "ACD Custodian / Participation Type" - The 'performer' tag 'typeCode' attribute is missing. Refer to section 7.1.1.1.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@typeCode</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="@typeCode = 'PRF'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1.1.1 ACD Custodian (Person) - "ACD Custodian / Participation Type" - The 'performer' tag 'typeCode' attribute shall contain the value 'PRF'. Refer to section 7.1.1.1.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@typeCode = 'PRF'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16694']/cda:entry[cda:act/cda:code/@code = '102.16690']/cda:act[cda:performer/cda:assignedEntity/cda:assignedPerson]" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1.1.1 ACD Custodian (Person) - "ACD Custodian / Role" - The "/ClinicalDocument/component/structuredBody/component/section[code/@code = '101.16694']/entry[act/code/@code = '102.16690']/act[performer/assignedEntity/assignedPerson]" path - 1 or more tags are missing. Refer to section 7.1.1.1.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16694']/cda:entry[cda:act/cda:code/@code = '102.16690']/cda:act[cda:performer/cda:assignedEntity/cda:assignedPerson]</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:assignedEntity) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1.1.1 ACD Custodian (Person) - "ACD Custodian / Role" - The 'assignedEntity' tag shall appear only once. Refer to section 7.1.1.1.1.1 Person of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:assignedEntity) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M32" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16694']/cda:entry[cda:act/cda:code/@code = '102.16690']/cda:act/cda:performer[cda:assignedEntity/cda:assignedPerson]/cda:assignedEntity" priority="3998" mode="M32">
    <xsl:choose>
      <xsl:when test="cda:code" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1.1.1 ACD Custodian (Person) - "ACD Custodian / Role" - The 'code' tag is missing. Refer to section 7.1.1.1.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:code</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:code) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1.1.1 ACD Custodian (Person) - "ACD Custodian / Role" - The 'code' tag shall appear only once. Refer to section 7.1.1.1.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:code) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="cda:id" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1.1.1 ACD Custodian (Person) - "Performer / Assigned Entity / id" - The 'id' tag is missing. Refer to section 7.1.1.1.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:id</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:id) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1.1.1 ACD Custodian (Person) - "Performer / Assigned Entity / id" - The 'id' tag shall appear only once. Refer to section 7.1.1.1.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:id) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="cda:id[@root]" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1.1.1 ACD Custodian (Person) - "Performer / Assigned Entity / id" - The 'id' tag 'root' attribute is missing. Refer to section 7.1.1.1.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:id[@root]</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="cda:id[normalize-space(@root) !=  '']" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1.1.1 ACD Custodian (Person) - "Performer / Assigned Entity / id" - The 'id' tag 'root' attribute shall contain a UUID. Refer to section 7.1.1.1.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:id[normalize-space(@root) !=  '']</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:assignedPerson) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1.1.1 ACD Custodian (Person) - "ACD Custodian / Participant" - The 'assignedPerson' tag shall appear only once. Refer to section 7.1.1.1.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:assignedPerson) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="cda:addr" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1.1.1 ACD Custodian (Person) - "ACD Custodian / Participant / Address" - The 'addr' tag is missing. Refer to section 7.1.1.1.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:addr</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M32" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16694']/cda:entry[cda:act/cda:code/@code = '102.16690']/cda:act/cda:performer[cda:assignedEntity/cda:assignedPerson]/cda:assignedEntity/cda:addr[@use]" priority="3997" mode="M32">
    <xsl:choose>
      <xsl:when test="document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'ISO3166-1']/code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')]/@code = 'AU'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1.1.1 ACD Custodian (Person) - "ACD Custodian / Participant / Address / Australia or International Address / International Address / Country" - The 'country' tag shall contain the value 'Australia'. Refer to section 8.6 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'ISO3166-1']/code[translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = translate(current()/cda:country, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')]/@code = 'AU'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M32" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16694']/cda:entry[cda:act/cda:code/@code = '102.16690']/cda:act/cda:performer/cda:assignedEntity/cda:assignedPerson" priority="3996" mode="M32">
    <xsl:choose>
      <xsl:when test="cda:name" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1.1.1 ACD Custodian (Person) - "ACD Custodian / Participant / Person or Organisation or Device / Person / Person Name" - The 'name' tag is missing. Refer to section 8.5 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:name</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(ext:asEmployment) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1.1.1 ACD Custodian (Person) - "ACD Custodian / Participant / Person or Organisation or Device / Person / Employment Detail" - The 'asEmployment' tag shall appear only once. Refer to section 7.1.1.1.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(ext:asEmployment) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M32" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '101.16694']/cda:entry[cda:act/cda:code/@code = '102.16690']/cda:act/cda:performer/cda:assignedEntity/cda:assignedPerson/ext:administrativeGenderCode" priority="3995" mode="M32">
    <xsl:choose>
      <xsl:when test="@code" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1.1.1 ACD Custodian (Person) - "ACD Custodian / Participant / Person or Organisation or Device / Person / Demographic Data / Sex" - The 'administrativeGenderCode' tag 'code' attribute is missing. Refer to section 10.2 AS 5017-2006 Health Care Client Identifier Sex of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@code</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="@codeSystem" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1.1.1 ACD Custodian (Person) - "ACD Custodian / Participant / Person or Organisation or Device / Person / Demographic Data / Sex" - The 'administrativeGenderCode' tag 'codeSystem' attribute is missing. Refer to section 10.2 AS 5017-2006 Health Care Client Identifier Sex of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@codeSystem</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'AS_5017-2006_Health_Care_Client_Identifier_Sex']/code[(@code = current()/@code)]" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1.1.1 ACD Custodian (Person) - "ACD Custodian / Participant / Person or Organisation or Device / Person / Demographic Data / Sex" - The 'administrativeGenderCode' tag 'code' attribute shall be as per AS 5017-2006 Health Care Client Identifier Sex. Refer to section 10.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'AS_5017-2006_Health_Care_Client_Identifier_Sex']/code[(@code = current()/@code)]</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'AS_5017-2006_Health_Care_Client_Identifier_Sex']/code[(@codeSystem = current()/@codeSystem)]" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1.1.1 ACD Custodian (Person) - "ACD Custodian / Participant / Person or Organisation or Device / Person / Demographic Data / Sex" - The 'administrativeGenderCode' tag 'codeSystem' attribute shall be as per AS 5017-2006 Health Care Client Identifier Sex. Refer to section 10.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'AS_5017-2006_Health_Care_Client_Identifier_Sex']/code[(@codeSystem = current()/@codeSystem)]</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="@codeSystemName and not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'AS_5017-2006_Health_Care_Client_Identifier_Sex']/code[(@codeSystemName = current()/@codeSystemName)])">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1.1.1 ACD Custodian (Person) - "ACD Custodian / Participant / Person or Organisation or Device / Person / Demographic Data / Sex" - The 'administrativeGenderCode' tag 'codeSystemName' attribute shall be as per AS 5017-2006 Health Care Client Identifier Sex. Refer to section 10.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@codeSystemName and not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'AS_5017-2006_Health_Care_Client_Identifier_Sex']/code[(@codeSystemName = current()/@codeSystemName)])</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="@displayName and not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'AS_5017-2006_Health_Care_Client_Identifier_Sex']/code[(translate(@displayName,  'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = translate(current()/@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'))])">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1.1.1 ACD Custodian (Person) - "ACD Custodian / Participant / Person or Organisation or Device / Person / Demographic Data / Sex" - The 'administrativeGenderCode' tag 'displayName' attribute shall be as per AS 5017-2006 Health Care Client Identifier Sex. Refer to section 10.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@displayName and not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'AS_5017-2006_Health_Care_Client_Identifier_Sex']/code[(translate(@displayName,  'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = translate(current()/@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'))])</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="@displayName and @code !=  substring(@displayName,1,1)">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1.1.1 ACD Custodian (Person) - "ACD Custodian / Participant / Person or Organisation or Device / Person / Demographic Data / Sex" - The 'administrativeGenderCode' tag: 'code' and 'displayName' attributes shall match as per AS 5017-2006 Health Care Client Identifier Sex. Refer to section 6.1.2 and 10.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@displayName and @code !=  substring(@displayName,1,1)</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M32" />
  </xsl:template>
  <xsl:template match="text()" priority="-1" mode="M32" />
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody" priority="4000" mode="M33">
    <xsl:if test="count(cda:component/cda:section[cda:code/@code='102.16080']/cda:entry[cda:observation/cda:code/@code = '103.20109']) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject of Care - The 'cda:entry[cda:observation/code/@code = '103.20109']' tag shall appear only once. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:component/cda:section[cda:code/@code='102.16080']/cda:entry[cda:observation/cda:code/@code = '103.20109']) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="cda:component/cda:section[cda:code/@code = '101.16694']/cda:entry[cda:act/cda:code/@code = '102.16690']" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 7.1.1.1 ACD Custodian Entry - The 'cda:entry[cda:act/cda:code/@code = '102.16690']' tag is missing. Refer to section 7.1.1.1 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:component/cda:section[cda:code/@code = '101.16694']/cda:entry[cda:act/cda:code/@code = '102.16690']</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M33" />
  </xsl:template>
  <xsl:template match="text()" priority="-1" mode="M33" />
  <xsl:template match="ext:asEmployment" priority="4000" mode="M34">
    <xsl:choose>
      <xsl:when test="@classCode" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 8.8 Employment - The 'asEmployment' tag 'classCode' attribute is missing. Check all 'ext:asEmployment' tags to find the missing attribute. Refer to section 8.8 Employment of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@classCode</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="not(@classCode) or normalize-space(@classCode) != ''" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 8.8 Employment - The 'asEmployment' tag 'classCode' attribute shall contain a value. Check all 'ext:asEmployment' tags to find the missing attribute. Refer to section 8.8 Employment of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">not(@classCode) or normalize-space(@classCode) != ''</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="@classCode='EMP'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 8.8 Employment - The 'asEmployment' tag 'classCode' attribute shall contain the value 'EMP'. Check all 'ext:asEmployment' tags to find the incorrect attribute. Refer to section 8.8 Employment of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@classCode='EMP'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(ext:employerOrganization) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 8.8 Employment - The 'ext:employerOrganization' tag shall appear only once. Check all 'ext:asEmployment' tags to find the duplicate tag. Refer to section 8.8 Employment of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(ext:employerOrganization) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(ext:code) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 8.8 Employment - The 'ext:code' tag shall appear only once. Check all 'ext:asEmployment' tags to find the duplicate tag. Refer to section 8.8 Employment of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(ext:code) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(ext:jobCode) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 8.8 Employment - The 'ext:jobCode' tag shall appear only once. Check all 'ext:asEmployment' tags to find the duplicate tag. Refer to section 8.8 Employment of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(ext:jobCode) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(ext:jobClassCode) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 8.8 Employment - The 'ext:jobClassCode' tag shall appear only once. Check all 'ext:asEmployment' tags to find the duplicate tag. Refer to section 8.8 Employment of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(ext:jobClassCode) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M34" />
  </xsl:template>
  <xsl:template match="ext:asEmployment/ext:jobCode" priority="3999" mode="M34">
    <xsl:choose>
      <xsl:when test="@code" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 8.8 Employment - The 'jobCode' tag 'code' attribute is missing. Check all 'ext:asEmployment/ext:jobCode' tags to find the missing attribute. Refer to section 8.8 Employment of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@code</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="not(@code) or normalize-space(@code) != ''" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 8.8 Employment - The 'jobCode' tag 'code' attribute shall contain a value. Check all 'ext:asEmployment/ext:jobCode' tags to find the missing attribute. Refer to section 8.8 Employment of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">not(@code) or normalize-space(@code) != ''</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@code) or                 normalize-space(@code) = '' or                 document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = '1220.0 - ANZSCO - Australian and New Zealand Standard Classification of Occupations, First Edition, 2006']/code[                 @code = current()/@code]" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 8.8 Employment - The 'jobCode' tag 'code' attribute shall be as per '1220.0 - ANZSCO - Australian and New Zealand Standard Classification of Occupations, First Edition, 2006'. Check all 'ext:asEmployment/ext:jobCode' tags to find the incorrect attribute. Refer to section 8.8 Employment of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@code) or                 normalize-space(@code) = '' or                 document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = '1220.0 - ANZSCO - Australian and New Zealand Standard Classification of Occupations, First Edition, 2006']/code[                 @code = current()/@code]</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="@codeSystem" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 8.8 Employment - The 'jobCode' tag 'codeSystem' attribute is missing. Check all 'ext:asEmployment/ext:jobCode' tags to find the missing attribute. Refer to section 8.8 Employment of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@codeSystem</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="not(@codeSystem) or normalize-space(@codeSystem) != ''" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 8.8 Employment - The 'jobCode' tag 'codeSystem' attribute shall contain a value. Check all 'ext:asEmployment/ext:jobCode' tags to find the missing attribute. Refer to section 8.8 Employment of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">not(@codeSystem) or normalize-space(@codeSystem) != ''</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="                 not(@codeSystem) or                 normalize-space(@codeSystem) = '' or                 document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = '1220.0 - ANZSCO - Australian and New Zealand Standard Classification of Occupations, First Edition, 2006']/code[                 @codeSystem = current()/@codeSystem]" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 8.8 Employment - The 'jobCode' tag 'codeSystem' attribute shall be as per '1220.0 - ANZSCO - Australian and New Zealand Standard Classification of Occupations, First Edition, 2006'. Check all 'ext:asEmployment/ext:jobCode' tags to find the incorrect attribute. Refer to section 8.8 Employment of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">                 not(@codeSystem) or                 normalize-space(@codeSystem) = '' or                 document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = '1220.0 - ANZSCO - Australian and New Zealand Standard Classification of Occupations, First Edition, 2006']/code[                 @codeSystem = current()/@codeSystem]</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="@codeSystemName and normalize-space(@codeSystemName) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 8.8 Employment - The 'jobCode' tag 'codeSystemName' attribute shall contain a value. Check all 'ext:asEmployment/ext:jobCode' tags to find the missing attribute. Refer to section 8.8 Employment of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@codeSystemName and normalize-space(@codeSystemName) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="                 @codeSystemName and                 normalize-space(@codeSystemName) != '' and                 translate(@codeSystemName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') != '1220.0 - ANZSCO - AUSTRALIAN AND NEW ZEALAND STANDARD CLASSIFICATION OF OCCUPATIONS, FIRST EDITION, 2006'">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 8.8 Employment - The 'jobCode' tag 'codeSystemName' attribute shall be '1220.0 - ANZSCO - Australian and New Zealand Standard Classification of Occupations, First Edition, 2006'. Check all 'ext:asEmployment/ext:jobCode' tags to find the incorrect attribute. Refer to section 8.8 Employment of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 @codeSystemName and                 normalize-space(@codeSystemName) != '' and                 translate(@codeSystemName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') != '1220.0 - ANZSCO - AUSTRALIAN AND NEW ZEALAND STANDARD CLASSIFICATION OF OCCUPATIONS, FIRST EDITION, 2006'</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="@displayName and normalize-space(@displayName) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 8.8 Employment - The 'jobCode' tag 'displayName' attribute shall contain a value. Check all 'ext:asEmployment/ext:jobCode' tags to find the missing attribute. Refer to section 8.8 Employment of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@displayName and normalize-space(@displayName) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="                 @displayName and                 normalize-space(@displayName) != '' and                 document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = '1220.0 - ANZSCO - Australian and New Zealand Standard Classification of Occupations, First Edition, 2006']                 /code[(@code = current()/@code) and (translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') != translate(current()/@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'))]">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 8.8 Employment - The 'jobCode' tag 'code' and 'displayName' attribute shall be as per '1220.0 - ANZSCO - Australian and New Zealand Standard Classification of Occupations, First Edition, 2006'. Check all 'ext:asEmployment/ext:jobCode' tags to find the incorrect attribute. Refer to section 8.8 Employment of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">                 @displayName and                 normalize-space(@displayName) != '' and                 document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = '1220.0 - ANZSCO - Australian and New Zealand Standard Classification of Occupations, First Edition, 2006']                 /code[(@code = current()/@code) and (translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') != translate(current()/@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'))]</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M34" />
  </xsl:template>
  <xsl:template match="ext:asEmployment/ext:employerOrganization" priority="3998" mode="M34">
    <xsl:choose>
      <xsl:when test="cda:asOrganizationPartOf" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 8.8 Employment - The 'asOrganizationPartOf' tag is missing. Check all 'ext:asEmployment/ext:employerOrganization' tags to find the missing tag. Refer to section 8.8 Employment of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:asOrganizationPartOf</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:asOrganizationPartOf) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 8.8 Employment - The 'asOrganizationPartOf' tag shall appear only once. Check all 'ext:asEmployment/ext:employerOrganization' tags to find the duplicate tag. Refer to section 8.8 Employment of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:asOrganizationPartOf) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(cda:name) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 8.8 Employment - The 'name' tag shall appear only once. Check all 'ext:asEmployment/ext:employerOrganization' tags to find the duplicate tag. Refer to section 8.8 Employment of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:name) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M34" />
  </xsl:template>
  <xsl:template match="ext:asEmployment/ext:employerOrganization/cda:name" priority="3997" mode="M34">
    <xsl:choose>
      <xsl:when test="normalize-space(.) != ''" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 8.8 Employment - The 'name' tag shall contain a value. Check all 'ext:asEmployment/ext:employerOrganization/cda:name' tags to find the missing value. Refer to section 8.8 Employment of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">normalize-space(.) != ''</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M34" />
  </xsl:template>
  <xsl:template match="ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf" priority="3996" mode="M34">
    <xsl:choose>
      <xsl:when test="cda:wholeOrganization" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 8.8 Employment - The 'wholeOrganization' tag is missing. Check all 'ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf' tags to find the missing tag. Refer to section 8.8 Employment of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:wholeOrganization</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:wholeOrganization) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 8.8 Employment - The 'wholeOrganization' tag shall appear only once. Check all 'ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf' tags to find the duplicate tag. Refer to section 8.8 Employment of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:wholeOrganization) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M34" />
  </xsl:template>
  <xsl:template match="ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization" priority="3995" mode="M34">
    <xsl:choose>
      <xsl:when test="ext:asEntityIdentifier" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 8.8 Employment - The 'ext:asEntityIdentifier' tag is missing. Check all 'ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization' tags to find the missing tag. Refer to section 8.8 Employment of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">ext:asEntityIdentifier</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="ext:asEntityIdentifier/ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.800362')]" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 8.8 Employment - The 'HPI-O asEntityIdentifier' tag is missing. "The value of one Entity Identifier SHALL be an Australian HPI-O." although there could be multiple Entity Identifiers. Check all 'ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization' tags to find the missing tag. Refer to section 8.8 Employment of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">ext:asEntityIdentifier/ext:id[starts-with(@root, '1.2.36.1.2001.1003.0.800362')]</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="cda:name" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 8.8 Employment - The 'name' tag is missing. Check all 'ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization' tags to find the missing tag. Refer to section 8.8 Employment of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:name</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:name) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 8.8 Employment - The 'name' tag shall appear only once. Check all 'ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization' tags to find the duplicate tag. Refer to section 8.8 Employment of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:name) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M34" />
  </xsl:template>
  <xsl:template match="ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization/cda:name" priority="3994" mode="M34">
    <xsl:choose>
      <xsl:when test="not(@nullFlavor)" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 8.8 Employment - The 'name' tag 'nullFlavor' attribute shall not be present. Refer to requirements in NullFlavor Usage Clarification FAQ and section 8.8 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">not(@nullFlavor)</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="normalize-space(.) != ''" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 8.8 Employment - The 'name' tag shall contain a value. Check all 'ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization/cda:name' tags to find the missing value. Refer to section 8.8 Employment of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">normalize-space(.) != ''</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="@use and normalize-space(@use) = ''">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 8.8 Employment - The 'name' tag 'use' attribute shall contain a value. Check all 'ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization/cda:name' tags to find the incorrect tag. Refer to section 10.4 AS 4846-2006: Health Care Provider Organisation Name Usage of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@use and normalize-space(@use) = ''</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="@use and not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Health_Care_Provider_Organisation_Name_Usage']/code                 [(@code = (current()/@use))                 or (@alternativeCode = (current()/@use))                 or (@hl7Code = (current()/@use))])">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 8.8 Employment - The 'name' tag 'use' attribute shall be coded as per AS 4846-2006: Health Care Provider Organisation Name Usage. Check all 'ext:asEmployment/ext:employerOrganization/cda:asOrganizationPartOf/cda:wholeOrganization/cda:name' tags to find the incorrect tag. Refer to section 10.4 AS 4846-2006: Health Care Provider Organisation Name Usage of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">@use and not(document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Health_Care_Provider_Organisation_Name_Usage']/code                 [(@code = (current()/@use))                 or (@alternativeCode = (current()/@use))                 or (@hl7Code = (current()/@use))])</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M34" />
  </xsl:template>
  <xsl:template match="text()" priority="-1" mode="M34" />
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16080']/cda:entry/cda:observation/cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')='DATE OF BIRTH IS CALCULATED FROM AGE') or (@code='103.16233')]" priority="4000" mode="M35">
    <xsl:choose>
      <xsl:when test="@code = '103.16233'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Code Checks - The 'code' tag 'code' attribute shall be '103.16233'. Refer to section "'6.1.2 Subject of Care'" of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@code = '103.16233'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')='DATE OF BIRTH IS CALCULATED FROM AGE')" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Code Checks - The 'code' tag 'displayName' attribute shall be 'Date of Birth is Calculated From Age'. Refer to section "'6.1.2 Subject of Care'" of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')='DATE OF BIRTH IS CALCULATED FROM AGE')</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M35" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16080']/cda:entry/cda:observation/cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')='DATE OF BIRTH ACCURACY INDICATOR') or (@code='102.16234')]" priority="3999" mode="M35">
    <xsl:choose>
      <xsl:when test="@code = '102.16234'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Code Checks - The 'code' tag 'code' attribute shall be '103.16234'. Refer to section "'6.1.2 Subject of Care'" of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@code = '102.16234'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')='DATE OF BIRTH ACCURACY INDICATOR')" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Code Checks - The 'code' tag 'displayName' attribute shall be 'Date of Birth Accuracy Indicator'. Refer to section "'6.1.2 Subject of Care'" of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')='DATE OF BIRTH ACCURACY INDICATOR')</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M35" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16080']/cda:entry/cda:observation/cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')='AGE') or (@code='103.20109')]" priority="3998" mode="M35">
    <xsl:choose>
      <xsl:when test="@code = '103.20109'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Code Checks - The 'code' tag 'code' attribute shall be '103.20109'. Refer to section "'6.1.2 Subject of Care'" of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@code = '103.20109'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')='AGE')" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Code Checks - The 'code' tag 'displayName' attribute shall be 'Age'. Refer to section "'6.1.2 Subject of Care'" of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')='AGE')</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M35" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16080']/cda:entry/cda:observation/cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='AGE ACCURACY INDICATOR') or (@code='103.16279')]" priority="3997" mode="M35">
    <xsl:choose>
      <xsl:when test="@code = '103.16279'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Code Checks - The 'code' tag 'code' attribute shall be '103.16279'. Refer to section "'6.1.2 Subject of Care'" of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@code = '103.16279'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='AGE ACCURACY INDICATOR')" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Code Checks - The 'code' tag 'displayName' attribute shall be 'Age Accuracy Indicator'. Refer to section "'6.1.2 Subject of Care'" of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='AGE ACCURACY INDICATOR')</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M35" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16080']/cda:entry/cda:observation/cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='BIRTH PLURALITY') or (@code='103.16249')]" priority="3996" mode="M35">
    <xsl:choose>
      <xsl:when test="@code = '103.16249'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Code Checks - The 'code' tag 'code' attribute shall be '103.16249'. Refer to section "'6.1.2 Subject of Care'" of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@code = '103.16249'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='BIRTH PLURALITY')" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Code Checks - The 'code' tag 'displayName' attribute shall be 'Birth Plurality'. Refer to section "'6.1.2 Subject of Care'" of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='BIRTH PLURALITY')</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M35" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='102.16080']/cda:entry/cda:observation/cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='DATE OF DEATH ACCURACY INDICATOR') or (@code='102.16252')]" priority="3995" mode="M35">
    <xsl:choose>
      <xsl:when test="@code = '102.16252'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Code Checks - The 'code' tag 'code' attribute shall be '102.16252'. Refer to section "'6.1.2 Subject of Care'" of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@code = '102.16252'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='DATE OF DEATH ACCURACY INDICATOR')" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Code Checks - The 'code' tag 'displayName' attribute shall be 'Date of Death Accuracy Indicator'. Refer to section "'6.1.2 Subject of Care'" of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='DATE OF DEATH ACCURACY INDICATOR')</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M35" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code='101.16694']/cda:entry/cda:act[cda:code[(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='ACD CUSTODIAN ENTRY') or (@code='102.16690')]]/cda:code" priority="3994" mode="M35">
    <xsl:choose>
      <xsl:when test="@code = '102.16690'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Code Checks - The 'code' tag 'code' attribute shall be '102.16690'. Refer to section "'7.1.1.1 ACD Custodian Entry'" of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@code = '102.16690'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='ACD CUSTODIAN ENTRY')" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - Global Code Checks - The 'code' tag 'displayName' attribute shall be 'ACD Custodian Entry'. Refer to section "'7.1.1.1 ACD Custodian Entry'" of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">(translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') ='ACD CUSTODIAN ENTRY')</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M35" />
  </xsl:template>
  <xsl:template match="text()" priority="-1" mode="M35" />
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']" priority="4000" mode="M36">
    <xsl:if test="count(cda:entry/cda:observation/cda:code[@code = 103.20109]) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age" - The 'entry' tag shall appear only once. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:entry/cda:observation/cda:code[@code = 103.20109]) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M36" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry[cda:observation/cda:code/@code = '103.20109']" priority="3999" mode="M36">
    <xsl:if test="count(cda:observation) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age" - The 'observation' tag shall appear only once. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:observation) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M36" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation[cda:code/@code = '103.20109']" priority="3998" mode="M36">
    <xsl:choose>
      <xsl:when test="@classCode = 'OBS'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age" - The 'observation' tag 'classCode' attribute shall contain the value 'OBS'. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@classCode = 'OBS'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="@moodCode = 'EVN'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age" - The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@moodCode = 'EVN'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="cda:id" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age" - The 'id' tag is missing. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:id</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:id) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age" - The 'id' tag shall appear only once. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:id) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="cda:value" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age" - The 'value' tag is missing. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:value</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:value) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age" - The 'value' tag shall appear only once. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:value) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(cda:code) &gt;1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age" - The 'code' tag shall appear only once. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:code) &gt;1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M36" />
  </xsl:template>
  <xsl:template match="cda:code[@code = '103.20109']" priority="3997" mode="M36">
    <xsl:choose>
      <xsl:when test="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation/cda:code[@code = '103.20109']" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age" - The "/ClinicalDocument/component/structuredBody/component/section[code/@code = '102.16080']/entry/observation/code[@code = '103.20109']" path - 1 or more tags are missing. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation/cda:code[@code = '103.20109']</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="@codeSystem = '1.2.36.1.2001.1001.101'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age" - The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@codeSystem = '1.2.36.1.2001.1001.101'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="translate(@codeSystemName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'NCTIS DATA COMPONENTS'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age" - The 'code' tag 'codeSystemName' attribute shall contain the value 'NCTIS Data Components'. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">translate(@codeSystemName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'NCTIS DATA COMPONENTS'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'AGE'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age" - The 'code' tag 'displayName' attribute shall contain the value 'Age'. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'AGE'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M36" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation[cda:code/@code = '103.20109']/cda:value" priority="3996" mode="M36">
    <xsl:choose>
      <xsl:when test="@value" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age" - The 'value' tag 'value' attribute is missing. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@value</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="normalize-space(@value) !=  ''" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age" - The 'value' tag 'value' attribute shall contain a physical quantity. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">normalize-space(@value) !=  ''</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="@unit" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age" - The 'value' tag 'unit' attribute is missing. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@unit</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="normalize-space(@unit) !=  ''" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age" - The 'value' tag 'unit' attribute shall contain a physical quantity. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">normalize-space(@unit) !=  ''</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M36" />
  </xsl:template>
  <xsl:template match="text()" priority="-1" mode="M36" />
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']" priority="4000" mode="M37">
    <xsl:if test="count(cda:entry/cda:observation/cda:code[@code = 103.16279]) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age Accuracy Indicator" - The 'entry' tag shall appear only once. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:entry/cda:observation/cda:code[@code = 103.16279]) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M37" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry[cda:observation/cda:code/@code = '103.16279']" priority="3999" mode="M37">
    <xsl:if test="count(cda:observation) &gt;1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age Accuracy Indicator" - The 'observation' tag shall appear only once. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:observation) &gt;1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M37" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation[cda:code/@code = '103.16279']" priority="3998" mode="M37">
    <xsl:choose>
      <xsl:when test="@classCode = 'OBS'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age Accuracy Indicator" - The 'observation' tag 'classCode' attribute shall be 'OBS'. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@classCode = 'OBS'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="@moodCode = 'EVN'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age Accuracy Indicator" - The 'observation' tag 'moodCode' attribute shall be 'EVN'. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@moodCode = 'EVN'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="cda:id" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age Accuracy Indicator" - The 'id' tag is missing. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:id</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:id) &gt;1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age Accuracy Indicator" - The 'id' tag shall appear only once. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:id) &gt;1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="cda:value" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age Accuracy Indicator" - The 'value' tag is missing. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:value</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:value) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age Accuracy Indicator" - The 'value' tag shall appear only once. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:value) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(cda:code) &gt;1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age Accuracy Indicator" - The 'code' tag shall appear only once. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:code) &gt;1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M37" />
  </xsl:template>
  <xsl:template match="cda:code[@code = '103.16279']" priority="3997" mode="M37">
    <xsl:choose>
      <xsl:when test="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation/cda:code[@code = '103.16279']" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age Accuracy Indicator" - The "/ClinicalDocument/component/structuredBody/component/section[code/@code = '102.16080']/entry/observation/code[@code = '103.16279']" path - 1 or more tags are missing. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation/cda:code[@code = '103.16279']</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="@codeSystem = '1.2.36.1.2001.1001.101'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age Accuracy Indicator" - The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@codeSystem = '1.2.36.1.2001.1001.101'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="translate(@codeSystemName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'NCTIS DATA COMPONENTS'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age Accuracy Indicator" - The 'code' tag 'codeSystemName' attribute shall be 'NCTIS Data Components'. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">translate(@codeSystemName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'NCTIS DATA COMPONENTS'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'AGE ACCURACY INDICATOR'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age Accuracy Indicator" - The 'code' tag 'displayName' attribute shall contain the value 'Age Accuracy Indicator'. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'AGE ACCURACY INDICATOR'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M37" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation[cda:code/@code = '103.16279']/cda:value" priority="3996" mode="M37">
    <xsl:choose>
      <xsl:when test="@value and @value = 'true' or @value = 'false'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Age Detail / Age Accuracy Indicator" - The 'value' tag 'value' attribute shall contain the value "true" or "false". Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@value and @value = 'true' or @value = 'false'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M37" />
  </xsl:template>
  <xsl:template match="text()" priority="-1" mode="M37" />
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']" priority="4000" mode="M38">
    <xsl:if test="count(cda:entry/cda:observation/cda:code[@code = 103.16249]) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Birth Plurality" - The 'entry' tag shall appear only once. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:entry/cda:observation/cda:code[@code = 103.16249]) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M38" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry[cda:observation/cda:code/@code = '103.16249']" priority="3999" mode="M38">
    <xsl:if test="count(cda:observation) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Birth Plurality" - The 'observation' tag shall appear only once. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:observation) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M38" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation[cda:code/@code = '103.16249']" priority="3998" mode="M38">
    <xsl:choose>
      <xsl:when test="@classCode = 'OBS'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Birth Plurality" - The 'observation' tag 'classCode' attribute shall contain the value 'OBS'. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@classCode = 'OBS'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="@moodCode = 'EVN'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Birth Plurality" - The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@moodCode = 'EVN'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="cda:id" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Birth Plurality" - The 'id' tag is missing. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:id</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:id) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Birth Plurality" - The 'id' tag shall appear only once. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:id) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="cda:value" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Birth Plurality" - The 'value' tag is missing. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:value</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:value) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Birth Plurality" - The 'value' tag shall appear only once. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:value) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(cda:code) &gt;1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Birth Plurality" - The 'code' tag shall appear only once. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:code) &gt;1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M38" />
  </xsl:template>
  <xsl:template match="cda:code[@code = '103.16249']" priority="3997" mode="M38">
    <xsl:choose>
      <xsl:when test="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation/cda:code[@code = '103.16249']" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Birth Plurality" - The "/ClinicalDocument/component/structuredBody/component/section[code/@code = '102.16080']/entry/observation/code[@code = '103.16249']" path - 1 or more tags are missing. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation/cda:code[@code = '103.16249']</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="@codeSystem = '1.2.36.1.2001.1001.101'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Birth Plurality" - The 'code' tag 'codeSystem' attribute shall be '1.2.36.1.2001.1001.101'. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@codeSystem = '1.2.36.1.2001.1001.101'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="translate(@codeSystemName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'NCTIS DATA COMPONENTS'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Birth Plurality" - The 'code' tag 'codeSystemName' attribute shall contain the value 'NCTIS Data Components'. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">translate(@codeSystemName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'NCTIS DATA COMPONENTS'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'BIRTH PLURALITY'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Birth Plurality" - The 'code' tag 'displayName' attribute shall contain the value 'Birth Plurality'. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'BIRTH PLURALITY'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M38" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation[cda:code/@code = '103.16249']/cda:value" priority="3996" mode="M38">
    <xsl:choose>
      <xsl:when test="number(@value)" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Birth Plurality" - The 'value' tag 'value' attribute shall contain a value that is a positive integer greater than or equal to 1. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">number(@value)</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M38" />
  </xsl:template>
  <xsl:template match="text()" priority="-1" mode="M38" />
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']" priority="4000" mode="M39">
    <xsl:if test="count(cda:entry/cda:observation/cda:code[@code = 102.16234]) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth Accuracy Indicator" - The 'entry' tag shall appear only once. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:entry/cda:observation/cda:code[@code = 102.16234]) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M39" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry[cda:observation/cda:code/@code = '102.16234']" priority="3999" mode="M39">
    <xsl:if test="count(cda:observation) &gt;1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth Accuracy Indicator" - The 'observation' tag shall appear only once. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:observation) &gt;1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M39" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation[cda:code/@code = '102.16234']" priority="3998" mode="M39">
    <xsl:choose>
      <xsl:when test="@classCode = 'OBS'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth Accuracy Indicator" - The 'observation' tag 'classCode' attribute shall contain the value 'OBS'. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@classCode = 'OBS'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="@moodCode = 'EVN'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth Accuracy Indicator" - The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@moodCode = 'EVN'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="cda:id" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth Accuracy Indicator" - The 'id' tag is missing. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:id</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:id) &gt;1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth Accuracy Indicator" - The 'id' tag shall appear only once. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:id) &gt;1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="cda:value" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth Accuracy Indicator" - The 'value' tag is missing. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:value</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:value) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth Accuracy Indicator" - The 'value' tag shall appear only once. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:value) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(cda:code) &gt;1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth Accuracy Indicator" - The 'code' tag shall appear only once. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:code) &gt;1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M39" />
  </xsl:template>
  <xsl:template match="cda:code[@code = '102.16234']" priority="3997" mode="M39">
    <xsl:choose>
      <xsl:when test="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation/cda:code[@code = '102.16234']" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth Accuracy Indicator" - The "/ClinicalDocument/component/structuredBody/component/section[code/@code = '102.16080']/entry/observation/code[@code = '102.16234']" path - 1 or more tags are missing. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation/cda:code[@code = '102.16234']</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="@codeSystem = '1.2.36.1.2001.1001.101'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth Accuracy Indicator" - The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@codeSystem = '1.2.36.1.2001.1001.101'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="translate(@codeSystemName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'NCTIS DATA COMPONENTS'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth Accuracy Indicator" - The 'code' tag 'codeSystemName' attribute shall contain the value 'NCTIS Data Components'. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">translate(@codeSystemName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'NCTIS DATA COMPONENTS'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'DATE OF BIRTH ACCURACY INDICATOR'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth Accuracy Indicator" - The 'code' tag 'displayName' attribute shall contain the value 'Date of Birth Accuracy Indicator'. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'DATE OF BIRTH ACCURACY INDICATOR'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M39" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation[cda:code/@code = '102.16234']/cda:value" priority="3996" mode="M39">
    <xsl:choose>
      <xsl:when test="document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Health_Care_Client_Identifier_Date_Accuracy_Indicator']/code[(@code = current()/@code)]" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth Accuracy Indicator" - The 'value' tag 'code' attribute shall be as per AS 5017-2006 Health Care Client Identifier Date Accuracy Indicator. Refer to section 6.1.2 and 10.11 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Health_Care_Client_Identifier_Date_Accuracy_Indicator']/code[(@code = current()/@code)]</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M39" />
  </xsl:template>
  <xsl:template match="text()" priority="-1" mode="M39" />
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']" priority="4000" mode="M40">
    <xsl:if test="count(cda:entry/cda:observation/cda:code[@code = 103.16233]) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject of Care - "Subject of Care / Participant / Person or Organisation or Device / Person /Demographic Data / Date of Birth Detail / Date of Birth is Calculated From Age" - The 'entry' tag shall appear only once. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:entry/cda:observation/cda:code[@code = 103.16233]) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M40" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry[cda:observation/cda:code/@code = '103.16233']" priority="3999" mode="M40">
    <xsl:if test="count(cda:observation) &gt;1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth is Calculated From Age" - The 'observation' tag shall appear only once. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:observation) &gt;1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M40" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation[cda:code/@code = '103.16233']" priority="3998" mode="M40">
    <xsl:choose>
      <xsl:when test="@classCode = 'OBS'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth is Calculated From Age" - The 'observation' tag 'classCode' attribute shall contain the value 'OBS'. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@classCode = 'OBS'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="@moodCode = 'EVN'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth is Calculated From Age" - The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@moodCode = 'EVN'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="cda:id" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth is Calculated From Age" - The 'id' tag is missing. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:id</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:id) &gt;1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth is Calculated From Age" - The 'id' tag shall appear only once. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:id) &gt;1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="cda:value" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth is Calculated From Age" - The 'value' tag is missing. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:value</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:value) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth is Calculated From Age" - The 'value' tag shall appear only once. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:value) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(cda:code) &gt;1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth is Calculated From Age" - The 'code' tag shall appear only once. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:code) &gt;1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M40" />
  </xsl:template>
  <xsl:template match="cda:code[@code = '103.16233']" priority="3997" mode="M40">
    <xsl:choose>
      <xsl:when test="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation/cda:code[@code = '103.16233']" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth is Calculated From Age" - The "/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation/cda:code[@code = '103.16233']" path - 1 or more tags are missing. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation/cda:code[@code = '103.16233']</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="@codeSystem = '1.2.36.1.2001.1001.101'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth is Calculated From Age" - The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@codeSystem = '1.2.36.1.2001.1001.101'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="translate(@codeSystemName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'NCTIS DATA COMPONENTS'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth is Calculated From Age" - The 'code' tag 'codeSystemName' attribute shall contain the value 'NCTIS Data Components'. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">translate(@codeSystemName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'NCTIS DATA COMPONENTS'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'DATE OF BIRTH IS CALCULATED FROM AGE'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth is Calculated From Age" - The 'code' tag 'displayName' attribute shall contain the value 'Date of Birth is Calculated From Age'. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'DATE OF BIRTH IS CALCULATED FROM AGE'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M40" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation[cda:code/@code = '103.16233']/cda:value" priority="3996" mode="M40">
    <xsl:choose>
      <xsl:when test="@value = 'true' or @value = 'false'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Birth Detail / Date of Birth is Calculated From Age" - The 'value' tag 'value' attribute shall contain the value "true" or "false". Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@value = 'true' or @value = 'false'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M40" />
  </xsl:template>
  <xsl:template match="text()" priority="-1" mode="M40" />
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']" priority="4000" mode="M41">
    <xsl:if test="count(cda:entry/cda:observation/cda:code[@code = 102.16252]) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Death Detail / Date of Death Accuracy Indicator" - The 'entry' tag shall appear only once. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:entry/cda:observation/cda:code[@code = 102.16252]) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M41" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry[cda:observation/cda:code/@code = '102.16252']" priority="3999" mode="M41">
    <xsl:if test="count(cda:observation) &gt;1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Death Detail / Date of Death Accuracy Indicator" - The 'observation' tag shall appear only once. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:observation) &gt;1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M41" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation[cda:code/@code = '102.16252']" priority="3998" mode="M41">
    <xsl:choose>
      <xsl:when test="@classCode = 'OBS'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Death Detail / Date of Death Accuracy Indicator" - The 'observation' tag 'classCode' attribute shall contain the value 'OBS'. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@classCode = 'OBS'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="@moodCode = 'EVN'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Death Detail / Date of Death Accuracy Indicator" - The 'observation' tag 'moodCode' attribute shall contain the value 'EVN'. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@moodCode = 'EVN'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="cda:id" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Death Detail / Date of Death Accuracy Indicator" - The 'id' tag is missing. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:id</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:id) &gt;1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Death Detail / Date of Death Accuracy Indicator" - The 'id' tag shall appear only once. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:id) &gt;1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="cda:value" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Death Detail / Date of Death Accuracy Indicator" - The 'value' tag is missing. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">cda:value</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(cda:value) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Death Detail / Date of Death Accuracy Indicator" - The 'value' tag shall appear only once. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:value) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(cda:code) &gt;1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Death Detail / Date of Death Accuracy Indicator" - The 'code' tag shall appear only once. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(cda:code) &gt;1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M41" />
  </xsl:template>
  <xsl:template match="cda:code[@code = '102.16252']" priority="3997" mode="M41">
    <xsl:choose>
      <xsl:when test="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation/cda:code[@code = '102.16252']" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Death Detail / Date of Death Accuracy Indicator" - The "/ClinicalDocument/component/structuredBody/component/section[code/@code = '102.16080']/entry/observation/code[@code = '102.16252']" path - 1 or more tags are missing. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation/cda:code[@code = '102.16252']</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="@codeSystem = '1.2.36.1.2001.1001.101'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Death Detail / Date of Death Accuracy Indicator" - The 'code' tag 'codeSystem' attribute shall contain the value '1.2.36.1.2001.1001.101'. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@codeSystem = '1.2.36.1.2001.1001.101'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="translate(@codeSystemName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'NCTIS DATA COMPONENTS'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Death Detail / Date of Death Accuracy Indicator" - The 'code' tag 'codeSystemName' attribute shall contain the value 'NCTIS Data Components'. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">translate(@codeSystemName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'NCTIS DATA COMPONENTS'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'DATE OF DEATH ACCURACY INDICATOR'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Death Detail / Date of Death Accuracy Indicator" - The 'code' tag 'displayName' attribute shall contain the value 'Date of Death Accuracy Indicator'. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">translate(@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = 'DATE OF DEATH ACCURACY INDICATOR'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M41" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/cda:entry/cda:observation[cda:code/@code = '102.16252']/cda:value" priority="3996" mode="M41">
    <xsl:choose>
      <xsl:when test="document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Health_Care_Client_Identifier_Date_Accuracy_Indicator']/code[(@code = current()/@code)]" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Subject of Care / Participant / Person or Organisation or Device / Person / Demographic Data / Date of Death Detail / Date of Death Accuracy Indicator" - The 'value' tag 'code' attribute shall be as per AS 5017-2006 Health Care Client Identifier Date Accuracy Indicator. Refer to section 6.1.2 and 10.11 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'Health_Care_Client_Identifier_Date_Accuracy_Indicator']/code[(@code = current()/@code)]</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M41" />
  </xsl:template>
  <xsl:template match="text()" priority="-1" mode="M41" />
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/ext:coverage2" priority="4000" mode="M42">
    <xsl:choose>
      <xsl:when test="@typeCode = 'COVBY'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Participant / Entitlement" - The 'coverage2' tag 'typeCode' attribute shall contain the value 'COVBY'. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@typeCode = 'COVBY'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="ext:entitlement" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Participant / Entitlement" - The 'entitlement' tag is missing. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">ext:entitlement</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(ext:entitlement) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Participant / Entitlement" - The 'entitlement' tag shall appear only once. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(ext:entitlement) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M42" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/ext:coverage2/ext:entitlement" priority="3999" mode="M42">
    <xsl:choose>
      <xsl:when test="@classCode = 'COV'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Participant / Entitlement" - The 'entitlement' tag 'classCode' attribute shall contain the value 'COV'. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@classCode = 'COV'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="@moodCode = 'EVN'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Participant / Entitlement" - The 'entitlement' tag 'moodCode' attribute shall contain the value 'EVN'. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@moodCode = 'EVN'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="ext:id" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Participant / Entitlement / Entitlement Number" - The 'id' tag is missing. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">ext:id</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(ext:id) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Participant / Entitlement / Entitlement Number" - The 'id' tag shall appear only once. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(ext:id) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="ext:code" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Participant / Entitlement / Entitlement Type" - The 'code' tag is missing. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">ext:code</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(ext:code) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Participant / Entitlement / Entitlement Type" - The 'code' tag shall appear only once. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(ext:code) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="count(ext:effectiveTime) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Participant / Entitlement / Entitlement Validity Duration" - The 'effectiveTime' tag shall appear only once. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(ext:effectiveTime) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="ext:participant" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Participant / Entitlement" - The 'participant' tag is missing. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">ext:participant</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(ext:participant) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Participant / Entitlement / Entitlement Validity Duration" - The 'participant' tag shall appear only once. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(ext:participant) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M42" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/ext:coverage2/ext:entitlement/ext:participant" priority="3998" mode="M42">
    <xsl:choose>
      <xsl:when test="@typeCode = 'BEN'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Participant / Entitlement" - The 'participant' tag 'typeCode' attribute shall contain the value 'BEN'. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@typeCode = 'BEN'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="ext:participantRole" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Participant / Entitlement" - The 'participantRole' tag is missing. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">ext:participantRole</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(ext:participantRole) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Participant / Entitlement" - The 'participantRole' tag shall appear only once. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(ext:participantRole) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M42" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/ext:coverage2/ext:entitlement/ext:participant/ext:participantRole" priority="3997" mode="M42">
    <xsl:choose>
      <xsl:when test="@classCode = 'PAT'" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Participant / Entitlement" - The 'participantRole' tag 'classCode' attribute shall contain the value 'PAT'. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">@classCode = 'PAT'</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="ext:id" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Participant / Entitlement" - The 'id' tag is missing. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">ext:id</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="count(ext:id) &gt; 1">
      <xsl:element name="issue">
        <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Participant / Entitlement" - The 'id' tag shall appear only once. Refer to section 6.1.2 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
        <xsl:element name="context">
          <xsl:apply-templates select="." mode="schematron-get-full-path" />
        </xsl:element>
        <xsl:element name="test">count(ext:id) &gt; 1</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates mode="M42" />
  </xsl:template>
  <xsl:template match="/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:code/@code = '102.16080']/ext:coverage2/ext:entitlement/ext:code" priority="3996" mode="M42">
    <xsl:choose>
      <xsl:when test="document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'NCTIS_Entitlement_Type_Values']/code[(@code = current()/@code) and (@codeSystem = current()/@codeSystem) and (@codeSystemName = current()/@codeSystemName) and (translate(@displayName,  'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = translate(current()/@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'))]" />
      <xsl:otherwise>
        <xsl:element name="issue">
          <xsl:element name="message">Error: Advanced Care Directive Custodian Record - 6.1.2 Subject Of Care - "Participant / Entitlement / Entitlement Type" - The 'code' tag 'code', 'codeSystem', 'codeSystemName' and 'displayName' attribute shall be as per NCTIS: Admin Codes - Entitlement Type. Refer to section 6.1.2 and 10.14 of the Advanced_Care_Directive_Custodian_Record_CDA_Implementation_Guide_v1.0.</xsl:element>
          <xsl:element name="context">
            <xsl:apply-templates select="." mode="schematron-get-full-path" />
          </xsl:element>
          <xsl:element name="test">document('CDAValidate_Vocabs.xml')/systems/system[@codeSystemName = 'NCTIS_Entitlement_Type_Values']/code[(@code = current()/@code) and (@codeSystem = current()/@codeSystem) and (@codeSystemName = current()/@codeSystemName) and (translate(@displayName,  'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') = translate(current()/@displayName, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'))]</xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates mode="M42" />
  </xsl:template>
  <xsl:template match="text()" priority="-1" mode="M42" />
  <xsl:template match="text()" priority="-1" />
</xsl:stylesheet>
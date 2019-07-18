<?xml version = "1.0" encoding = "UTF-8"?>
<!--

                  Created          : 31-10-2014 01:41:51
______________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix="cda" uri="urn:hl7-org:v3"/>
    <ns prefix="ext" uri="http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Shared_Health_Summary_Participation_Period-errors"
        id="p-Shared_Health_Summary_Participation_Period-errors"
        see="#p-Shared_Health_Summary_Participation_Period-errors">


        <!-- Refer to RPSA-1973 for author / time -->

        <rule context="cda:author/cda:time ">

            <assert
                test="(@value) or ((cda:high/@value) and (cda:low/@value) and (@xsi:type='IVL_TS'))"
                >Error:  Shared Health Summary - "Participation Period" - The 'time' tag shall have
                a 'value' attribute OR 'xsi:type' attribute having the value 'IVL_TS' along with
                both the 'high' and 'low' tags with corresponding 'value' attributes. Refer to the
                section 6.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>

            <!-- the @nullFlavor NON Existence test is added to the SMT tool -->

            <!--<assert
                test="(@nullFlavor) or (@value) or ((cda:high/@value) and (cda:low/@value) and (@xsi:type='IVL_TS'))"
                >Error:  Shared Health Summary - "Participation Period" - The 'time' tag shall have
                a 'nullFlavor' attribute OR a 'value' attribute OR 'xsi:type' attribute having the
                value 'IVL_TS' along with both the 'high' and 'low' tags with corresponding 'value'
                attributes. Refer to the section 6.1.1 of the Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</assert>-->

            <!--<report test="(@nullFlavor) and (@value)">Error:  Shared Health Summary - "Participation
                Period" - The 'time' tag shall not have both a 'nullFlavor' attribute and a 'value'
                attribute. Refer to the section 6.1.1 of the Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>-->

            <report test="(@value) and ((cda:high) or (cda:low))">Error:  Shared Health Summary -
                "Participation Period" - The 'time' tag shall not have both a 'value' attribute and
                the 'high' and/or 'low' tag(s). Refer to the section 6.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

            <!--<report test="((cda:high) or (cda:low)) and (@nullFlavor)">Error:  Shared Health Summary
                - "Participation Period" - The 'time' tag shall not have both a 'nullFlavor'
                attribute and the 'high' and/or 'low' tag(s). Refer to the section 6.1.1 of the
                Specialist_Letter_CDA_Implementation_Guide_v1.4.</report>-->

            <report test="(cda:high/@nullFlavor) or (cda:low/@nullFlavor)">Error:  Shared Health Summary
                - "Participation Period" - The 'time' tag shall not have the 'high' and/or
                'low' tag(s) with corresponding 'nullFlavor' attribute(s). Refer to the section
                6.1.1 of the
                Shared_Health_Summary_CDA_Implementation_Guide_v1.4.</report>

        </rule>

    </pattern>

</schema>

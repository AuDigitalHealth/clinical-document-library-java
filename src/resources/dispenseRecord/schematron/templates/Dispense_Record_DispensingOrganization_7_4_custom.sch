<?xml version = "1.0" encoding = "UTF-8"?>
<!--
_________________________________________________________________________________________________________________________________________________________________________________________
                  Generated File - Do Not Edit File Directly                                                                                                                             
                  __________________________________________

                  Generated          : 8/07/2013 3:59:56 PM

                  Product            : Dispense Record
                  Release            : CDA_Implementation_Guide_v1.0
                  IG Guide Reference : 7.4
                  IG Guide Title     : Dispensing Organization
                  Generator Version  : 2.27
                                                                                                                                                                                         
_________________________________________________________________________________________________________________________________________________________________________________________
-->

<schema xmlns="http://www.ascc.net/xml/schematron">
    <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
    <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
    <ns prefix = "xs" uri = "http://www.w3.org/2001/XMLSchema"/>
    <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern name="p-Dispense_Record_DispensingOrganization_7_4_custom-errors"
        id="p-Dispense_Record_DispensingOrganization_7_4_custom-errors"
        see="#p-Dispense_Record_DispensingOrganization_7_4_custom-errors">




        <rule context="/cda:ClinicalDocument/cda:componentOf/cda:encompassingEncounter/cda:location/cda:healthCareFacility/cda:serviceProviderOrganization/cda:asOrganizationPartOf/cda:wholeOrganization/cda:addr">

            <assert test="not(country) or normalize-space(country) = '' or country = 'Australia'"
                >Error: Dispense Record - 7.4 Dispensing Organization -
                "Dispensing Organisation / Participant / Address/ Australia or International Address / International Address /
                Country" - The 'country' tag shall contain the value 'Australia'
                Refer to section 7.4 of the
                Dispense_Record_CDA_Implementation_Guide_v0.4.</assert>
  

        </rule>


    </pattern>

</schema>

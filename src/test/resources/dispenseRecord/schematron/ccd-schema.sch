<?xml version = "1.0" encoding = "UTF-8" standalone = "yes"?>
<!DOCTYPE schema [

]>

<schema xmlns     = "http://www.ascc.net/xml/schematron"
        xmlns:cda = "urn:hl7-org:v3"
        xmlns:ext = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"
        xmlns:xs  = "http://www.w3.org/2001/XMLSchema"
        xmlns:xsi = "http://www.w3.org/2001/XMLSchema-instance">
    <!-- 
        To use iso schematron instead of schematron 1.5, 
        change the xmlns attribute from
        "http://www.ascc.net/xml/schematron" 
        to 1.2.36.1.2001.1001.101.100.16100
        "http://purl.oclc.org/dsdl/schematron"
 -->
    <title>Schematron schema for validating Schema conformance to Dispense Record CDA documents</title>
 <ns prefix = "cda" uri = "urn:hl7-org:v3"/>
 <ns prefix = "ext" uri = "http://ns.electronichealth.net.au/Ci/Cda/Extensions/3.0"/>
 <ns prefix = "xs"  uri = "http://www.w3.org/2001/XMLSchema"/>
 <ns prefix = "xsi" uri = "http://www.w3.org/2001/XMLSchema-instance"/>
 <phase id = "errors">
 </phase>

 <phase id = "warning">
 </phase> 
 
</schema>

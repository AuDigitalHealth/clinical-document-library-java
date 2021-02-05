#Mavenization of Clinical Document Library

## Technology stack:
- JDK 1.8
- Apache Maven v3.6.3

## Underlying internal dependencies:

This library is available through Maven and referenced that way.
### cda-schema-2.1.1.jar
- Git location: 
  - https://github.com/AuDigitalHealth/cda-schema-java/src
- Current project released version
  - 2.1.1

## Removed internal dependencies
These NEHTA jars were previously required for the library, but the dependencies on them have been removed from the project.

### nehta-schematron-check-1.0.jar
- Git location:
  - https://github.com/AuDigitalHealth/integration-toolkit-sample-code-java/tree/master/schematronclient/src (old version)
  - https://github.com/AuDigitalHealth/schematron-check-java/src (new version 1.1)
- Current released version
  - 1.1
  
### nehta-smi-common-utils-1.2.jar
- Git location:
  - https://github.com/AuDigitalHealth/integration-toolkit-sample-code-java/tree/master/smd-b2b-client/
  - Current project released version
    - 1.2
- Internal dependencies:
    - nehta-rpvis-compiled-wsdl-simd-tls-1.0.2.jar
    - nehta-rpvis-compiled-wsdl-smd-common-1.0.2.jar
    - nehta-rpvis-compiled-wsdl-smd-tls-1.0.2.jar
    - nehta-rpvis-compiled-wsdl-smr-tls-1.0.2.jar
    - nehta-rpvis-compiled-wsdl-trr-tls-1.0.2.jar
    - nehta-smi-common-utils-1.2.jar
    - nehta-smi-xsp-1.2.0.jar
    - nehta-vendorlibrary-java-common-1.1.0.jar

### nehta-vendorlibrary-java-common-1.1.0.jar
- Git location:
  - https://github.com/AuDigitalHealth/integration-toolkit-sample-code-java/tree/master/common-library/src
- Current project released version
  - 1.1.0
- Internal dependencies:
  - nehta-smi-common-utils-1.2.jar
  - nehta-smi-xsp-1.2.0.jar

### nehta-rpvis-compiled-xsd-cda-common-2.1.jar
- Git location:
  - https://github.com/AuDigitalHealth/integration-toolkit-sample-code-java/tree/master/clinical-document-library/cdaschema/src
- Current project released version
  - 2.1

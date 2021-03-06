# Change Log/Revision History

  = 2.0.2 =
  =========
  + Added throws IOException to the Test files and helper files
  + New PdfMedia.java for when the attachment type is known to be PDF.
  
  = 2.0.1 =
  =========
  + references to AMTCode (v2) removed where AMTv3Code alternative is available and required for conformity
  + removed dependency on Joda Time and replaced with java.time equivalents
  + removed dependency on Schematron allowing library to be used without it
  + removed dependency on nehta-smi-common-utils-1.2.jar and incorporated three classes into project instead
  + removed dependency on nehta-vendorlibrary-java-common-1.0.1.jar
  + removed dependency on nehta-rpvis-compiled-xsd-cda-common-2.1.jar (stored locally
  + added dependency on cda-schema-2.1.1.jar available through Maven repository
  + changed street number in common/address/AustralianAddress to allow for nulls and updated code to handle nulls
  + code cleanup

  = 1.2.2 = 
  =======
  + fixed optional date in Service Referral [SERVICE PROVIDER > Participation Period]
  + fixed optional sections in event summary
  + relaxed the HPII type for path/di allowing for other identifiers

  = 1.2.1 = 
  =======
  + fixed location of generated shs min file
  + removed validation check for telephone
  + for PSML, made the urgency flag optional + updated sample
  + for ES, updated error mess for attachment in helper
  + removed 6 files no longer required

  = 1.2 = 
  =======
   + Java library now supports following CDA documents' formats: 
   
   Sr# | CDA Document | Format 1A | Format 1B | Format 2 | Format 3A
   ---| ------------ | --------- | --------- | -------- | ---------
   1. | Advanced Care Directive | &#10007; | &#10007; | &#10007; | &#10004;
   2. | Advanced Care Planning | &#10007; | &#10007; | &#10007; | &#10004;
   3. | Diagnostic Imaging Report | &#10007; | &#10007; | &#10007; | &#10004;
   4. | Discharge Summary | &#10004; | &#10004; | &#10004; | &#10004;
   5. | EReferral | &#10004; | &#10007; | &#10007; | &#10004;
   6. | Event Summary | &#10007; | &#10007; | &#10007; | &#10004;
   7. | Goals of Care | &#10007; | &#10007; | &#10007; | &#10004;
   8. | Pathology Report | &#10007; | &#10007; | &#10007; | &#10004;
   9. | Pharmacist Shared Medicines List | &#10004; | &#10007; | &#10007; | &#10007;
   10. | Service Referral | &#10004; | &#10004; | &#10007; | &#10004;
   11. | Shared Health Summary | &#10007; | &#10007; | &#10007; | &#10004;
   12. | Specialist Letter | &#10004; | &#10004; | &#10004; | &#10004;

  = 1.0.2 = 
  =======
  + Updated nehta-schematron-check Jar to use File.pathSeparators

  = 1.0.1 = 
  =======
  + Updated constructor for shs/es allowing for non snomed codes to be used in coded field.

  = 1.0 = Event Summary Document
  =======

  + Implemented EventSummary
  + Existing tests refactored
  + Fixed up and improved previous tests
  
  = 0.3 = 
  =======
  
  + added the 'Date time of Dispense Event' to the narrative
  + added the entitlement duration to 'Subject of Care Entitlements'
  - removed the dispense quantity field from the body and narrative
  + added the dispense item identifier to the 'supply/id' field
  
  = 0.2 = 
  =======
  + sample code included for NPDR, Pathology, Diagnostic Images and Shared Health Summary.
  
  
  
  = 0.1 = initial release  
  =======
  + included sample code for e-Referral 1A only 



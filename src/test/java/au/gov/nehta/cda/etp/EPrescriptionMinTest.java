package au.gov.nehta.cda.etp;

import static au.gov.nehta.model.schematron.SchematronResource.SchematronResources.E_PRESCRIPTION_3B;

import au.gov.nehta.builder.etp.eprescription.EPrescriptionCreator;
import au.gov.nehta.builder.util.UUIDTool;
import au.gov.nehta.cda.test.Base;
import au.gov.nehta.cda.test.TestHelper;
import au.gov.nehta.model.cda.common.code.AMTCode;
import au.gov.nehta.model.cda.common.code.Code;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.code.PBSPrescriptionTypeCode;
import au.gov.nehta.model.cda.common.code.PBSPrescriptionTypeCode.PBSPrescriptionType;
import au.gov.nehta.model.cda.common.custodian.AssignedCustodian;
import au.gov.nehta.model.cda.common.custodian.AssignedCustodianImpl;
import au.gov.nehta.model.cda.common.custodian.Custodian;
import au.gov.nehta.model.cda.common.custodian.CustodianImpl;
import au.gov.nehta.model.cda.common.custodian.CustodianOrganization;
import au.gov.nehta.model.cda.common.custodian.CustodianOrganizationImpl;
import au.gov.nehta.model.cda.common.document.BaseClinicalDocument;
import au.gov.nehta.model.cda.common.document.ClinicalDocumentFactory;
import au.gov.nehta.model.cda.common.id.AsEntityIdentifier;
import au.gov.nehta.model.cda.common.id.AsEntityIdentifierImpl;
import au.gov.nehta.model.cda.common.id.AssignedEntity;
import au.gov.nehta.model.cda.common.id.AssignedEntityImpl;
import au.gov.nehta.model.cda.common.id.LegalAuthenticator;
import au.gov.nehta.model.cda.common.id.LegalAuthenticatorImpl;
import au.gov.nehta.model.cda.common.id.MedicareCardIdentifier;
import au.gov.nehta.model.cda.common.id.TemplateIdImpl;
import au.gov.nehta.model.cda.common.org.Organization;
import au.gov.nehta.model.cda.common.org.OrganizationImpl;
import au.gov.nehta.model.cda.common.org.OrganizationName;
import au.gov.nehta.model.cda.common.org.OrganizationNameImpl;
import au.gov.nehta.model.cda.common.person.Person;
import au.gov.nehta.model.cda.common.person.PersonImpl;
import au.gov.nehta.model.cda.common.telecom.Telecom;
import au.gov.nehta.model.cda.common.telecom.TelecomImpl;
import au.gov.nehta.model.cda.common.time.Precision;
import au.gov.nehta.model.cda.common.time.PrecisionDate;
import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;
import au.gov.nehta.model.cda.common.time.TimeQuantity;
import au.gov.nehta.model.cda.common.time.TimeUnitOfMeasure;
import au.gov.nehta.model.cda.etp.EPrescriptionCdaModel;
import au.gov.nehta.model.clinical.common.SubjectOfCareDemographicData;
import au.gov.nehta.model.clinical.common.SubjectOfCareDemographicDataImpl;
import au.gov.nehta.model.clinical.common.SubjectOfCareParticipant;
import au.gov.nehta.model.clinical.common.SubjectOfCareParticipantImpl;
import au.gov.nehta.model.clinical.common.SubjectOfCarePerson;
import au.gov.nehta.model.clinical.common.SubjectOfCarePersonImpl;
import au.gov.nehta.model.clinical.common.participation.ANZSCO_1ED_2006;
import au.gov.nehta.model.clinical.common.participation.AddressContextImpl;
import au.gov.nehta.model.clinical.common.participation.AddressPurpose;
import au.gov.nehta.model.clinical.common.participation.AustralianAddress;
import au.gov.nehta.model.clinical.common.participation.AustralianAddressImpl;
import au.gov.nehta.model.clinical.common.participation.AustralianStateTerritory;
import au.gov.nehta.model.clinical.common.participation.DateAccuracy;
import au.gov.nehta.model.clinical.common.participation.DateAccuracyImpl;
import au.gov.nehta.model.clinical.common.participation.DateOfBirthDetail;
import au.gov.nehta.model.clinical.common.participation.DateOfBirthDetailImpl;
import au.gov.nehta.model.clinical.common.participation.IndigenousStatus;
import au.gov.nehta.model.clinical.common.participation.NameSuffix;
import au.gov.nehta.model.clinical.common.participation.NameTitle;
import au.gov.nehta.model.clinical.common.participation.Occupation;
import au.gov.nehta.model.clinical.common.participation.OccupationImpl;
import au.gov.nehta.model.clinical.common.participation.Organisation;
import au.gov.nehta.model.clinical.common.participation.OrganisationImpl;
import au.gov.nehta.model.clinical.common.participation.PersonName;
import au.gov.nehta.model.clinical.common.participation.PersonNameImpl;
import au.gov.nehta.model.clinical.common.participation.PersonNameUsage;
import au.gov.nehta.model.clinical.common.participation.Role;
import au.gov.nehta.model.clinical.common.participation.RoleImpl;
import au.gov.nehta.model.clinical.common.participation.Sex;
import au.gov.nehta.model.clinical.common.types.HPII;
import au.gov.nehta.model.clinical.common.types.HPIO;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifierImpl;
import au.gov.nehta.model.clinical.etp.common.item.ItemFactory;
import au.gov.nehta.model.clinical.etp.common.item.MedicalBenefitCategoryType;
import au.gov.nehta.model.clinical.etp.common.item.PrescriptionItemIdentifier;
import au.gov.nehta.model.clinical.etp.common.participation.AddressContext;
import au.gov.nehta.model.clinical.etp.common.participation.DefaultParticipant;
import au.gov.nehta.model.clinical.etp.common.participation.DefaultParticipantImpl;
import au.gov.nehta.model.clinical.etp.common.participation.Entitlement;
import au.gov.nehta.model.clinical.etp.common.participation.EntitlementImpl;
import au.gov.nehta.model.clinical.etp.common.participation.EntitlementType;
import au.gov.nehta.model.clinical.etp.common.participation.PrescriberOrganisationParticipant;
import au.gov.nehta.model.clinical.etp.common.participation.PrescriberOrganisationParticipantImpl;
import au.gov.nehta.model.clinical.etp.common.participation.PrescriberOrganisationParticipation;
import au.gov.nehta.model.clinical.etp.common.participation.PrescriberOrganisationParticipationImpl;
import au.gov.nehta.model.clinical.etp.common.participation.PrescriberParticipation;
import au.gov.nehta.model.clinical.etp.common.participation.PrescriberParticipationImpl;
import au.gov.nehta.model.clinical.etp.common.participation.ProviderAddress;
import au.gov.nehta.model.clinical.etp.common.participation.ProviderAddressImpl;
import au.gov.nehta.model.clinical.etp.common.participation.ProviderEmploymentDetail;
import au.gov.nehta.model.clinical.etp.common.participation.ProviderEmploymentDetailImpl;
import au.gov.nehta.model.clinical.etp.common.participation.ProviderPerson;
import au.gov.nehta.model.clinical.etp.common.participation.ProviderPersonImpl;
import au.gov.nehta.model.clinical.etp.eprescription.EPrescription;
import au.gov.nehta.model.clinical.etp.eprescription.EPrescriptionContent;
import au.gov.nehta.model.clinical.etp.eprescription.EPrescriptionContentImpl;
import au.gov.nehta.model.clinical.etp.eprescription.EPrescriptionContext;
import au.gov.nehta.model.clinical.etp.eprescription.EPrescriptionContextImpl;
import au.gov.nehta.model.clinical.etp.eprescription.EPrescriptionImpl;
import au.gov.nehta.model.clinical.etp.eprescription.GroundsForConcurrentSupply;
import au.gov.nehta.model.clinical.etp.eprescription.PrescriptionItem;
import au.gov.nehta.model.clinical.etp.eprescription.PrescriptionItemBuilder;
import au.gov.nehta.model.schematron.SchematronValidationException;
import au.gov.nehta.schematron.Schematron;
import au.gov.nehta.schematron.SchematronCheckResult;
import au.gov.nehta.test.exceptions.SchemaValidationException;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;
import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;
import org.junit.Assert;
import org.joda.time.DateTime;
import org.joda.time.LocalDate;
import org.joda.time.format.DateTimeFormat;
import org.junit.Ignore;
import org.junit.Test;
import org.w3c.dom.Document;

public class EPrescriptionMinTest extends Base {


    private static final String SCHEMATRON = E_PRESCRIPTION_3B.resource().getSchematron();
    private static String SCHEMATRON_TEMPLATE_PATH = "src/test/resources/ePrescription";
    private static final String DOCUMENT_FILE_NAME = "src/test/resources/eprescription/eprescription-min.xml";

    @Test
    @Ignore
    public void test_MIN_PrescriptionRequestCreation()
        throws ParserConfigurationException, JAXBException, SchemaValidationException, SchematronValidationException, IOException, ParseException {
        if (!new File(SCHEMATRON_TEMPLATE_PATH + "/schematron/schematron-Validator-report.xsl")
            .exists()) {
            SCHEMATRON_TEMPLATE_PATH = "src/" + SCHEMATRON_TEMPLATE_PATH;
        }
        generateMin();
        SchematronCheckResult check = Schematron
            .check(SCHEMATRON_TEMPLATE_PATH, SCHEMATRON, DOCUMENT_FILE_NAME);

        show(check);
        
        Assert.assertTrue( check.schemaErrors.size() == 0 );
        Assert.assertTrue( check.schematronErrors.size() == 0 );
    }
    
   
    public void generateMin() throws IOException, ParserConfigurationException, JAXBException, SchematronValidationException {
        // Setup context
        
        
        //***************************
        //***** Subject Of Care *****
        //***************************
        
       // IHI subjectIHI = new IHI( "8003600300001283" );
//        MedicareCardIdentifier mcCard = new MedicareCardIdentifier( "132456789" );

        String subjectFamilyName= "Harding";
        
        DateTime dob = new LocalDate(1982,11,28).toDateTimeAtStartOfDay();
        
        

        AustralianAddress subjectFullAddress = new AustralianAddressImpl();
        subjectFullAddress.addUnstructuredAddressLine( "Unit 1234 / 10 MadeUp Lane" );
        subjectFullAddress.setCity( "West End"  );
        subjectFullAddress.setState( AustralianStateTerritory.QUEENSLAND.getAbbreviation() );
        subjectFullAddress.setPostcode(  "4101" );
        
        AddressContext subjectOfCareAddress = new AddressContextImpl( subjectFullAddress, AddressPurpose.RESIDENTIAL_PERMANENT );
        PersonName subjectPersonName = new PersonNameImpl(subjectFamilyName  );
        subjectPersonName.addNameTitle( NameTitle.MISTER.getDescriptor() );
        subjectPersonName.addNameSuffix( NameSuffix.JUNIOR.getDescriptor() );
        subjectPersonName.addGivenName( "Frank" );
        subjectPersonName.addPersonNameUsage( PersonNameUsage.MAIDEN_NAME_OR_NAME_AT_BIRTH );
        
        DateAccuracy dobAccuracy = new DateAccuracyImpl( true, true, true );
        DateOfBirthDetail subjectDOB = new DateOfBirthDetailImpl( dob,dobAccuracy );
        subjectDOB.setDateOfBirthAccuracyIndicator( dobAccuracy );
        SubjectOfCareDemographicData subjectDemographicData = new SubjectOfCareDemographicDataImpl( Sex.MALE, subjectDOB );
        
        subjectDemographicData.setIndigenousStatus( IndigenousStatus.NOT_STATED_OR_INADEQUATELY_DESCRIBED );

        SubjectOfCarePerson subjectOfCarePerson = new SubjectOfCarePersonImpl( subjectPersonName, subjectDemographicData );
        SubjectOfCareParticipant subjectParticipant =  new SubjectOfCareParticipantImpl(
                new ArrayList<AsEntityIdentifier>(), //patient identifiers are optional here, so we send an empty list
                subjectOfCareAddress, subjectOfCarePerson );

        AsEntityIdentifier subjectEntitlementNumber = new MedicareCardIdentifier("1234567819");

        Entitlement subjectEntitlement =new EntitlementImpl( subjectEntitlementNumber, EntitlementType.MEDICARE_BENEFITS );

        DateTime now = new DateTime();
        subjectEntitlement.setEntitlementValidityDuration(
                RestrictedTimeInterval.getLowWidthInstance(
                        //from today(day only precision) for two weeks
                        new PrecisionDate(Precision.DAY, now),
                        new TimeQuantity(2, TimeUnitOfMeasure.WEEK) )
        );

        List<Entitlement> subjectOfCareEntitlementList = new ArrayList<Entitlement>();
        subjectOfCareEntitlementList.add( subjectEntitlement );
        subjectParticipant.setEntitlements( subjectOfCareEntitlementList );

        //************************
        //*****   Prescriber *****
        //************************
        HPII prescriberHPII = new HPII( "8003610000001145" );
        String prescriberFamilyName = "Duncan";


        PersonName prescriberPersonName = new PersonNameImpl( prescriberFamilyName );


        Occupation prescriberOccupation = new OccupationImpl( ANZSCO_1ED_2006.GENERAL_MEDICAL_PRACTITIONER );
        ProviderEmploymentDetail prescriberEmploymentDetail = new ProviderEmploymentDetailImpl( prescriberOccupation );
        ProviderPerson prescriberPerson = new ProviderPersonImpl( prescriberPersonName );
        prescriberPerson.setEmploymentDetail( prescriberEmploymentDetail );

        DefaultParticipant prescriberParticipant = new DefaultParticipantImpl( prescriberHPII, prescriberPerson );
        prescriberParticipant.setQualifications( "MD" );

        AsEntityIdentifier prescriberNumber = new AsEntityIdentifierImpl("1.22.333.4444.55555", "12345678");

        Entitlement prescriberEntitlement =new EntitlementImpl( prescriberNumber, EntitlementType.MEDICARE_PRESCRIBER_NUMBER );
        prescriberEntitlement.setEntitlementValidityDuration( 
                RestrictedTimeInterval.getLowInstance(
                        //from today(day only precision) 
                        new PrecisionDate(Precision.DAY, now))
            );
                
        prescriberParticipant.addEntitlement( prescriberEntitlement );

        Role prescriberRole = new RoleImpl( ANZSCO_1ED_2006.GENERAL_MEDICAL_PRACTITIONER );

        PrescriberParticipation prescriberParticipation = new PrescriberParticipationImpl( prescriberRole, prescriberParticipant );


        //***********************************
        //***** Prescriber Organisation *****
        //***********************************
        
        HPIO prescriberHPIO = new HPIO( "8003621231167886" );
        String organisationName = "GP Australia";

        AustralianAddress fullAddress = new AustralianAddressImpl();
        fullAddress.addUnstructuredAddressLine( "Level 1, 10 Browning streed" );
        fullAddress.setCity(  "West End"  );
        fullAddress.setState( AustralianStateTerritory.QUEENSLAND.getAbbreviation() );
        fullAddress.setPostcode( "4101" );
        ProviderAddress prescriberOrganisationAddress = new ProviderAddressImpl( false, fullAddress, AddressPurpose.BUSINESS );

        Organisation prescriberOrganisation = new OrganisationImpl( organisationName );
        PrescriberOrganisationParticipant prescriberOrganisationParticipant =
                new PrescriberOrganisationParticipantImpl( prescriberHPIO,  prescriberOrganisationAddress,   Arrays.asList( (Telecom)new TelecomImpl( "0712345678" )),  prescriberOrganisation );
        
        Role prescriberOrganisationRole = new RoleImpl( ANZSCO_1ED_2006.ZOOLOGIST );
        
        PrescriberOrganisationParticipation prescriberOrganisationParticipation =
                new PrescriberOrganisationParticipationImpl(
                        prescriberOrganisationRole,
                        prescriberOrganisationParticipant );
        
    
        EPrescriptionContext ePrescriptionContext = new EPrescriptionContextImpl( subjectParticipant, prescriberParticipation, prescriberOrganisationParticipation);

        // Setup content
       

        // creation time must match close the gap for ctg check digit
        // target time = 200910201235+1000
        DateTime creationTime =
        DateTimeFormat.forPattern("yyyyMMddHHmm").parseDateTime("200910201235");
        

        DateTime expiryTime = now;

        String prescriptionIdentifierCode = "AA=SV3Cg3FNwYyD#xE";
        // boolean isAllowBrandSubstitution = true;
        Integer repeats = 3;
        
        
        /*
         ===============
          Important Note: 
         ===============
         
         From the CDA Prescription document 4888_3 Section 8.3.4 CDA mapping
         
          If any of STRUCTURED DOSE, TIMING and ADMINISTRATION  DETAILS are included,
            Directions SHALL be fully and automatically derived from that information. 
            Directions SHALL NOT contradict that information.
         
         This is left as an exercise for the software vendor.
         
         */
     
        
        //max dose = 4 tablets/24hours
        String instructionsForUse = "Take one and call me in the morning";
        
        
        TimeQuantity intervalBetweenRepeats = new TimeQuantity( 3, TimeUnitOfMeasure.WEEK );
        intervalBetweenRepeats.setNarrative( "3 weeks" ); //a text descripton of this time quantity
        
        
        
        

        PrescriptionItemIdentifier prescriptionItemIdentifier = ItemFactory.createPrescriptionItemIdentifier( prescriptionIdentifierCode );
        
        //therapeuticGoodIdentification 
        Code amt = new AMTCode("23641011000036102","paracetamol 500 mg + codeine phosphate 30 mg tablet");
        amt.setOriginalText( "SOME PBS/RPBSItemCode" );
 
        


        PrescriptionItemBuilder builder = new PrescriptionItemBuilder();
        
        builder //can chain items on the builder
        .dateTimeWritten( creationTime ) 
        .dateTimeExpires(expiryTime  )
        .pbsRPBSItemCode( amt )
        .prescriptionItemIdentifier( prescriptionItemIdentifier )
        .maximumNumberOfRepeats( repeats )
        .medicalBenefitCategoryType( MedicalBenefitCategoryType.PBS )
        .groundsForConcurrentSupply( GroundsForConcurrentSupply.PURSUANT_TO_REGULATION_24 )
        .pbsType(  new PBSPrescriptionTypeCode(PBSPrescriptionType.EMERGENCY_TREATMENT_SUPPLY) )
        .directions( instructionsForUse )
        .closeTheGap( uuidRoot( "CTG06X" ) ) //check digit 'X' must match creation time
        .maximumNumberOfRepeats( repeats )
        .brandSubstituteAllowed( Boolean.TRUE )
        ;
        
        
    
        
        
        PrescriptionItem prescriptionItem = builder.build();
        
        
        EPrescriptionContent ePrescriptionContent = new EPrescriptionContentImpl( prescriptionItem );
        
        
        // Create Clinical Model Prescription
        EPrescription ePrescription = new EPrescriptionImpl( ePrescriptionContext, ePrescriptionContent );

        String prescriptionDocumentID = UUID.randomUUID().toString();

    

        List<PersonName> legalAuthenticatorsNames = new ArrayList<PersonName>( 1 );

        legalAuthenticatorsNames.add( new PersonNameImpl( "Black" ) );

        
        //*******************************
        //***** Legal Authenticator *****
        //*******************************
        
        
        HPII authenticatorHPII = new HPII( "8003610000001145" );
        authenticatorHPII.setCode( null ); //you wouldn't really do this, just for testing minimum fields.
        Person legalAuthenticatorPerson = PersonImpl.getInstance( authenticatorHPII, legalAuthenticatorsNames );

        
        HPIO authenticatorHPIO =  new HPIO( "8003621231167886" );

        Organization legalAuthenticatorOrganisation =
                OrganizationImpl.getInstance( authenticatorHPIO );

        AssignedEntity cdaLegalAuthenticatorAssignedEntity =
                AssignedEntityImpl.getInstance( prescriptionDocumentID, legalAuthenticatorPerson,   legalAuthenticatorOrganisation );

        
        Coded orgCode = ANZSCO_1ED_2006.GENERAL_MEDICAL_PRACTITIONER;
        cdaLegalAuthenticatorAssignedEntity.setCode(orgCode );

        LegalAuthenticator cdaLegalAuthenticator = LegalAuthenticatorImpl.getInstance( now, cdaLegalAuthenticatorAssignedEntity );

        //*********************
        //***** Custodian *****
        //*********************
        
        AsEntityIdentifier custodianIdentifier = new HPIO("8003621231167886");

       

        UniqueIdentifier typedPrescriptionDocumentID = new UniqueIdentifierImpl( prescriptionDocumentID );
        CustodianOrganization custodianOrganization =
                CustodianOrganizationImpl.getInstance( Arrays.asList( typedPrescriptionDocumentID ), custodianIdentifier );
        
        OrganizationName custodianOrganizationName = OrganizationNameImpl.getInstance();
        custodianOrganization.setName( custodianOrganizationName );

        AssignedCustodian cdaAssignedCustodian = AssignedCustodianImpl.getInstance( custodianOrganization );
        Custodian cdaCustodian = CustodianImpl.getInstance( cdaAssignedCustodian );

        BaseClinicalDocument cdaClinicalDocument = ClinicalDocumentFactory.getEPrescription();
        cdaClinicalDocument.setLanguageCode( "en-AU" );
        cdaClinicalDocument.setVersionNumber(1 );

        // as an example we can add another template if needed.
        cdaClinicalDocument.addTemplateId( TemplateIdImpl.getInstance( "1.0", "1.2.36.1.2001.1001.100.149" ) );
        
        
        // prescriptionIdentifier
        //String prescriptionDocumentId = "2.25.36901752580752676809846395044082807160"; //must be an OID to pass into PCEHR

        // You can also use the conversion tool
        String doucmentUUID = UUID.randomUUID().toString();
        String documentIdAsAnOid =  UUIDTool.uuidToOid(doucmentUUID );
        String prescriptionDocumentId=documentIdAsAnOid;
        
        cdaClinicalDocument.setClinicalDocumentId( prescriptionDocumentId );

        EPrescriptionCdaModel ePrescriptionCdaModel = new EPrescriptionCdaModel( cdaClinicalDocument, cdaLegalAuthenticator, cdaCustodian,  creationTime );

        EPrescriptionCreator ePrescriptionCreator = new EPrescriptionCreator( ePrescriptionCdaModel, ePrescription );
        
        
        Document clinicalDocument=null;
        //disabled
        //    clinicalDocument = ePrescriptionCreator.create();
        
        
        String cdaString = TestHelper.documentToXML( clinicalDocument );
        TestHelper.printToFile( cdaString,  DOCUMENT_FILE_NAME );
        System.out.println( cdaString  );
    }

   
   
}

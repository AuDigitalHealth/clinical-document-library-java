package nehta.cda.etp;

import au.gov.nehta.builder.etp.prescriptionrequest.PrescriptionRequestCreator;
import au.gov.nehta.cda.test.Base;
import au.gov.nehta.cda.test.TestHelper;
import au.gov.nehta.model.cda.common.address.PostalAddress;
import au.gov.nehta.model.cda.common.address.PostalAddressImpl;
import au.gov.nehta.model.cda.common.address.PostalAddressUseEnum;
import au.gov.nehta.model.cda.common.code.*;
import au.gov.nehta.model.cda.common.code.PBSPrescriptionTypeCode.PBSPrescriptionType;
import au.gov.nehta.model.cda.common.custodian.*;
import au.gov.nehta.model.cda.common.document.BaseClinicalDocument;
import au.gov.nehta.model.cda.common.document.ClinicalDocumentFactory;
import au.gov.nehta.model.cda.common.id.*;
import au.gov.nehta.model.cda.common.org.Organization;
import au.gov.nehta.model.cda.common.org.OrganizationImpl;
import au.gov.nehta.model.cda.common.org.OrganizationName;
import au.gov.nehta.model.cda.common.org.OrganizationNameImpl;
import au.gov.nehta.model.cda.common.person.Person;
import au.gov.nehta.model.cda.common.person.PersonImpl;
import au.gov.nehta.model.cda.common.telecom.Telecom;
import au.gov.nehta.model.cda.common.telecom.TelecomImpl;
import au.gov.nehta.model.cda.common.telecom.TelecomMedium;
import au.gov.nehta.model.cda.common.telecom.TelecomUse;
import au.gov.nehta.model.cda.common.time.*;
import au.gov.nehta.model.cda.etp.PrescriptionRequestCdaModel;
import au.gov.nehta.model.clinical.common.*;
import au.gov.nehta.model.clinical.common.participation.*;
import au.gov.nehta.model.clinical.common.types.*;
import au.gov.nehta.model.clinical.etp.common.item.*;
import au.gov.nehta.model.clinical.etp.common.participation.EntitlementType;
import au.gov.nehta.model.clinical.etp.common.participation.*;
import au.gov.nehta.model.clinical.etp.eprescription.PrescriptionItem;
import au.gov.nehta.model.clinical.etp.eprescription.PrescriptionItemBuilder;
import au.gov.nehta.model.clinical.etp.prescriptionrequest.*;
import au.gov.nehta.model.schematron.SchematronValidationException;
import org.joda.time.DateTime;
import org.joda.time.LocalDate;
import org.junit.Ignore;
import org.junit.Test;
import org.w3c.dom.Document;

import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;
import java.io.File;
import java.util.*;

public class PrescriptionRequestMinTest  extends Base{
	@Test @Ignore
	public void test_MIN_PrescriptionRequestCreation() throws ParserConfigurationException, JAXBException, SchematronValidationException {
		// Setup context
		// Subject Of Care
		AsEntityIdentifier ihi = new IHI( "8003600300001283" );
		String socFamilyName = "Harding";
		  
        DateTime dob = new LocalDate(1982,11,28).toDateTimeAtStartOfDay();
        

		AustralianAddress socAddress = new AustralianAddressImpl();
		socAddress.addUnstructuredAddressLine( "20 browning st, West End 4101, Brisbane QLD" );

		AddressContext subjectOfCareAddress = new AddressContextImpl( socAddress, AddressPurpose.RESIDENTIAL_PERMANENT );
		PersonName subjectOfCarePersonName = new PersonNameImpl( socFamilyName );
		subjectOfCarePersonName.addNameTitle( NameTitle.MISTER.getDescriptor() );
		subjectOfCarePersonName.addNameSuffix( NameSuffix.JUNIOR.getDescriptor() );
		subjectOfCarePersonName.addGivenName( "Frank" );
		subjectOfCarePersonName.addPersonNameUsage( PersonNameUsage.MAIDEN_NAME_OR_NAME_AT_BIRTH );
	
		DateAccuracy accuracy = new DateAccuracyImpl( true, true, true );
		
		  DateOfBirthDetail subjectOfCareDateOfBirthDetail = new DateOfBirthDetailImpl( dob,accuracy );
		subjectOfCareDateOfBirthDetail.setDateOfBirthIsCalculatedFromAge( true );
		SubjectOfCareDemographicData socData = new SubjectOfCareDemographicDataImpl( Sex.MALE, subjectOfCareDateOfBirthDetail );
		socData.setBirthPlurality( 5 );
		socData.setBirthOrder( 2 );
		int age = 35;
		socData.setAgeAccurate( true );
		socData.setAgeInYears( age );
		socData.setIndigenousStatus( IndigenousStatus.NEITHER__ABORIGINAL_NOR_TORRES_STRAIT_ISLANDER_ORIGIN );
		SubjectOfCarePerson subjectOfCarePerson = new SubjectOfCarePersonImpl( subjectOfCarePersonName, socData );
		SubjectOfCareParticipant subjectOfCareParticipant = new SubjectOfCareParticipantImpl( Arrays.asList( ihi ), subjectOfCareAddress, subjectOfCarePerson );



		Telecom socTelephone =
		        new TelecomImpl(
		                TelecomMedium.TELEPHONE,
		                "0712345678",
		                TelecomUse.PERSONAL );

		Telecom socEmail =
		        new TelecomImpl(
		                TelecomMedium.EMAIL,
		                "frank.harding@electronichealth.net.au",
		                TelecomUse.PERSONAL );

		List<Telecom> socComms = new ArrayList<Telecom>();
		socComms.add( socTelephone );
		socComms.add( socEmail );

		subjectOfCareParticipant.setElectronicCommunicationDetails( socComms );

		AsEntityIdentifier subjectOfCareEntitlementNumber = new MedicareCardIdentifier("12345678-1");

		Entitlement subjectOfCareEntitlement = new EntitlementImpl( subjectOfCareEntitlementNumber, EntitlementType.MEDICARE_BENEFITS );
		
		subjectOfCareEntitlement.setEntitlementValidityDuration(
				RestrictedTimeInterval.getLowInstance(
						//from today(day only precision) 
						new PrecisionDate(Precision.DAY, new DateTime())));
		
		List<Entitlement> subjectOfCareEntitlementList = new ArrayList<Entitlement>();
		subjectOfCareEntitlementList.add( subjectOfCareEntitlement );
		subjectOfCareParticipant.setEntitlements( subjectOfCareEntitlementList );

//		String subjectOfCareParticipationType = "Subject Of Care";
//		SubjectOfCareParticipation subjectOfCareParticipation = new SubjectOfCareParticipationImpl( subjectOfCareParticipationType, subjectOfCareParticipant );

		// Dispenser - author
		HPII dispenserHPII = new HPII( "8003610000010401" );
		String dispenserFamilyName = "Walters";

		AustralianAddress dispenserAustralianAddress = new AustralianAddressImpl();
		ProviderAddress dispenserAddress = new ProviderAddressImpl( true, dispenserAustralianAddress, AddressPurpose.BUSINESS );
        Telecom dispenserEmail = new TelecomImpl( TelecomMedium.EMAIL, "Walters@londondrugs.com.au" );

		PersonName dispenserPersonName = new PersonNameImpl( dispenserFamilyName );
		dispenserPersonName.addPersonNameUsage( PersonNameUsage.NEWBORN_NAME );
		
		DispenserParticipant dispenserParticipant = new DispenserParticipantImpl( dispenserHPII, dispenserPersonName,dispenserAddress );
		dispenserParticipant.setElectronicCommunicationDetail( Collections.singletonList( dispenserEmail ) );
		dispenserParticipant.setQualifications( "M.B.B.S, F.R.A.C.S." );
		DispenserParticipation dispenserParticipation = new DispenserParticipationImpl(  dispenserParticipant );

		// Dispenser Organisation
		HPIO dispenserHPIO = new HPIO( "8003620000030333" );
		
		String dispenserOrgName = "London Drugs";
		AustralianAddress dispensingOrganisationAustralianAddress = new AustralianAddressImpl();
		ProviderAddress dispensingOrganisationAddress = new ProviderAddressImpl( true, dispensingOrganisationAustralianAddress, AddressPurpose.BUSINESS );
        Telecom dispensingOrganisationTel = new TelecomImpl( "021234679");
		List<Telecom> electronicCommunicationDetailList = Arrays.asList( dispensingOrganisationTel );
		Organisation dispensingOrganisation =new OrganisationImpl( dispenserOrgName );
		dispensingOrganisation.setDepartmentUnit( "London Drugs Vancouver" );
		dispensingOrganisation.setOrganisationNameUsage( OrganisationNameUsage.BUSINESS_NAME );
		
		DispensingOrganisationParticipant dispensingOrganisationParticipant =new DispensingOrganisationParticipantImpl(
		        dispenserHPIO,
				dispensingOrganisationAddress, 
				electronicCommunicationDetailList,
				dispensingOrganisation );

		AsEntityIdentifier dispensingOrganisationEntitlementNumber =new AsEntityIdentifierImpl();
		dispensingOrganisationEntitlementNumber.setExtension( "123456789" );
		dispensingOrganisationEntitlementNumber.setAssigningAuthorityName( "Medicare Australia" );
		dispensingOrganisationEntitlementNumber.setRoot( "1.2.36.174030967.0.5" );

		Entitlement dispensingOrganisationEntitlement = new EntitlementImpl( dispensingOrganisationEntitlementNumber, EntitlementType.MEDICARE_PHARMACY_APPROVAL_NUMBER );
		dispensingOrganisationEntitlement.setEntitlementValidityDuration(
				RestrictedTimeInterval.getLowInstance(
						//from today(day only precision) 
						new PrecisionDate(Precision.DAY, new DateTime())) );
		dispensingOrganisationParticipant.setEntitlement( Arrays.asList( dispensingOrganisationEntitlement ) );

		
		Code hardcodedRoleCode = new CodeImpl("PHARM");
        hardcodedRoleCode.setCodeSystem( "2.16.840.1.113883.1.11.17660" );
        hardcodedRoleCode.setCodeSystemName( "HL7 ServiceDeliveryLocationRoleType" );
        hardcodedRoleCode.setDisplayName( "Pharmacy" );
        
		//Role code defaulted to PHARM
		DispensingOrganisationParticipation dispensingOrganisationParticipation =
		        new DispensingOrganisationParticipationImpl( dispensingOrganisationParticipant );

		// Prescriber
		HPII prescriberHPII = new HPII( "8003610000010401" );

		PersonName prescriberPersonName = new PersonNameImpl( "McTesty" );
		prescriberPersonName.addNameTitle( NameTitle.PROFESSOR.getDescriptor() );
		prescriberPersonName.addGivenName( "Tester" );
	    prescriberPersonName.addGivenName( "Middle" );
	    prescriberPersonName.addNameSuffix(NameSuffix.THIRD.getDescriptor());
	    prescriberPersonName.addPersonNameUsage( PersonNameUsage.REGISTERED_NAME_OR_LEGAL_NAME );
		
		AustralianAddress prescriberAustralianAddress =new AustralianAddressImpl();
		prescriberAustralianAddress.addUnstructuredAddressLine( "10 browning st, West End 4101, Brisbane QLD" );

		ProviderAddress prescriberAddress = new ProviderAddressImpl( Boolean.FALSE, prescriberAustralianAddress, AddressPurpose.BUSINESS );

//		Occupation prescriberOccupation = ParticipationFactory.createOccupation( ANZSCO_1ED_2006.GENERAL_MEDICAL_PRACTITIONER );
		ProviderEmploymentDetail prescriberEmploymentDetail = new ProviderEmploymentDetailImpl( new OccupationImpl(ANZSCO_1ED_2006.GENERAL_MEDICAL_PRACTITIONER) );
		ProviderPerson prescriberPerson = new ProviderPersonImpl( prescriberPersonName );
		prescriberPerson.setEmploymentDetail( prescriberEmploymentDetail );

        Telecom prescriberParticipantEmail = new TelecomImpl( TelecomMedium.EMAIL, "prescriber@gp.com.au" );

		DefaultParticipant prescriberParticipant =new DefaultParticipantImpl( prescriberHPII, prescriberPerson );
		prescriberParticipant.setAddress( prescriberAddress );
		prescriberParticipant.setElectronicCommunicationDetail( Collections.singletonList( prescriberParticipantEmail ) );
		prescriberParticipant.setQualifications( "MD" );

		AsEntityIdentifier prescriberEntitlementNumber = new MedicareCardIdentifier("12345678-20");

		Entitlement prescriberEntitlement = new EntitlementImpl( prescriberEntitlementNumber, EntitlementType.MEDICARE_BENEFITS );
		prescriberEntitlement.setEntitlementValidityDuration(	RestrictedTimeInterval.getLowInstance(
				//from today(day only precision) 
				new PrecisionDate(Precision.DAY )));
		prescriberParticipant.addEntitlement( prescriberEntitlement );
		prescriberParticipant.addEntitlement( prescriberEntitlement );

		Role prescriberRole = new RoleImpl( ANZSCO_1ED_2006.GENERAL_MEDICAL_PRACTITIONER );
		PrescriberParticipation prescriberParticipation = new PrescriberParticipationImpl( prescriberRole, prescriberParticipant );


		Telecom prescriberTelephone =
		        new TelecomImpl( TelecomMedium.TELEPHONE,
		                "0756781234", TelecomUse.PERSONAL );

		Telecom prescriberEmail =
		        new TelecomImpl( TelecomMedium.EMAIL,
		                "dr_gp@electronichealth.net.au", TelecomUse.PERSONAL );

		List<Telecom> prescriberComms = new ArrayList<Telecom>();
		prescriberComms.add( prescriberTelephone );
		prescriberComms.add( prescriberEmail );

		prescriberParticipant.setElectronicCommunicationDetail( prescriberComms );

		prescriberParticipant.setQualifications( "M.B.B.S., F.R.A.C.S." );

		// Prescriber Organisation
		HPIO prescriberHpio = new HPIO( "8003620000030333" );
		

		AustralianAddress prescriberOrgAddress = new AustralianAddressImpl();
		// ProviderAddress providerOrganisationAddress =
		// ETPParticipationFactory.createProviderAddress(true,
		// prescriberOrganisationAustralianAddress, AddressPurpose.BUSINESS);

		
		prescriberOrgAddress.addUnstructuredAddressLine( "10 browning st, West End 4101, Brisbane QLD" );
		ProviderAddress prescriberOrganisationAddress = new ProviderAddressImpl( false, prescriberOrgAddress, AddressPurpose.BUSINESS );

		Telecom prescriberOrgTel =   new TelecomImpl( "0385231456");
		List<Telecom> prescriberOrgTelecoms = Arrays.asList( prescriberOrgTel );
		
		String prescriberOrganisationName = "GP Australia";
		Organisation prescriberOrganisation = new OrganisationImpl( prescriberOrganisationName );
		prescriberOrganisation.setOrganisationNameUsage( OrganisationNameUsage.BUSINESS_NAME );
		prescriberOrganisation.setDepartmentUnit( "SOME DEPARTMENT" );
		
		PrescriberOrganisationParticipant prescriberOrganisationParticipant =new PrescriberOrganisationParticipantImpl( prescriberHpio,
				prescriberOrganisationAddress, prescriberOrgTelecoms, prescriberOrganisation );
		
		Role prescriberOrganisationRole = new RoleImpl( ANZSCO_1ED_2006.CAFE_WORKER  );
		
		
		PrescriberOrganisationParticipation prescriberOrganisationParticipation = new PrescriberOrganisationParticipationImpl(
				prescriberOrganisationRole, 
				prescriberOrganisationParticipant );

		// DateTime Prescription Request Written
		DateTime dateTimePrescriptionRequestWritten = new DateTime();

		// Prescription Identifier
		String PRESCRIPTION_REQUEST_IDENTIFIER_ROOT = "PRESCRIPTION REQUEST IDENTIFIER ROOT";
		String PRESCRIPTION_REQUEST_IDENTIFIER_EXTENSION = "PRESCRIPTION REQUEST IDENTIFIER EXTENSION";

		PrescriptionRequestIdentifier prescriptionRequestIdentifier = new PrescriptionRequestIdentifier( PRESCRIPTION_REQUEST_IDENTIFIER_ROOT,
				PRESCRIPTION_REQUEST_IDENTIFIER_EXTENSION );

		PrescriptionRequestContext prescriptionRequestContext = new PrescriptionRequestContextImpl( subjectOfCareParticipant, dispenserParticipation,
				dispensingOrganisationParticipation, prescriberParticipation, prescriberOrganisationParticipation, prescriptionRequestIdentifier, dateTimePrescriptionRequestWritten );

		// Setup content
		// Prescriber Instruction Recipient
		final HPII prescriber = new HPII( "8003610000010402" );
		String instructionRecipientFamilyName = "Jennings";
		
		DateTime recipientDateOfBirth = new LocalDate(1982,11,28).toDateTimeAtStartOfDay();
//		Code theraputicGood = new SNOMED_AU_Code( "1.1.1.1.1","theraputic good code display name" );
//		String quantity = "10 Tablets";

		PersonName prescriberInstructionRecipientPersonName = new PersonNameImpl( instructionRecipientFamilyName );
		prescriberInstructionRecipientPersonName.setPreferredNameIndicator( true );
		prescriberInstructionRecipientPersonName.addPersonNameUsage( PersonNameUsage.MAIDEN_NAME_OR_NAME_AT_BIRTH );
		prescriberInstructionRecipientPersonName.addGivenName( "Lara" );
		
		
		ProviderIndividualDateOfBirthDetail prescriberInstructionRecipientDateOfBirthDetail = new ProviderIndividualDateOfBirthDetailImpl( recipientDateOfBirth );
		ProviderIndividualDemographicData prescriberInstructionRecipientDemographicData = new ProviderIndividualDemographicDataImpl( Sex.FEMALE,
				prescriberInstructionRecipientDateOfBirthDetail );
		
		PrescriberInstructionRecipientPerson prescriberInstructionRecipientPerson = new PrescriberInstructionRecipientPersonImpl( prescriberInstructionRecipientPersonName,
				prescriberInstructionRecipientDemographicData );
		
		AustralianAddress prescriberInstructionAddress = new AustralianAddressImpl();
		prescriberInstructionAddress = prescriberAustralianAddress;//reuse the prescribers address
		ProviderAddress prescriberInstructionRecipientAddress = new ProviderAddressImpl( false, prescriberInstructionAddress, AddressPurpose.BUSINESS );

		final String PRESCRIBER_INSTRUCTION_RECIPIENT_ELECTRONIC_COMMUNICATION_ADDRESS = "prescription_recipient@londondrugs.com.au";
		Telecom prescriberInstructionRecipientElectronicCommunicationDetail =
		        new TelecomImpl(
		                TelecomMedium.EMAIL,
				PRESCRIBER_INSTRUCTION_RECIPIENT_ELECTRONIC_COMMUNICATION_ADDRESS,
				TelecomUse.BUSINESS );

		PrescriberInstructionRecipientParticipant prescriberInstruction = new PrescriberInstructionRecipientParticipantImpl(
				prescriber, prescriberInstructionRecipientPerson );

		prescriberInstruction.setQualifications( "Some PIR Qualification" );
		prescriberInstruction.setElectronicCommunicationDetail( Arrays.asList( prescriberInstructionRecipientElectronicCommunicationDetail ) );
		prescriberInstruction.setAddress( prescriberInstructionRecipientAddress );

		Role instructionRoleCode = new RoleImpl( ANZSCO_1ED_2006.PHARMACISTS );
		PrescriberInstructionRecipientParticipation prescriberInstructionRecipientParticipation = new PrescriberInstructionRecipientParticipationImpl(
				 instructionRoleCode, prescriberInstruction );

		DateTime dateTimeInstructionReceived = new DateTime();
		String instruction = "Paracetamol 500mg + codeine phosphate 30 mg tablet for acute pain. 25 tablets total. Allow brand substitution. 1 week minimum interval between repeats";
		PrescriberInstructionSource instructionSource = new PrescriberInstructionSourceImpl( PrescriberInstructionSourceEnum.VERBAL_INSTRUCTION );
		PrescriberInstructionCommunicationMedium instructionMedium =
		        new PrescriberInstructionCommunicationMediumImpl( PrescriberInstructionCommunicationMediumEnum.PHONE );

		
		
		
	
        
        /*=================================================
        
                        Prescription Item
        
          ================================================= */
		  String prescriptionIdentifierCode = "AA=SV3Cg3FNwYyD#xE";
		  boolean isAllowBrandSubstitution = true;
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
     
        String doseUnits = "Tablet(s)";
        Dosage dosage =   new DosageImpl();
        dosage.setDoseQuantity( QuantityUnitDescriptionImpl.create(  30, new SNOMED_AU_Code("385057009","Film-coated tablet")) );
        
        //max dose = 4 tablets/24hours
        dosage.setMaxDose( Ratio.getUnitsOverTime( 4.0, doseUnits, new TimeQuantity(24.0, TimeUnitOfMeasure.HOUR) ) );
        String instructionsForUse = "Take one and call me in the morning"; //also called directions
         
        
//        TimeQuantity intervalBetweenRepeats = new TimeQuantity( 3, TimeUnitOfMeasure.WEEK );
//        intervalBetweenRepeats.setNarrative( "3 weeks" ); //a text descripton of this time quantity
        
        
       
        DateTime creationTime = new DateTime();
        DateTime expiryTime = new DateTime();
        expiryTime.plusWeeks( 4 );
        
        //for start, stop and structured time
        PeriodicIntervalTime onceADay =new PeriodicIntervalTime(new TimeQuantity(1.0 , TimeUnitOfMeasure.DAY), 1 );
        onceADay.setNarrative( "Once every twenty four (24) Hours" );
        
        DateTime twoWeeks = new DateTime();
        twoWeeks.plusWeeks( 2 );
        PreciseDate twoWeeksLater = new PrecisionDate(Precision.DAY, twoWeeks);
        RestrictedTimeInterval betweenNowAndTwoWeeks = RestrictedTimeInterval.getLowHighInstance( new PrecisionDate(Precision.DAY), twoWeeksLater );
        betweenNowAndTwoWeeks.setNarrative( "for a fortnight" );
         
        PrescriptionItemIdentifier prescriptionItemIdentifier = ItemFactory.createPrescriptionItemIdentifier( prescriptionIdentifierCode );
        
        //therapeuticGoodIdentification 
        Code amt = new AMTCode("23641011000036102","paracetamol 500 mg + codeine phosphate 30 mg tablet");

        
        PrescriptionItemBuilder builder = new PrescriptionItemBuilder();
        
        
        builder //can chain items on the builder
        
         //** mandatory fields **
        .dateTimeWritten( creationTime ) 
        .dateTimeExpires(expiryTime  )
        .prescriptionItemIdentifier( prescriptionItemIdentifier )
        .brandSubstituteAllowed( isAllowBrandSubstitution )
        .maximumNumberOfRepeats( repeats )
        .medicalBenefitCategoryType( MedicalBenefitCategoryType.PBS )
        .pbsType( new PBSPrescriptionTypeCode(PBSPrescriptionType.STANDARD_PRESCRIPTION) )
        .pbsRPBSItemCode( amt )
        .directions( instructionsForUse )
        .closeTheGap( uuidRoot( "CTG048" ) )
        ;
        
        
        
        
        
        /*
            Build will throw illegal argument exception if one of the mandatory fields is missing
            mandatory fields are:
                Prescription expiry time 
                Prescription written time
                pbs/rpbs item code
                prescriptionItemIdentifier
                brandSubstituteAllowed
                maximumNumberOfRepeats
                medicalBenefitCategoryType
                groundsForConcurrentSupply
                directions
                pbs type
                close the gap ids
        */
        PrescriptionItem prescriptionRequestItem =  builder.buildPrescriptionRequestItem();
		
		
		
		
		
		
		

		PrescriberInstructionDetail prescriberInstructionDetail = new PrescriberInstructionDetailImpl( prescriberInstructionRecipientParticipation,
				dateTimeInstructionReceived, instruction,
				instructionSource, instructionMedium );

		
		Logo logo = new Logo( new File("logo.png") ); //will use sha1 by default

        //optional alternative, but not recommended
        //Logo logo = new Logo( new File("logo.png"), IntegerityCheckType.SHA_256 );
		
		PrescriptionRequestContent prescriptionRequestContent = new PrescriptionRequestContentImpl( prescriberInstructionDetail, prescriptionRequestItem );
		RequesterNote requesterNote =new RequesterNoteImpl( "Requester Note" );
		prescriptionRequestContent.setRequesterNote( requesterNote );
		prescriptionRequestContent.setLogo( logo );
		
		
		
		
		
		// Create Prescription Request
		PrescriptionRequest prescriptionRequest = new PrescriptionRequestImpl( prescriptionRequestContext, prescriptionRequestContent );

		// Create CDA Model
		String assignedAuthorId = "ASSIGNED AUTHOR ID UUID";
		String prescriberInstructionAssignedAuthorId = "PRESCRIBER INSTRUCTION ASSIGNED AUTHOR ID UUID";
		DateTime prescriberInstructionTime = new DateTime();
		String prescriberInstructionRecipient = "PRESCRIBER INSTRUCTION RECIPIENT PARTICIPANT ID UUID";
		// final Date prescriberInstructionRecipientParticipantId = new
		// Date(System.currentTimeMillis());

		BaseClinicalDocument cdaClinicalDocument = ClinicalDocumentFactory.getPrescriptionRequest();
		cdaClinicalDocument.setLanguageCode( "en-AU" );
		cdaClinicalDocument.setVersionNumber( 1 );
		cdaClinicalDocument.setSetId( UUID.randomUUID().toString() );

		// Legal Authenticator
		AsEntityIdentifier authenticatorIdentifier = new HPII("8003611234567890");

		PersonName cdaLegalAuthenticatorAssignedEntityPersonName = PersonNameImpl.getInstance( "Black", "Jane", NameTitle.MRS.getDescriptor(), NameSuffix.JUNIOR.getDescriptor(), PersonNameUsage.REGISTERED_NAME_OR_LEGAL_NAME );

		Person cdaLegalAuthenticatorAssignedEntityPerson = PersonImpl.getInstance( authenticatorIdentifier, cdaLegalAuthenticatorAssignedEntityPersonName );

		AsEntityIdentifier authenticatorOrganisationId = new HPIO("8003611234567896");


		Organization legalAuthenticatorOrganisation = OrganizationImpl.getInstance( authenticatorOrganisationId,"Primary Healthcare Clinic Name");
		AssignedEntity authenticatorAssignedEntity = AssignedEntityImpl.getInstance(
		        UUID.randomUUID().toString(),
		        cdaLegalAuthenticatorAssignedEntityPerson,
				legalAuthenticatorOrganisation );


		Telecom authenticatorEmail =  new TelecomImpl(TelecomMedium.EMAIL, "auth@example.com.au", TelecomUse.BUSINESS );
		authenticatorAssignedEntity.setTelecom( Arrays.asList( authenticatorEmail ) );

		LegalAuthenticator cdaLegalAuthenticator = LegalAuthenticatorImpl.getInstance( new DateTime(), authenticatorAssignedEntity );

		// Custodian
		AsEntityIdentifier custodianHPIO = new HPIO( "8003621234567890" );
		Telecom custodianPH = new TelecomImpl( "0712341234", TelecomUse.BUSINESS );

		
		Address custodianAddress = new AustralianAddressImpl();
		custodianAddress.addUnstructuredAddressLine( "99 Clinician Street" );
		custodianAddress.setCity( "Nehtaville" );
		custodianAddress.setState( "QLD" );
		custodianAddress.setPostcode( "5555" );
		custodianAddress.setAdditionalLocator( "32568931" );
		PostalAddress custodianPostalAddress = new PostalAddressImpl(custodianAddress, PostalAddressUseEnum.HOME_ADDRESS );
        
		
		UniqueIdentifier id = new UniqueIdentifierImpl(UUID.randomUUID().toString());
		CustodianOrganization custodianOrganization =
		        CustodianOrganizationImpl.getInstance( Arrays.asList( id ),
				custodianHPIO );
		OrganizationName custodianOrgName = OrganizationNameImpl.getInstance();
		custodianOrgName.setValue( "Oz Health Clinic" );
		custodianOrganization.setName( custodianOrgName );
		custodianOrganization.setTelecom( custodianPH );
		custodianOrganization.setAddress( custodianPostalAddress );

		AssignedCustodian cdaAssignedCustodian = AssignedCustodianImpl.getInstance( custodianOrganization );
		Custodian cdaCustodian = CustodianImpl.getInstance( cdaAssignedCustodian );

		PrescriptionRequestCdaModel prescriptionRequestCdaModel = new PrescriptionRequestCdaModel(
		        cdaClinicalDocument, 
		        cdaLegalAuthenticator, 
		        cdaCustodian, 
		        assignedAuthorId,
				prescriberInstructionAssignedAuthorId,
				prescriberInstructionTime,
				prescriberInstructionRecipient );

		PrescriptionRequestCreator prescriptionRequestCreator = new PrescriptionRequestCreator( prescriptionRequestCdaModel, prescriptionRequest );

        Document clinicalDocument = null;
        //diabled
        //clinicalDocument = prescriptionRequestCreator.create();

        String cdaString = TestHelper.documentToXML( clinicalDocument );
        TestHelper.printToFile( cdaString, TEST_GENERATION+"prescription-request-min.xml" );
        System.out.println( cdaString );
	    }

	   
}

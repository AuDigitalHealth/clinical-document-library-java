package au.gov.nehta.cda.etp;

import static au.gov.nehta.model.schematron.SchematronResource.SchematronResources.E_PRESCRIPTION_3B;
import static junit.framework.Assert.assertTrue;

import au.gov.nehta.builder.etp.prescriptionrequest.PrescriptionRequestCreator;
import au.gov.nehta.builder.util.UUIDTool;
import au.gov.nehta.cda.test.Base;
import au.gov.nehta.cda.test.TestHelper;
import au.gov.nehta.model.cda.common.address.PostalAddress;
import au.gov.nehta.model.cda.common.address.PostalAddressImpl;
import au.gov.nehta.model.cda.common.address.PostalAddressUseEnum;
import au.gov.nehta.model.cda.common.code.AMTCode;
import au.gov.nehta.model.cda.common.code.Code;
import au.gov.nehta.model.cda.common.code.CodeImpl;
import au.gov.nehta.model.cda.common.code.NCTISDataComponent;
import au.gov.nehta.model.cda.common.code.PBSPrescriptionTypeCode;
import au.gov.nehta.model.cda.common.code.PBSPrescriptionTypeCode.PBSPrescriptionType;
import au.gov.nehta.model.cda.common.code.SNOMED_AU_Code;
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
import au.gov.nehta.model.cda.common.telecom.TelecomMedium;
import au.gov.nehta.model.cda.common.telecom.TelecomUse;
import au.gov.nehta.model.cda.common.time.PeriodicIntervalTime;
import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.cda.common.time.Precision;
import au.gov.nehta.model.cda.common.time.PrecisionDate;
import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;
import au.gov.nehta.model.cda.common.time.TimeQuantity;
import au.gov.nehta.model.cda.common.time.TimeUnitOfMeasure;
import au.gov.nehta.model.cda.etp.PrescriptionRequestCdaModel;
import au.gov.nehta.model.clinical.common.SubjectOfCareDemographicData;
import au.gov.nehta.model.clinical.common.SubjectOfCareDemographicDataImpl;
import au.gov.nehta.model.clinical.common.SubjectOfCareParticipant;
import au.gov.nehta.model.clinical.common.SubjectOfCareParticipantImpl;
import au.gov.nehta.model.clinical.common.SubjectOfCarePerson;
import au.gov.nehta.model.clinical.common.SubjectOfCarePersonImpl;
import au.gov.nehta.model.clinical.common.participation.ANZSCO_1ED_2006;
import au.gov.nehta.model.clinical.common.participation.Address;
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
import au.gov.nehta.model.clinical.common.participation.OccupationImpl;
import au.gov.nehta.model.clinical.common.participation.Organisation;
import au.gov.nehta.model.clinical.common.participation.OrganisationImpl;
import au.gov.nehta.model.clinical.common.participation.OrganisationNameUsage;
import au.gov.nehta.model.clinical.common.participation.PersonName;
import au.gov.nehta.model.clinical.common.participation.PersonNameImpl;
import au.gov.nehta.model.clinical.common.participation.PersonNameUsage;
import au.gov.nehta.model.clinical.common.participation.Role;
import au.gov.nehta.model.clinical.common.participation.RoleImpl;
import au.gov.nehta.model.clinical.common.participation.Sex;
import au.gov.nehta.model.clinical.common.types.HPII;
import au.gov.nehta.model.clinical.common.types.HPIO;
import au.gov.nehta.model.clinical.common.types.IHI;
import au.gov.nehta.model.clinical.common.types.PbsAuthorityPrescriptionNumber;
import au.gov.nehta.model.clinical.common.types.Ratio;
import au.gov.nehta.model.clinical.common.types.RealQuantity;
import au.gov.nehta.model.clinical.common.types.StreamlinedAuthorityApprovalNumber;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifierImpl;
import au.gov.nehta.model.clinical.etp.common.item.Dosage;
import au.gov.nehta.model.clinical.etp.common.item.DosageImpl;
import au.gov.nehta.model.clinical.etp.common.item.Ingredient;
import au.gov.nehta.model.clinical.etp.common.item.ItemFactory;
import au.gov.nehta.model.clinical.etp.common.item.MedicalBenefitCategoryType;
import au.gov.nehta.model.clinical.etp.common.item.PrescriptionItemIdentifier;
import au.gov.nehta.model.clinical.etp.common.item.QuantityUnitDescription;
import au.gov.nehta.model.clinical.etp.common.item.QuantityUnitDescriptionImpl;
import au.gov.nehta.model.clinical.etp.common.participation.AddressContext;
import au.gov.nehta.model.clinical.etp.common.participation.DefaultParticipant;
import au.gov.nehta.model.clinical.etp.common.participation.DefaultParticipantImpl;
import au.gov.nehta.model.clinical.etp.common.participation.DispenserParticipant;
import au.gov.nehta.model.clinical.etp.common.participation.DispenserParticipantImpl;
import au.gov.nehta.model.clinical.etp.common.participation.DispenserParticipation;
import au.gov.nehta.model.clinical.etp.common.participation.DispenserParticipationImpl;
import au.gov.nehta.model.clinical.etp.common.participation.DispensingOrganisationParticipant;
import au.gov.nehta.model.clinical.etp.common.participation.DispensingOrganisationParticipantImpl;
import au.gov.nehta.model.clinical.etp.common.participation.DispensingOrganisationParticipation;
import au.gov.nehta.model.clinical.etp.common.participation.DispensingOrganisationParticipationImpl;
import au.gov.nehta.model.clinical.etp.common.participation.Entitlement;
import au.gov.nehta.model.clinical.etp.common.participation.EntitlementImpl;
import au.gov.nehta.model.clinical.etp.common.participation.EntitlementType;
import au.gov.nehta.model.clinical.etp.common.participation.PrescriberInstructionRecipientParticipant;
import au.gov.nehta.model.clinical.etp.common.participation.PrescriberInstructionRecipientParticipantImpl;
import au.gov.nehta.model.clinical.etp.common.participation.PrescriberInstructionRecipientParticipation;
import au.gov.nehta.model.clinical.etp.common.participation.PrescriberInstructionRecipientParticipationImpl;
import au.gov.nehta.model.clinical.etp.common.participation.PrescriberInstructionRecipientPerson;
import au.gov.nehta.model.clinical.etp.common.participation.PrescriberInstructionRecipientPersonImpl;
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
import au.gov.nehta.model.clinical.etp.common.participation.ProviderIndividualDateOfBirthDetail;
import au.gov.nehta.model.clinical.etp.common.participation.ProviderIndividualDateOfBirthDetailImpl;
import au.gov.nehta.model.clinical.etp.common.participation.ProviderIndividualDemographicData;
import au.gov.nehta.model.clinical.etp.common.participation.ProviderIndividualDemographicDataImpl;
import au.gov.nehta.model.clinical.etp.common.participation.ProviderPerson;
import au.gov.nehta.model.clinical.etp.common.participation.ProviderPersonImpl;
import au.gov.nehta.model.clinical.etp.eprescription.PrescriptionItem;
import au.gov.nehta.model.clinical.etp.eprescription.PrescriptionItemBuilder;
import au.gov.nehta.model.clinical.etp.prescriptionrequest.PrescriberInstructionCommunicationMedium;
import au.gov.nehta.model.clinical.etp.prescriptionrequest.PrescriberInstructionCommunicationMediumEnum;
import au.gov.nehta.model.clinical.etp.prescriptionrequest.PrescriberInstructionCommunicationMediumImpl;
import au.gov.nehta.model.clinical.etp.prescriptionrequest.PrescriberInstructionDetail;
import au.gov.nehta.model.clinical.etp.prescriptionrequest.PrescriberInstructionDetailImpl;
import au.gov.nehta.model.clinical.etp.prescriptionrequest.PrescriberInstructionSource;
import au.gov.nehta.model.clinical.etp.prescriptionrequest.PrescriberInstructionSourceEnum;
import au.gov.nehta.model.clinical.etp.prescriptionrequest.PrescriberInstructionSourceImpl;
import au.gov.nehta.model.clinical.etp.prescriptionrequest.PrescriptionRequest;
import au.gov.nehta.model.clinical.etp.prescriptionrequest.PrescriptionRequestContent;
import au.gov.nehta.model.clinical.etp.prescriptionrequest.PrescriptionRequestContentImpl;
import au.gov.nehta.model.clinical.etp.prescriptionrequest.PrescriptionRequestContext;
import au.gov.nehta.model.clinical.etp.prescriptionrequest.PrescriptionRequestContextImpl;
import au.gov.nehta.model.clinical.etp.prescriptionrequest.PrescriptionRequestIdentifier;
import au.gov.nehta.model.clinical.etp.prescriptionrequest.PrescriptionRequestImpl;
import au.gov.nehta.model.clinical.etp.prescriptionrequest.RequesterNote;
import au.gov.nehta.model.clinical.etp.prescriptionrequest.RequesterNoteImpl;
import au.gov.nehta.model.schematron.SchematronValidationException;
import au.gov.nehta.schematron.Schematron;
import au.gov.nehta.schematron.SchematronCheckResult;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.UUID;
import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;
import org.joda.time.DateTime;
import org.joda.time.LocalDate;
import org.joda.time.format.DateTimeFormat;
import org.junit.Ignore;
import org.junit.Test;
import org.w3c.dom.Document;

public class PrescriptionRequestMaxTest extends Base {

	private static final String SCHEMATRON = E_PRESCRIPTION_3B.resource().getSchematron();
	private static final String SCHEMATRON_TEMPLATE_PATH = "src/test/resources/prescriptionRequest/";
	private static final String DOCUMENT_FILE_NAME = "src/test/resources/eprescription/prescription-request-max.xml";


	@Test
	@Ignore
	public void test_MAX_PrescriptionRequestCreation()
			throws ParserConfigurationException, JAXBException, SchematronValidationException, ParseException {
		generateMax();
		SchematronCheckResult check = Schematron
				.check(SCHEMATRON_TEMPLATE_PATH, SCHEMATRON, DOCUMENT_FILE_NAME);
		show(check);
		assertTrue(check.schemaErrors.size() == 0);
		assertTrue(check.schematronErrors.size() == 0);
	}


	public void generateMax()
			throws ParserConfigurationException, JAXBException, ParseException, SchematronValidationException {
		// Setup context
		// Subject Of Care
		AsEntityIdentifier ihi = new IHI("8003600300001283");
		String socFamilyName = "Harding";
		DateTime dateOfBirth = new LocalDate(1982, 11, 28).toDateTimeAtStartOfDay();

		AustralianAddress socAddress = new AustralianAddressImpl();
		socAddress.addUnstructuredAddressLine("The Complex");
		socAddress.addUnstructuredAddressLine("Unit 90210 / 10 Browning st");
		socAddress.setState(AustralianStateTerritory.QUEENSLAND.getAbbreviation());
		socAddress.setPostcode("4101");
		

		AddressContext subjectOfCareAddress = new AddressContextImpl(  socAddress, AddressPurpose.RESIDENTIAL_PERMANENT );
		PersonName subjectOfCarePersonName = new PersonNameImpl( socFamilyName );
		subjectOfCarePersonName.addNameTitle( NameTitle.MISTER.getDescriptor() );
		subjectOfCarePersonName.addNameSuffix( NameSuffix.JUNIOR.getDescriptor() );
		subjectOfCarePersonName.addGivenName( "Frank" );
		subjectOfCarePersonName.addPersonNameUsage( PersonNameUsage.MAIDEN_NAME_OR_NAME_AT_BIRTH );
	
		DateAccuracy accuracy = new DateAccuracyImpl( true, true, true );
		
		  DateOfBirthDetail subjectOfCareDateOfBirthDetail = new DateOfBirthDetailImpl( dateOfBirth,accuracy );
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
		HPII dispenserHPII = new HPII( "8003610000001145" );
		String dispenserFamilyName = "Walters";

		AustralianAddress dispenserAustralianAddress = new AustralianAddressImpl();
		ProviderAddress dispenserAddress = new ProviderAddressImpl( true, dispenserAustralianAddress, AddressPurpose.BUSINESS );
		Telecom dispenserEmail =
		        new TelecomImpl(
		                TelecomMedium.EMAIL,
		                "Walters@londondrugs.com.au",
		                TelecomUse.BUSINESS );

		PersonName dispenserPersonName = new PersonNameImpl( dispenserFamilyName );
		dispenserPersonName.addPersonNameUsage( PersonNameUsage.NEWBORN_NAME );
		
		DispenserParticipant dispenserParticipant = new DispenserParticipantImpl( dispenserHPII, dispenserPersonName,dispenserAddress );
		dispenserParticipant.setElectronicCommunicationDetail( Collections.singletonList( dispenserEmail ) );
		dispenserParticipant.setQualifications( "M.B.B.S, F.R.A.C.S." );
		DispenserParticipation dispenserParticipation = new DispenserParticipationImpl(  dispenserParticipant );

		// Dispenser Organisation
		HPIO dispenserHPIO = new HPIO( "8003621231167886" );
		
		String dispenserOrgName = "London Drugs";
		String dispenserOrgEmail = "info@londondrugs.com.au";
		AustralianAddress dispensingOrganisationAustralianAddress = new AustralianAddressImpl();
		ProviderAddress dispensingOrganisationAddress = new ProviderAddressImpl( true, dispensingOrganisationAustralianAddress, AddressPurpose.BUSINESS );
		Telecom dispensingOrgEmail =
		        new TelecomImpl( TelecomMedium.EMAIL, dispenserOrgEmail, TelecomUse.BUSINESS );
		 Telecom dispensingOrgTel = new TelecomImpl( "0212345678" );
		  
		List<Telecom> electronicCommunicationDetailList = Arrays.asList( dispensingOrgEmail ,dispensingOrgTel);
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
		HPII prescriberHPII = new HPII( "8003610000001145" );

		PersonName prescriberPersonName = new PersonNameImpl( "McTesty" );
		prescriberPersonName.addNameTitle( NameTitle.PROFESSOR.getDescriptor() );
		prescriberPersonName.addGivenName( "Tester" );
	    prescriberPersonName.addGivenName( "Middle" );
	    prescriberPersonName.addNameSuffix(NameSuffix.THIRD.getDescriptor());
	    prescriberPersonName.addPersonNameUsage( PersonNameUsage.REGISTERED_NAME_OR_LEGAL_NAME );
		
		AustralianAddress prescriberAustralianAddress =new AustralianAddressImpl();
		prescriberAustralianAddress.addUnstructuredAddressLine( "The Complex" );
		prescriberAustralianAddress.addUnstructuredAddressLine( "Unit 90210 / 10 Browning st" );
		prescriberAustralianAddress.setCity( "West End"  );
		prescriberAustralianAddress.setState( AustralianStateTerritory.QUEENSLAND.getAbbreviation() );
		prescriberAustralianAddress.setPostcode(  "4101"  );
		prescriberAustralianAddress.setDeliveryPointIdentifier(  "12345679" );

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

		AsEntityIdentifier prescriberEntitlementNumber = new MedicareCardIdentifier("1234567820");

		Entitlement prescriberEntitlement = new EntitlementImpl( prescriberEntitlementNumber, EntitlementType.MEDICARE_BENEFITS );
		prescriberEntitlement.setEntitlementValidityDuration(	RestrictedTimeInterval.getLowInstance(
				//from today(day only precision) 
				new PrecisionDate(Precision.DAY, new DateTime()))  );
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
		HPIO prescriberHpio = new HPIO( "8003621231167886" );
		

		AustralianAddress prescriberOrgAddress = new AustralianAddressImpl();
		// ProviderAddress providerOrganisationAddress =
		// ETPParticipationFactory.createProviderAddress(true,
		// prescriberOrganisationAustralianAddress, AddressPurpose.BUSINESS);

		prescriberOrgAddress.addUnstructuredAddressLine( "The Complex" );
        prescriberOrgAddress.addUnstructuredAddressLine( "Unit 90210 / 10 Browning st" );
		prescriberOrgAddress.setCity( "West End"  );
		prescriberOrgAddress.setState( AustralianStateTerritory.QUEENSLAND.getAbbreviation() );
		prescriberOrgAddress.setPostcode(  "4101"  );
		prescriberOrgAddress.setDeliveryPointIdentifier(  "12345679" );
		ProviderAddress prescriberOrganisationAddress = new ProviderAddressImpl( false, prescriberOrgAddress, AddressPurpose.BUSINESS );

		Telecom prescriberOrgEmail =    new TelecomImpl( TelecomMedium.EMAIL,  "info@gp.com.au");
		Telecom prescriberOrgTel=    new TelecomImpl( "02123465790" );
		List<Telecom> prescriberOrganisationElectronicCommunicationDetailList = Arrays.asList( prescriberOrgEmail ,prescriberOrgTel);
		
		String prescriberOrganisationName = "GP Australia";
		Organisation prescriberOrganisation = new OrganisationImpl( prescriberOrganisationName );
		prescriberOrganisation.setOrganisationNameUsage( OrganisationNameUsage.BUSINESS_NAME );
		prescriberOrganisation.setDepartmentUnit( "SOME DEPARTMENT" );
		
		PrescriberOrganisationParticipant prescriberOrganisationParticipant =new PrescriberOrganisationParticipantImpl( prescriberHpio,
				prescriberOrganisationAddress, prescriberOrganisationElectronicCommunicationDetailList, prescriberOrganisation );
		
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
		final HPII prescriber = new HPII( "8003610000001145" );
		String instructionRecipientFamilyName = "Jennings";
		
	 
		DateTime recipientDateOfBirth = new DateTime(1982,11,28, 0, 0, 0, 0);
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
	        String formula = "N-(4-Hydroxyphenyl)acetamide C8H9NO2";
	        
        
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
        dosage.setDoseQuantity( QuantityUnitDescriptionImpl.create(  1, new SNOMED_AU_Code("385057009","Film-coated tablet")) );
        
        
        //max dose = 4 tablets/24hours
        dosage.setMaxDose( Ratio.getUnitsOverTime( 4.0, doseUnits, new TimeQuantity(24.0, TimeUnitOfMeasure.HOUR) ) );
        String instructionsForUse = "Take one and call me in the morning"; //also called directions
         
        
//        TimeQuantity intervalBetweenRepeats = new TimeQuantity( 3, TimeUnitOfMeasure.WEEK );
//        intervalBetweenRepeats.setNarrative( "3 weeks" ); //a text descripton of this time quantity
        
        
        DateTime creationTime = new DateTime(2012,8,2,0,0,0,0);
        DateTime expiryTime = new DateTime();
        
        
        //for start, stop and structured time
        PeriodicIntervalTime onceADay =new PeriodicIntervalTime(new TimeQuantity(1.0 , TimeUnitOfMeasure.DAY), 1 );
        onceADay.setNarrative( "Once every twenty four (24) Hours" );
        
        DateTime twoWeeks = new DateTime();
        twoWeeks.plusWeeks( 2 );
        PreciseDate twoWeeksLater = new PrecisionDate(Precision.DAY, twoWeeks);
        RestrictedTimeInterval betweenNowAndTwoWeeks = RestrictedTimeInterval.getLowHighInstance( new PrecisionDate(Precision.DAY), twoWeeksLater );
        betweenNowAndTwoWeeks.setNarrative( "for a fortnight" );
         
        
        
        String additionalComments = "Patient must retrun for a checkup at the end of treatment";
        

        PrescriptionItemIdentifier prescriptionItemIdentifier = ItemFactory.createPrescriptionItemIdentifier( prescriptionIdentifierCode );
        
        //therapeuticGoodIdentification 
        Code amt = new AMTCode("23641011000036102","paracetamol 500 mg + codeine phosphate 30 mg tablet");
        Code amtToNctisTranslation = new NCTISDataComponent( "1.1.1.1.1.1.1", "PBSRPBSItemCode" );
        amt.setOriginalText("some original text");
        amt.addTranslation(  amtToNctisTranslation );
        
        //an elaborate style dispensing unit code
        SNOMED_AU_Code dispensingUnitCode = new SNOMED_AU_Code("32570641000036102", "foo bar disepnsing unit");
        dispensingUnitCode.setOriginalText( "more elaborate text here if needed" );
        QuantityUnitDescription dispenseQuantity = QuantityUnitDescriptionImpl.create( 3, dispensingUnitCode );
    
        
        
//        //for start, stop and structured time
//        PeriodicTimeInterval onceADay =new PeriodicTimeInterval(new TimeQuantity(1.0 ,TimeUnitOfMeasure.DAY), 1 );
//        onceADay.setNarrative( "Once every twenty four (24) Hours" );
        
        
        
        //Extemporaneous Ingredients
        Code nacl = new NCTISDataComponent( "1.1.1.1.1", "PBS Extemporaneous Ingredient Name" );
        nacl.setOriginalText( "Sodium Chloride" );
        Ratio _5mg = Ratio.numeratorOnly( new RealQuantity( 5, "mg") );
        Ingredient salt5mg = new Ingredient(nacl, _5mg );
      
        
        Code C6H12O6 = new NCTISDataComponent( "1.1.1.1.1", "PBS Extemporaneous Ingredient Name" );
        C6H12O6.setOriginalText( "Glucose" );
        Ratio _10mg = Ratio.numeratorOnly( new RealQuantity( 10, "mg") );
        Ingredient glucose10mg = new Ingredient(C6H12O6, _10mg );
     
        
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
        
        
         //** optional fields **
        .formula(formula)
        .dosage( dosage )
        .longTerm( Boolean.TRUE)
        
        /*
         * PRN is an indicator that states the timing of the use or administration of the medicine, vaccine or other therapeutic good
         * is dependent, within limits, on the conditions or symptoms of the subject of care.
         * 
         */
        .prn( Boolean.TRUE )
        
        .medicationInstruction( uuidRoot("instructionId") )
        
             
        .startCriterion( new PrecisionDate() ) //start from now
        .stopCriterion( new PrecisionDate(Precision.DAY, twoWeeks ) )  //stop in two weeks
        .setTimingDescription( "Snomed code to describe timing" )
        
        
        .addStructuredTime( onceADay )
        .addStructuredTime( betweenNowAndTwoWeeks ) 
            
    
        .methodCode( new SNOMED_AU_Code( "260734004", "MedicationDeliveryMethod" ) )
        .routeCode( new SNOMED_AU_Code( "260734004", "SampleRouteCode" ) )
        .approachSiteCode( new SNOMED_AU_Code( "260734004", "AnatomicalSite" ) )
        
        
        
        .dispenseQuantity( dispenseQuantity )
        .dispensItemIdentifier( uuidRoot("dispenseIdentifier" ) )
        
        /**
         * Important note:
          
           PbsAuthorityPrescriptionNumber should NOT be populated if:
            (i)
            1 the Medical Benefit Category type is PBS; and
            2 the item is not listed as �Authority Required�, 'Authority Required (Streamlined)', or an application to increase the maximum quantity and/or repeats has not been approved; or
            (ii) the Medical Benefit Category type is neither PBS nor RPBS.
         */
        .pbsAuthorityPrescriptionNumber( new PbsAuthorityPrescriptionNumber( "my PBS authority prescription approval Number " )   )
        .pbsAuthorityApprovalNumber( UniqueIdentifierImpl.createSimpleIdentifier("1.2.36.1.5001.1.1.3.2.3", "Some PBS/RPBS Authority Approval Number") )
        .pbsRpbsManufacturerCode(  UniqueIdentifierImpl.createSimpleIdentifier("1.1.1.1.1.1.1.1", "The PBSRPBS Manufacturer Code") )
        .streamlinedAuthorityApprovalNumber( new StreamlinedAuthorityApprovalNumber( "my streamlined authority approval Number " )   )
        .stateAuthorityNumber( uuidRoot("my state auth number") )
        .additionalComments( additionalComments )
        
        .extemporaneousIngredient( glucose10mg )
        .extemporaneousIngredient( salt5mg )
        
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

		

        //optional alternative, but not recommended
        //Logo logo = new Logo( new File("logo.png"), IntegerityCheckType.SHA_256 );
		
		PrescriptionRequestContent prescriptionRequestContent = new PrescriptionRequestContentImpl( prescriberInstructionDetail, prescriptionRequestItem );
		RequesterNote requesterNote =new RequesterNoteImpl( "Requester Note" );
		prescriptionRequestContent.setRequesterNote( requesterNote );
		
		
		
		
		
		// Create Prescription Request
		PrescriptionRequest prescriptionRequest = new PrescriptionRequestImpl( prescriptionRequestContext, prescriptionRequestContent );

		// Create CDA Model
		String assignedAuthorId = UUID.randomUUID().toString();//"ASSIGNED AUTHOR ID UUID";
		String prescriberInstructionAssignedAuthorId = UUID.randomUUID().toString();//"PRESCRIBER INSTRUCTION ASSIGNED AUTHOR ID UUID";
		
		
		//this needs to match CGT check digit for schematron to work
		//target date 2012 10 02 14 51 03
		DateTime prescriberInstructionTime = DateTimeFormat.forPattern("yyyyMMddHHmm").parseDateTime("200910201235");
		
		String prescriberInstructionRecipient = UUID.randomUUID().toString();//"PRESCRIBER INSTRUCTION RECIPIENT PARTICIPANT ID UUID";
		// final Date prescriberInstructionRecipientParticipantId = new
		// Date(System.currentTimeMillis());

		BaseClinicalDocument cdaClinicalDocument = ClinicalDocumentFactory.getPrescriptionRequest();
		cdaClinicalDocument.setLanguageCode( "en-AU" );
		cdaClinicalDocument.setVersionNumber( 1 );
		cdaClinicalDocument.setSetId( UUID.randomUUID().toString() );
		
		// as an example we can add another template if needed.
        cdaClinicalDocument.addTemplateId( TemplateIdImpl.getInstance( "1.0", "1.2.36.1.2001.1001.100.149" ) );

		// Legal Authenticator
		AsEntityIdentifier authenticatorIdentifier = new HPII("8003610000001145");

		PersonName cdaLegalAuthenticatorAssignedEntityPersonName = PersonNameImpl.getInstance( "Black", "Jane", NameTitle.MRS.getDescriptor(), NameSuffix.JUNIOR.getDescriptor(), PersonNameUsage.REGISTERED_NAME_OR_LEGAL_NAME );

		Person cdaLegalAuthenticatorAssignedEntityPerson = PersonImpl.getInstance( authenticatorIdentifier, cdaLegalAuthenticatorAssignedEntityPersonName );

		AsEntityIdentifier authenticatorOrganisationId = new HPIO("8003621231167886");

		Organization legalAuthenticatorOrganisation = OrganizationImpl.getInstance( authenticatorOrganisationId,"Primary Healthcare Clinic Name");

		AssignedEntity authenticatorAssignedEntity = AssignedEntityImpl.getInstance(
		        UUID.randomUUID().toString(),
		        cdaLegalAuthenticatorAssignedEntityPerson,
				legalAuthenticatorOrganisation );

		Code cdaLegalAuthenticatorAssignedEntityCode = new CodeImpl( "251513" );
		cdaLegalAuthenticatorAssignedEntityCode.setCodeSystem( "1.2.36.1.2001.1001.101.103.10289" );
		cdaLegalAuthenticatorAssignedEntityCode.setCodeSystemName( "Occupation (METeOR NHDD V14)" );
		cdaLegalAuthenticatorAssignedEntityCode.setDisplayName( "Retail Pharmacist" );
		authenticatorAssignedEntity.setCode( cdaLegalAuthenticatorAssignedEntityCode );

		
		AustralianAddress authenticatorAddress = new AustralianAddressImpl();
		authenticatorAddress.addUnstructuredAddressLine( "10 Browning Street" );
		authenticatorAddress.setState( "QLD" );
		authenticatorAddress.setCountry( "Australia" );
		 PostalAddress authenticatorPostalAddress = new PostalAddressImpl(authenticatorAddress , PostalAddressUseEnum.POSTAL_ADDRESS);
		authenticatorAssignedEntity.setAddress( Arrays.asList( authenticatorPostalAddress ) );

		Telecom authenticatorEmail = new TelecomImpl(TelecomMedium.EMAIL, "sample@example.com.au", TelecomUse.BUSINESS);
		authenticatorAssignedEntity.setTelecom( Arrays.asList( authenticatorEmail ) );

		LegalAuthenticator cdaLegalAuthenticator = LegalAuthenticatorImpl.getInstance( new DateTime(), authenticatorAssignedEntity );

		// Custodian
		AsEntityIdentifier custodianHPIO = new HPIO( "8003621231167886" );
		Telecom custodianPH = new TelecomImpl( "0712341234", TelecomUse.BUSINESS);

		
		Address custodianAddress = new AustralianAddressImpl();
		custodianAddress.addUnstructuredAddressLine( "99 Clinician Street" );
		custodianAddress.setCity( "Nehtaville" );
		custodianAddress.setState( "QLD" );
		custodianAddress.setPostcode( "5555" );
		custodianAddress.setAdditionalLocator( "32568931" );
		PostalAddress custodianPostalAddress = new PostalAddressImpl(custodianAddress, PostalAddressUseEnum.HOME_ADDRESS );
        
		
		UniqueIdentifier id = new UniqueIdentifierImpl(UUID.randomUUID().toString());
		CustodianOrganization custodianOrganization = CustodianOrganizationImpl.getInstance( Arrays.asList( id ), custodianHPIO );
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

		 // You can also use the conversion tool
        String doucmentUUID = UUID.randomUUID().toString();
        String documentIdAsAnOid =  UUIDTool.uuidToOid(doucmentUUID );
        String prescriptionDocumentId=documentIdAsAnOid;
        
        cdaClinicalDocument.setClinicalDocumentId( prescriptionDocumentId );
		
		
		PrescriptionRequestCreator prescriptionRequestCreator = new PrescriptionRequestCreator( prescriptionRequestCdaModel, prescriptionRequest );

        Document clinicalDocument = null;
        //disabled
        //prescriptionRequestCreator.create();

        String cdaString = TestHelper.documentToXML( clinicalDocument );
        TestHelper.printToFile( cdaString, DOCUMENT_FILE_NAME);
        System.out.println( cdaString );
	    }

	   
}

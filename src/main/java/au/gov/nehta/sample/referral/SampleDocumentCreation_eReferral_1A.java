package referral;

import au.gov.nehta.builder.ereferral.EReferralCreator;
import au.gov.nehta.builder.ereferral.ReferralAuthor;
import au.gov.nehta.builder.ereferral.ReferralAuthorImpl;
import au.gov.nehta.builder.ereferral.ReferralDocument;
import au.gov.nehta.builder.ereferral.ReferralDocumentImpl;
import au.gov.nehta.builder.ereferral.ReferralModel;
import au.gov.nehta.builder.ereferral.ReferralModelImpl;
import au.gov.nehta.builder.ereferral.ReferralParticipant;
import au.gov.nehta.builder.ereferral.ReferralParticipantImpl;
import au.gov.nehta.builder.util.UUIDTool;
import au.gov.nehta.model.cda.common.address.PostalAddressImpl;
import au.gov.nehta.model.cda.common.address.PostalAddressUseEnum;
import au.gov.nehta.model.cda.common.code.CodeImpl;
import au.gov.nehta.model.cda.common.code.DocumentStatusCode;
import au.gov.nehta.model.cda.common.custodian.AssignedCustodian;
import au.gov.nehta.model.cda.common.custodian.AssignedCustodianImpl;
import au.gov.nehta.model.cda.common.custodian.Custodian;
import au.gov.nehta.model.cda.common.custodian.CustodianImpl;
import au.gov.nehta.model.cda.common.custodian.CustodianOrganization;
import au.gov.nehta.model.cda.common.custodian.CustodianOrganizationImpl;
import au.gov.nehta.model.cda.common.document.ClinicalDocument;
import au.gov.nehta.model.cda.common.document.ClinicalDocumentFactory;
import au.gov.nehta.model.cda.common.id.AsEntityIdentifier;
import au.gov.nehta.model.cda.common.id.MedicareCardIdentifier;
import au.gov.nehta.model.cda.common.id.TemplateIdImpl;
import au.gov.nehta.model.cda.common.org.OrganizationName;
import au.gov.nehta.model.cda.common.org.OrganizationNameImpl;
import au.gov.nehta.model.cda.common.telecom.Telecom;
import au.gov.nehta.model.cda.common.telecom.TelecomImpl;
import au.gov.nehta.model.cda.common.telecom.TelecomMedium;
import au.gov.nehta.model.cda.common.telecom.TelecomUse;
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
import au.gov.nehta.model.clinical.common.participation.Organisation;
import au.gov.nehta.model.clinical.common.participation.OrganisationImpl;
import au.gov.nehta.model.clinical.common.participation.OrganisationNameUsage;
import au.gov.nehta.model.clinical.common.participation.PersonName;
import au.gov.nehta.model.clinical.common.participation.PersonNameImpl;
import au.gov.nehta.model.clinical.common.participation.PersonNameUsage;
import au.gov.nehta.model.clinical.common.participation.Sex;
import au.gov.nehta.model.clinical.common.types.HPII;
import au.gov.nehta.model.clinical.common.types.HPIO;
import au.gov.nehta.model.clinical.common.types.IHI;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifierImpl;
import au.gov.nehta.model.clinical.diagnostic.pathology.EmploymentOrganisationImpl;
import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;
import au.gov.nehta.model.clinical.etp.common.participation.AddressContext;
import au.gov.nehta.model.clinical.etp.common.participation.ProviderAddress;
import au.gov.nehta.model.clinical.etp.common.participation.ProviderAddressImpl;
import au.gov.nehta.model.clinical.etp.common.participation.ProviderEmploymentDetail;
import au.gov.nehta.model.clinical.etp.common.participation.ProviderEmploymentDetailImpl;
import au.gov.nehta.model.clinical.etp.common.participation.ProviderPerson;
import au.gov.nehta.model.clinical.etp.common.participation.ProviderPersonImpl;
import au.gov.nehta.model.schematron.SchematronResource.SchematronResources;
import au.gov.nehta.model.schematron.SchematronValidationException;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;
import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.joda.time.DateTime;
import org.joda.time.LocalDate;
import org.w3c.dom.Document;

/**
 * This Sample code show use of the CDA Library to create an e-Referral document
 * conformant to level 1A.  
 * 
 *
 */
public class SampleDocumentCreation_eReferral_1A {
	public static void main(String[] args) throws ParserConfigurationException, JAXBException, SchematronValidationException {
		String documentID = UUID.randomUUID().toString();

		// ***************************
		// ***** Subject Of Care *****
		// ***************************

		IHI subjectIHI = new IHI("8003600300001283");

		String subjectFamilyName = "Harding";
		DateTime dob = new LocalDate(1982, 11, 28).toDateTimeAtStartOfDay();

		AustralianAddress patientAddress = new AustralianAddressImpl();
		patientAddress.addUnstructuredAddressLine("10 browning st");
		patientAddress.setCity("West End");
		patientAddress.setState(AustralianStateTerritory.QUEENSLAND
				.getAbbreviation());
		patientAddress.setPostcode("4101");
		AddressContext subjectOfCareAddress = new AddressContextImpl(patientAddress, AddressPurpose.RESIDENTIAL_PERMANENT);

		PersonName subjectPersonName = new PersonNameImpl(subjectFamilyName);
		subjectPersonName.addGivenName("Frank");
		subjectPersonName.addNameTitle(NameTitle.MISTER.getDescriptor());
		subjectPersonName.addNameSuffix(NameSuffix.JUNIOR.getDescriptor());
		subjectPersonName.addPersonNameUsage(PersonNameUsage.REGISTERED_NAME_OR_LEGAL_NAME);

		DateAccuracy dobAccuracy = new DateAccuracyImpl(
				/* Day Accuracy*/ true, 
		/* Month Accuracy*/ true,
		/* Year Accuracy*/true );
		
		DateOfBirthDetail subjectDOB = new DateOfBirthDetailImpl( dob, dobAccuracy );
		subjectDOB.setDateOfBirthAccuracyIndicator( dobAccuracy );
		subjectDOB.setDateOfBirthIsCalculatedFromAge( true );
		
		SubjectOfCareDemographicData demoData = new SubjectOfCareDemographicDataImpl( Sex.MALE, subjectDOB );
		
		demoData.setBirthPlurality( 5 );
		demoData.setBirthOrder( 2 );
		int age = 31;
		demoData.setAgeInYears( age );
		demoData.setAgeAccurate( true );
		demoData.setIndigenousStatus( IndigenousStatus.NOT_STATED_OR_INADEQUATELY_DESCRIBED );
		
		SubjectOfCarePerson subjectOfCarePerson = new SubjectOfCarePersonImpl( subjectPersonName, demoData );
		MedicareCardIdentifier medicareCard = new MedicareCardIdentifier( "4324567871" );
		SubjectOfCareParticipant subject = new SubjectOfCareParticipantImpl( Arrays.asList( subjectIHI, medicareCard ), subjectOfCareAddress, subjectOfCarePerson );
		
		Telecom subjectTelephone = new TelecomImpl( TelecomMedium.TELEPHONE, "0712345678", TelecomUse.PERSONAL );
		Telecom subjectEmail = new TelecomImpl( TelecomMedium.EMAIL, "frank.harding@electronichealth.net.au", TelecomUse.PERSONAL );
		
		List<Telecom> subjectOfCareElectronicCommunicationDetails = new ArrayList<Telecom>();
		subjectOfCareElectronicCommunicationDetails.add( subjectTelephone );
		subjectOfCareElectronicCommunicationDetails.add( subjectEmail );
		
		subject.setElectronicCommunicationDetails( subjectOfCareElectronicCommunicationDetails );
		
		
		
		// ************************
		// ******** Author ********
		// ************************
		HPII authorHPII = new HPII( "8003610000001145" );
		
		
		PersonName authorName = new PersonNameImpl( "Practicioner" );
		authorName.addGivenName( "Gerry" );
		authorName.addGivenName( "Medical" );
		authorName.addNameTitle( NameTitle.MISTER.getDescriptor() );
		authorName.addNameTitle( NameTitle.PROFESSOR.getDescriptor() );
		authorName.addNameSuffix( NameSuffix.MEMBER_OF_PARLIAMENT.getDescriptor());
		authorName.addNameSuffix( NameSuffix.FIRST.getDescriptor());
		
		
		
		ProviderPerson authorPerson = new ProviderPersonImpl( authorName );
		
		
		AustralianAddress address = new AustralianAddressImpl();
		address.addUnstructuredAddressLine( "Level 1, 10 Browning street" );
		address.setCity( "West End" );
		address.setState( AustralianStateTerritory.QUEENSLAND.getAbbreviation() );
		address.setPostcode( "4101" );
		ProviderAddress authorOrganisationAddress = new ProviderAddressImpl( false, address, AddressPurpose.BUSINESS );
		
		Telecom authorEmail = new TelecomImpl( TelecomMedium.EMAIL, "info@some-gp.com.au", TelecomUse.BUSINESS );
		Telecom authorFax = new TelecomImpl( TelecomMedium.FAX, "0212345678", TelecomUse.BUSINESS );
		Telecom authorTelephone = new TelecomImpl( TelecomMedium.TELEPHONE, "0212345679", TelecomUse.BUSINESS );
		
		
	    List<Telecom> electronicCommunicationDetailList = Arrays.asList( authorEmail, authorFax, authorTelephone );
	    

        EmploymentOrganisationImpl gpJob = new EmploymentOrganisationImpl( Arrays.asList( new HPIO("8003621231167886")), "Sam's Specialist Clinic" );
        gpJob.setOrganisationNameUsage( OrganisationNameUsage.BUSINESS_NAME );
        gpJob.setEmploymentType( CodeImpl.fromOriginalText( "Permanent/Full Time" ));
        gpJob.setDepartmentUnit( "Clinic" );
        gpJob.setPositionInOrganisation( CodeImpl.fromOriginalText("Staff Doctor") );
        gpJob.setOccupation(  ANZSCO_1ED_2006.GENERAL_MEDICAL_PRACTITIONER );
	    
	    
	    ReferralAuthor author = new ReferralAuthorImpl( authorHPII,authorPerson,  ANZSCO_1ED_2006.GENERAL_MEDICAL_PRACTITIONER,gpJob);
		    
		    
		   
		    
		author.setQualifications( "M.B.B.S., F.R.A.C.S." );
		author.setAddress(authorOrganisationAddress);
		author.setElectronicCommunicationDetail(electronicCommunicationDetailList);
		
		// ************************
		// ******  Referee  *******
		// ************************
		//Provider Idenitifer
		HPII refereeHPII = new HPII("8003610000001145");
		
		//Provider Organisation Identifier
		HPIO refereeHPIO = new HPIO("8003620000045562"); 
		
		//only surname is mandatory
		PersonName referrName = new PersonNameImpl("SpecialistSurname");
		referrName.addPersonNameUsage(PersonNameUsage.REGISTERED_NAME_OR_LEGAL_NAME);
		ProviderPerson particpantPerson = new ProviderPersonImpl(referrName );
		
		ProviderEmploymentDetail employmentDetails = new ProviderEmploymentDetailImpl(ANZSCO_1ED_2006.GENERAL_MEDICAL_PRACTITIONER  );
		particpantPerson.setEmploymentDetail(employmentDetails );
		
		
		AustralianAddress refereeAddress = new AustralianAddressImpl();
		refereeAddress.addUnstructuredAddressLine( "The Melbourne" );
		refereeAddress.addUnstructuredAddressLine( "10 Browning St" );
		refereeAddress.setCity( "West End" );
		refereeAddress.setState( AustralianStateTerritory.QUEENSLAND.getAbbreviation() );
		refereeAddress.setPostcode( "4101" );
		ProviderAddress refereeProviderAddress = new ProviderAddressImpl( false, refereeAddress, AddressPurpose.BUSINESS );
		
		
		Telecom participantFax = new TelecomImpl( TelecomMedium.FAX, "0212345678", TelecomUse.BUSINESS );
		Telecom participantTelephone = new TelecomImpl( TelecomMedium.TELEPHONE, "0212345678", TelecomUse.BUSINESS );
		List<Telecom> refereeTelecoms = Arrays.asList( participantFax, participantTelephone );
		
		Organisation refereeOrg = new OrganisationImpl("Sam's Specialist Clinic");
		ReferralParticipant referee = new ReferralParticipantImpl(
				refereeHPII,
				referrName,
				refereeProviderAddress,
				refereeTelecoms,
				refereeHPIO,
				refereeOrg
				);
		
		// *********************
		// ***** Custodian *****
		// *********************
		
		AsEntityIdentifier custodianIdentifier = new HPIO( "8003621231167886" );
		Telecom contact = new TelecomImpl( TelecomMedium.EMAIL, "example@custodian.com.au", TelecomUse.BUSINESS );
		
		AustralianAddress custodianAddress = new AustralianAddressImpl();
		custodianAddress.addUnstructuredAddressLine( "99 Clinician Street" );
		custodianAddress.setCity( "Nehtaville" );
		custodianAddress.setState( "QLD" );
		custodianAddress.setPostcode( "5555" );
		custodianAddress.setAdditionalLocator( "32568931" );
		
		UniqueIdentifier typedDocumentID = new UniqueIdentifierImpl( documentID );
		CustodianOrganization custodianOrganization = CustodianOrganizationImpl.getInstance( Arrays.asList( typedDocumentID ), custodianIdentifier );
		
		OrganizationName custodianOrganizationName = new OrganizationNameImpl( "Custodian organisation" );
		
		custodianOrganization.setName( custodianOrganizationName );
		custodianOrganization.setTelecom( contact );
		custodianOrganization.setAddress( new PostalAddressImpl( custodianAddress, PostalAddressUseEnum.POSTAL_ADDRESS ) );
		
		AssignedCustodian assignedCustodian = AssignedCustodianImpl.getInstance( custodianOrganization );
		Custodian custodian = CustodianImpl.getInstance( assignedCustodian );
		
		// *****************************
		// ***** Attached Referral *****
		// *****************************
		
		AttachedMedia attachment = new AttachedMedia(new File("src/test/resources/ReferralDocument.pdf"));
		ReferralDocument refDocument = new ReferralDocumentImpl(attachment );
		
		// *****************************
		// ***** Clinical Document *****
		// *****************************
		
		ClinicalDocument document = ClinicalDocumentFactory.getEReferral();
		document.setSetId( documentID );
		
		// we can set the document number to something other than 1 if required
		document.setVersionNumber( 1 );
		
		//as an example we can add another template if needed.
		//this template indicates CDA Rendering is possible with  
		//NEHTA_Generic_CDA_Stylesheet.xsl
		document.addTemplateId( TemplateIdImpl.getInstance( "1.0", "1.2.36.1.2001.1001.100.149" ) );
		document.setCompletionCode( DocumentStatusCode.FINAL );
		
		
		// String documentId =
		// "2.25.36901752580752676809846395044082807160"; 
		//must be an OID to pass into PCEHR
		
		// You can also use the conversion tool
		String doucmentUUID = UUID.randomUUID().toString();
		String documentIdAsAnOid = UUIDTool.uuidToOid( doucmentUUID );
		
		document.setClinicalDocumentId( documentIdAsAnOid );
		
		//all model objects combined
		ReferralModel model =  new ReferralModelImpl(document, subject, author, referee , custodian);
		
		
		EReferralCreator eReferralCreator = new EReferralCreator( model, refDocument );
		
		//useStrict() does Schematron checking when creating
		//this is useful  for finding bugs in development
		//and can then be turned off for production performance
		eReferralCreator.setSchematronResource( SchematronResources.E_REFERRAL_1A.resource());
		eReferralCreator.useStrict();
		
		
		Document clinicalDocument = eReferralCreator.create();
		
		String cdaString = documentToXML( clinicalDocument );
		printToFile( cdaString, "eReferral1A.xml" );
		System.out.println( cdaString );     
	}
	
	  /**
     * print the string to a file
     */
    public static final void printToFile( String s,  String fileName) {
        FileOutputStream fs = null;
       
        try {
            fs = new FileOutputStream( new File(fileName) );
            fs.write( s.getBytes() );
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if (fs != null) {
                try {
                    fs.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    /**
     * Convert a Document to a String
     */
    public static final String documentToXML( Document clinicalDocument ) {
        String cdaXml="";
        try {
            
            TransformerFactory factory = TransformerFactory.newInstance();
            Transformer transformer = factory.newTransformer();
            transformer.setOutputProperty( OutputKeys.OMIT_XML_DECLARATION, "no" );
            transformer.setOutputProperty( OutputKeys.INDENT, "yes" );
            
            StringWriter writer = new StringWriter();
            StreamResult result = new StreamResult( writer );
            
            DOMSource domSource = new DOMSource( clinicalDocument );
            transformer.transform( domSource, result );
            
            writer.flush();
            writer.close();
            cdaXml = writer.toString();
        
        } catch (Exception e) {
            e.printStackTrace(); 
        }
        return cdaXml;
    }
}

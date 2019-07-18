package au.gov.nehta.builder.diagnostic.pathology;

import java.util.List;

import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;

import au.gov.nehta.builder.common.ClinicalModelConverter;
import au.gov.nehta.builder.common.EntryCreator;
import au.gov.nehta.builder.common.HeaderUtil;
import au.gov.nehta.builder.common.SectionEntryCodeSet;
import au.gov.nehta.builder.common.StructuredBodyUtil;
import au.gov.nehta.builder.util.AddressConverter;
import au.gov.nehta.builder.util.CDATypeUtil;
import au.gov.nehta.builder.util.ClinicalDocumentCreator;
import au.gov.nehta.builder.util.Converter;
import au.gov.nehta.builder.util.CreatorUtil;
import au.gov.nehta.model.cda.diagnostic.PathologyReportCdaModel;
import au.gov.nehta.model.clinical.common.ExtendedDemographicData;
import au.gov.nehta.model.clinical.common.ExtendedSubjectOfCarePerson;
import au.gov.nehta.model.clinical.common.SubjectOfCareDemographicData;
import au.gov.nehta.model.clinical.common.SubjectOfCareParticipant;
import au.gov.nehta.model.clinical.common.SubjectOfCarePerson;
import au.gov.nehta.model.clinical.common.participation.DateAccuracy;
import au.gov.nehta.model.clinical.common.participation.DateOfDeath;
import au.gov.nehta.model.clinical.diagnostic.pathology.AuthorParticipant;
import au.gov.nehta.model.clinical.diagnostic.pathology.DocumentParticipant;
import au.gov.nehta.model.clinical.diagnostic.pathology.PathologyReportContent;
import au.gov.nehta.model.clinical.diagnostic.pathology.PathologyReportContext;
import au.gov.nehta.model.clinical.diagnostic.pathology.PathologyResult;
import au.gov.nehta.model.clinical.diagnostic.pathology.PathologyResultReport;
import au.gov.nehta.model.clinical.etp.common.item.Logo;
import au.gov.nehta.model.clinical.etp.common.participation.AddressContext;
import au.gov.nehta.model.clinical.etp.common.participation.Entitlement;
import au.gov.nehta.model.schematron.SchematronResource.SchematronResources;
import au.gov.nehta.model.schematron.SchematronValidationException;
import au.net.electronichealth.ns.cda._2_0.ActClass;
import au.net.electronichealth.ns.cda._2_0.ActClassRoot;
import au.net.electronichealth.ns.cda._2_0.ActMood;
import au.net.electronichealth.ns.cda._2_0.ActRelationshipFulfills;
import au.net.electronichealth.ns.cda._2_0.ActRelationshipHasComponent;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Author;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040ClinicalDocument;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Component2;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Component3;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Component5;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Entry;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040InFulfillmentOf;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Order;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Patient;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040PatientRole;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Person;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040RecordTarget;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Section;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040StructuredBody;
import au.net.electronichealth.ns.cda._2_0.ParticipationType;
import au.net.electronichealth.ns.cda._2_0.RoleClass;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import au.net.electronichealth.ns.ci.cda.extensions._3.Coverage2;

public class PathologyReportCreator extends ClinicalDocumentCreator {
    
	private static final String PATHOLOGY_TEST_RESULT = "Pathology Test Result";

    private static final String PATHOLOGY_TITLE = "Pathology";

    private static final String ADMINISTRATIVE_OBSERVATIONS_SECTION_TITLE = "Administrative Observations";


	private PathologyReportCdaModel cdaModel;
	private PathologyResultReport clinicalModel;

	public PathologyReportCreator( PathologyReportCdaModel cdaModel, PathologyResultReport clinicalModel  ) {
		this.cdaModel = cdaModel;
		this.clinicalModel=clinicalModel;
		
		//for schematron checking
        this.resource = SchematronResources.PATHOLOGY_REPORT_3B.resource();
		  
	}

	/**
	 * add the NeHTA Generic Stylesheet as an xml processing instruction  
	 */
	public void addStyleSheet(Document doc) {
		addStylesheet( "NEHTA_Generic_CDA_Stylesheet.xsl", doc); 
	}

	/**
	 * @return
	 * @throws ParserConfigurationException
	 * @throws JAXBException
	 * @throws SchematronValidationException 
	 */
	public Document create() throws ParserConfigurationException, JAXBException, SchematronValidationException {
		// Construct clinical document with headers
		POCDMT000040ClinicalDocument clinicalDocument = HeaderUtil.createClinicalDocument( cdaModel.getBaseClinicalDocument() );
		clinicalDocument.setCode( SectionEntryCodeSet.PATHOLOGY_RESULT_REPORT);
		clinicalDocument.setCompletionCode( Converter.convertToCECode( cdaModel.getCompletionClinicalDoucment().getCompletionCode() ) );

		// Construct Legal Authenticator
		if(cdaModel.getLegalAuthenticator() != null){
		    clinicalDocument.setLegalAuthenticator( HeaderUtil.createLegalAuthenticator( cdaModel.getLegalAuthenticator() ) );
		}
		
		
		// Construct Custodian
		clinicalDocument.setCustodian( HeaderUtil.createCustodian( this.cdaModel.getCustodian().getAssignedCustodian().getRepresentedCustodianOrganization() ) );
		
		// Construct the Requester (EntitledParticipant)
		clinicalDocument.getParticipant().add( HeaderUtil.createParticipant( this.clinicalModel.getContext().getRequester() ));

		// Construct Author (Prescriber)
		POCDMT000040Author clinicalDocumentAuthor = getDocumentAuthor();
		clinicalDocument.getAuthor().add( clinicalDocumentAuthor );

		
		//order detials
		clinicalDocument.getInFulfillmentOf().add( getInFulFillment() );
		
		// Construct Record Target
		clinicalDocument.getRecordTarget().add( createRecordTarget( clinicalModel.getContext().getSubjectOfCare() ) );

		clinicalDocument.setComponent( getStructuredBody( ) );
		Document doc = CreatorUtil.convertClinicalDocumentToDomDocument( clinicalDocument );
		
		
		
		
		 //If strict checking is enabled, check this document.
        if(isStrict()){
            check( doc );
        }
        
		return doc;
	}
	
	// extended Subject Of Care
    public static POCDMT000040RecordTarget createRecordTarget( SubjectOfCareParticipant subjectOfCareParticipant ) {
        String patientRoleId = subjectOfCareParticipant.getPatientRoleId();
        
        POCDMT000040RecordTarget recordTarget = new POCDMT000040RecordTarget();

        recordTarget.setTypeCode( ParticipationType.RCT );

        POCDMT000040Patient patient = new POCDMT000040Patient();

        patient.getAsEntityIdentifier().addAll( Converter.getAsEntityIdentifier( subjectOfCareParticipant.getEntityIdentifiers() ) );
        
        SubjectOfCarePerson person = subjectOfCareParticipant.getPerson();
        
        HeaderUtil.mapSOCPerson( patient, person );
        
        if(person instanceof ExtendedSubjectOfCarePerson){
        	HeaderUtil.mapPersonExtensions( patient, (ExtendedSubjectOfCarePerson)person );
        } 
        
         
        POCDMT000040PatientRole patientRole = new POCDMT000040PatientRole();
         
        patientRole.setClassCode( RoleClass.PAT );
        patientRole.getId().add( CDATypeUtil.getII( patientRoleId ) );
        patientRole.setPatient( patient );
        for(AddressContext ctx: subjectOfCareParticipant.getAddresses()){
        	patientRole.getAddr().add( AddressConverter.convert( ctx ) );
        }
        if (subjectOfCareParticipant.getElectronicCommunicationDetail() != null) {
            patientRole.getTelecom().addAll( Converter.convert( subjectOfCareParticipant.getElectronicCommunicationDetail() ) );
        }

        recordTarget.setPatientRole( patientRole );

        return recordTarget;
    }

	

    private POCDMT000040InFulfillmentOf getInFulFillment() {
        PathologyReportContext context = this.clinicalModel.getContext();
        if (context == null || context.getOrderDetails() == null)
        {
            return null;
        }
            
        POCDMT000040InFulfillmentOf fulfillment = new POCDMT000040InFulfillmentOf();
        fulfillment.setTypeCode( ActRelationshipFulfills.FLFS );
        POCDMT000040Order order = new POCDMT000040Order();
        order.setCode(Converter.convertToCECode( context.getOrderDetails().getOrder() ));
        order.setClassCode( ActClassRoot.ACT );
        order.setMoodCode( ActMood.RQO );
        if(context.getOrderDetails().getId() != null){
            order.getId().add( Converter.getII( context.getOrderDetails().getId() )  );
        }
        fulfillment.setOrder( order );
        
        return fulfillment;
    }

    private POCDMT000040Author getDocumentAuthor() {
		DocumentParticipant authorParticipation = this.clinicalModel.getContext().getAuthor();
		AuthorParticipant authorParticipant = this.clinicalModel.getContext().getAuthor().getParticipant();
		
	 
	    POCDMT000040Person authorParticipantPerson = ClinicalModelConverter.getAuthorPerson( authorParticipant );
	    POCDMT000040Author author= HeaderUtil.createAuthorWithTime( 
        		authorParticipant.getAssignedAuthorId(), 
                authorParticipation.getRole(), 
                authorParticipant.getAddresses(),
                authorParticipant.getElectronicCommunicationDetail(), 
                authorParticipantPerson,
                this.cdaModel.getAuthorTime()
                );
	 
		return author;
	}
    
    private POCDMT000040Author getReportingPathologist(DocumentParticipant reportingPathologist){
        POCDMT000040Author author=null;
        
        if( reportingPathologist !=null
                && reportingPathologist.getParticipant() != null
                ){
        
        POCDMT000040Person authorParticipantPerson = ClinicalModelConverter.getAuthorPerson( reportingPathologist.getParticipant() );
         author= HeaderUtil.createAuthorWithTime( 
        		 reportingPathologist.getParticipant().getAssignedAuthorId(), 
                reportingPathologist.getRole(), 
                reportingPathologist.getParticipant().getAddresses(),
                reportingPathologist.getParticipant().getElectronicCommunicationDetail(), 
                authorParticipantPerson,
                this.cdaModel.getAuthorTime()
                );
     
        }
        return author;
    }
    
   

	private POCDMT000040Component2 getStructuredBody(  ) {
		POCDMT000040Component2 structuredBodyComponent = new POCDMT000040Component2();
	
		POCDMT000040StructuredBody structuredBody = new POCDMT000040StructuredBody();
		
		 
		structuredBody.getComponent().add( getPathologySection() );
		

		// Administrative Observations
		structuredBody.getComponent().add( getAdministrativeObservationsSection() );
		
		
		Logo logo = clinicalModel.getContext().getLogo();
        if(logo != null){
	       structuredBody.getComponent().add( EntryCreator.getLogo(logo) );
		}

		structuredBodyComponent.setStructuredBody( structuredBody );
		return structuredBodyComponent;
	}



    private POCDMT000040Component3 getPathologySection() {
		POCDMT000040Component3 pathComponent = new POCDMT000040Component3();
		pathComponent.setTypeCode( ActRelationshipHasComponent.COMP );
		POCDMT000040Section pathologySection = new POCDMT000040Section();

		
		PathologyReportContext context = clinicalModel.getContext();
     

		DocumentParticipant reportingPathologist = clinicalModel.getContent().getReportingPathologist();
		if (reportingPathologist.getParticipant().getEntitlement() != null) {
			List<Coverage2> reqEntitlements = ClinicalModelConverter.getParticpantEntitlements( 
					reportingPathologist.getParticipant().getEntitlement(),
					reportingPathologist.getParticipant().getAssignedAuthorId() );
			pathologySection.getCoverage2().addAll( reqEntitlements );
		}

		PathologyReportContent content = this.clinicalModel.getContent();
        List<PathologyResult> pathologyResults = content.getPathologyResults();
		
		for(PathologyResult result:pathologyResults){
    		//pathology test result
    		POCDMT000040Component5 pathologyTestResult = new POCDMT000040Component5();
    		POCDMT000040Section testSection = new POCDMT000040Section();
    		testSection.setClassCode( ActClass.DOCSECT );
    		testSection.setMoodCode( ActMood.EVN );
    		testSection.setTitle( CDATypeUtil.getST( PATHOLOGY_TEST_RESULT  ) );
    		
            testSection.setId( Converter.getII( result.getId() ));
            testSection.setText(  PathologyReportCreatorUtil.getTestResultNarrativeBlock( result) );
            testSection.setCode( SectionEntryCodeSet.PATHOLOGY_TEST_RESULT_SECTION );
            
            //Pathology Test result
            POCDMT000040Entry testResult = EntryCreator.getPathologyTestResult(result);
            testSection.getEntry().add( testResult );
            
        
            
         
            pathologyTestResult.setSection( testSection );
            pathologySection.getComponent().add( pathologyTestResult );
		}
		
		pathologySection.setCode( SectionEntryCodeSet.PATHOLOGY_SECTION );
		pathologySection.setTitle( CDATypeUtil.getST( PATHOLOGY_TITLE ) );
		pathologySection.setText( PathologyReportCreatorUtil.getDocument( context.getAuthor()   ,content.getRelatedDocument() ) );
		pathologySection.setClassCode( ActClass.DOCSECT );
		pathologySection.setMoodCode( ActMood.EVN );
		
	     //Reporting pathologist
		pathologySection.getAuthor().add( getReportingPathologist(content.getReportingPathologist()) );
     
		pathologySection.setId( Converter.getII(  content.getId() ));
	    POCDMT000040Entry relatedDocument = EntryCreator.getPathologyDocumentEntry(content.getRelatedDocument());
        pathologySection.getEntry().add( relatedDocument );
        
		pathComponent.setSection( pathologySection );
		
		
		
		
		// Add section components to Structured Body
		return pathComponent;
	}



    private POCDMT000040Component3 getAdministrativeObservationsSection() {
		POCDMT000040Component3 administrativeObservationsSectionComponent = new POCDMT000040Component3();

		
		SubjectOfCareDemographicData subjectOfCareDemographicData = this.clinicalModel.getContext().getSubjectOfCare().getPerson().getDemographicData();

		POCDMT000040Section administrativeObservationsSection = new POCDMT000040Section();
		administrativeObservationsSection.setCode( SectionEntryCodeSet.ADMINISTRATIVE_OBSERVATIONS );
		administrativeObservationsSection.setTitle( CDATypeUtil.getST( ADMINISTRATIVE_OBSERVATIONS_SECTION_TITLE ) );

		SubjectOfCareParticipant soc = clinicalModel.getContext().getSubjectOfCare();
		List<Entitlement> subjectOfCareEntitlement = soc.getEntitlements();
		if (subjectOfCareEntitlement != null) {
			List<Coverage2> subjectOfCareEntitlements = ClinicalModelConverter
					.getSubjectOfCareEntitlements(soc);
			administrativeObservationsSection.getCoverage2().addAll(
					subjectOfCareEntitlements);
		}
		
		
		 // Administrative Observations entries
		if (subjectOfCareDemographicData != null){
		    
		
	        Boolean isSubjectOfCareDateOfBirthCalculatedFromAge = subjectOfCareDemographicData.getDateOfBirthDetail().getDateOfBirthIsCalculatedFromAge();
	        if (isSubjectOfCareDateOfBirthCalculatedFromAge != null) {
	            POCDMT000040Entry calcAgeEntry = EntryCreator.createSubjectOfCareCalcAgeEntry( isSubjectOfCareDateOfBirthCalculatedFromAge );
	            administrativeObservationsSection.getEntry().add( calcAgeEntry );
	        }

	        DateAccuracy subjectOfCareDateOfBirthAccuracyIndicator = subjectOfCareDemographicData.getDateOfBirthDetail().getDateOfBirthAccuracyIndicator();
	        if (subjectOfCareDateOfBirthAccuracyIndicator != null) {
	            POCDMT000040Entry dateOfBirthAccuracyEntry = EntryCreator.createSubjectOfCareDateOfBirthAccuracyEntry( subjectOfCareDateOfBirthAccuracyIndicator );
	            administrativeObservationsSection.getEntry().add( dateOfBirthAccuracyEntry );
	        }
	        
	        if(subjectOfCareDemographicData instanceof ExtendedDemographicData){
	            ExtendedDemographicData ext = (ExtendedDemographicData) subjectOfCareDemographicData;
    	        DateOfDeath dateOfDeath = ext.getDateOfDeath();
    	        if(dateOfDeath != null){
                    if ( dateOfDeath.getDateOfDeathAccuracyIndicator() != null ) {
                        POCDMT000040Entry dodAccuracyEntry = EntryCreator.createDeathDateAccuracyEntry( dateOfDeath.getDateOfDeathAccuracyIndicator() );
                        administrativeObservationsSection.getEntry().add( dodAccuracyEntry );
                    }
                    
                    if(dateOfDeath.getDeathNotificationSource() != null ){
                        POCDMT000040Entry dodSource = EntryCreator.createDeathSourceCodeEntry( dateOfDeath.getDeathNotificationSource()  );
                        administrativeObservationsSection.getEntry().add( dodSource );
                    }
    	        }
    	        
    	        if(ext.getMothersOriginalFamilyName() != null ){
    	            POCDMT000040Entry dodSource = EntryCreator.createMothersMaidenNameEntry( ext.getMothersOriginalFamilyName() );
                    administrativeObservationsSection.getEntry().add( dodSource );
    	        }
	        }
		    
		    
			POCDMT000040Entry ageEntry = EntryCreator.createSubjectOfCareAgeEntry( Integer.toString( subjectOfCareDemographicData.getAgeInYears()) );
			administrativeObservationsSection.getEntry().add( ageEntry );

			if (subjectOfCareDemographicData.isAgeAccurate() != null) {
				POCDMT000040Entry ageAccuracyEntry = EntryCreator.createSubjectOfCareAgeAccuracyEntry( subjectOfCareDemographicData.isAgeAccurate() );
				administrativeObservationsSection.getEntry().add( ageAccuracyEntry );
			}
			
			Integer subjectOfCareBirthPlurality = subjectOfCareDemographicData.getBirthPlurality();
	        if (subjectOfCareBirthPlurality != null) {
	            POCDMT000040Entry birthPluralityEntry = EntryCreator.createSubjectOfCareBirthPluralityEntry( subjectOfCareBirthPlurality );
	            administrativeObservationsSection.getEntry().add( birthPluralityEntry );
	        }
	        
	        // Administrative Observations narrative block
	        StrucDocText administrativeObservationsSectionNarrativeBlock =null;
	        if(subjectOfCareDemographicData instanceof ExtendedDemographicData){
	            administrativeObservationsSectionNarrativeBlock = StructuredBodyUtil.getAdministrativeObservationsNarrativeBlock( (ExtendedDemographicData)subjectOfCareDemographicData );
            }else{
    	        administrativeObservationsSectionNarrativeBlock = StructuredBodyUtil.getAdministrativeObservationsNarrativeBlock( subjectOfCareDemographicData );
            }
	        
	        administrativeObservationsSection.setText( administrativeObservationsSectionNarrativeBlock );
            administrativeObservationsSectionComponent.setSection( administrativeObservationsSection );
	       
	        
		}

		

	

		return administrativeObservationsSectionComponent;
	}
}


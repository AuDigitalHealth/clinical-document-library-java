package au.gov.nehta.builder.ereferral;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;

import au.gov.nehta.builder.common.ClinicalModelConverter;
import au.gov.nehta.builder.common.HeaderUtil;
import au.gov.nehta.builder.common.SectionEntryCodeSet;
import au.gov.nehta.builder.util.CDATypeUtil;
import au.gov.nehta.builder.util.ClinicalDocumentCreator;
import au.gov.nehta.builder.util.Converter;
import au.gov.nehta.builder.util.CreatorUtil;
import au.gov.nehta.model.clinical.common.participation.RoleImpl;
import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;
import au.gov.nehta.model.schematron.SchematronResource;
import au.gov.nehta.model.schematron.SchematronValidationException;
import au.net.electronichealth.ns.cda._2_0.ActClassObservation;
import au.net.electronichealth.ns.cda._2_0.ActMood;
import au.net.electronichealth.ns.cda._2_0.ED;
import au.net.electronichealth.ns.cda._2_0.ObjectFactory;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Author;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040ClinicalDocument;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Component2;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Component3;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Entry;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040ObservationMedia;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Person;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Section;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040StructuredBody;
import au.net.electronichealth.ns.cda._2_0.StrucDocCaption;
import au.net.electronichealth.ns.cda._2_0.StrucDocContent;
import au.net.electronichealth.ns.cda._2_0.StrucDocRenderMultiMedia;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import au.net.electronichealth.ns.cda._2_0.TEL;

public class EReferralCreator extends ClinicalDocumentCreator {


    private static final String ADMINISTRATIVE_OBSERVATIONS_SECTION_TITLE = "Administrative Observations";
    protected static final String HL7_TEXT_MEDIA_TYPE = "text/x-hl7-text+xml";
    private ReferralModel cdaModel;
    private ReferralDocument attachment;
    
    
    public EReferralCreator(  ReferralModel cdamodel, ReferralDocument attachment ) {
    	this.attachment = attachment;
		this.cdaModel = cdamodel;

    }
    
    public EReferralCreator(  ReferralModel cdamodel, ReferralDocument attachment,   SchematronResource checkLevel) {
    	this.attachment = attachment;
		this.cdaModel = cdamodel;
		

		// for schematron checking
		this.resource = checkLevel;
	}

    /**
   	 * add the NeHTA Generic Stylesheet as an xml processing instruction  
   	 */
   	public void addStyleSheet(Document doc) {
   		addStylesheet( "NEHTA_Generic_CDA_Stylesheet.xsl", doc); 
   	}

   	/**
   	 * Create the Clinical Document
   	 * @throws ParserConfigurationException
   	 * @throws JAXBException
   	 * @throws SchematronValidationException 
   	 */
   	public Document create() throws ParserConfigurationException, JAXBException, SchematronValidationException {
   		POCDMT000040ClinicalDocument clinicalDocument = HeaderUtil.createClinicalDocument( cdaModel.getBaseClinicalDocument() );
        
        clinicalDocument.setCode( SectionEntryCodeSet.EREFERRAL_DOCUMENT );
        clinicalDocument.setCompletionCode( Converter.convertToCECode( cdaModel.getClinicalDocument().getCompletionCode() ) );
        
      
        // Construct Custodian
        clinicalDocument.setCustodian( HeaderUtil.createCustodian( cdaModel.getCustodian().getAssignedCustodian().getRepresentedCustodianOrganization() ) );


        // Construct Author (Prescriber)
        POCDMT000040Author clinicalDocumentAuthor = getAuthor();
        clinicalDocument.getAuthor().add( clinicalDocumentAuthor );

       
        // Construct Record Target
        clinicalDocument.getRecordTarget().add( HeaderUtil.createRecordTarget(  cdaModel.getSubjectOfCare() ) );
        clinicalDocument.setComponent( getStructuredBody() );
        
        clinicalDocument.getParticipant().add(HeaderUtil.createParticipant(cdaModel.getReferee()));
        Document doc = CreatorUtil.convertClinicalDocumentToDomDocument( clinicalDocument );

        // If strict checking is enabled, check this document.
        if (isStrict()) {
            check( doc );
        }

        return doc;
    }

    private POCDMT000040Component2 getStructuredBody() {
    	ObjectFactory objectFactory = new ObjectFactory();
    	POCDMT000040Component2 component = new POCDMT000040Component2();
    	POCDMT000040StructuredBody body = new POCDMT000040StructuredBody();
		
    	 
    	POCDMT000040Component3 bodyComponent = new POCDMT000040Component3();
    	POCDMT000040Section section = new POCDMT000040Section();
    	section.setTitle(CDATypeUtil.getST("Attached Content"));
    	StrucDocText narrative = new StrucDocText();
    	narrative.setMediaType(HL7_TEXT_MEDIA_TYPE);
    	
    	String referenceID = "attachement1";
    	
    
    	
    	 
		section.setText( narrative  );
    	POCDMT000040Entry entry = new POCDMT000040Entry();
    	POCDMT000040ObservationMedia obm =  new POCDMT000040ObservationMedia();
    	obm.setIDAttribute(referenceID);
    	obm.setClassCode(ActClassObservation.OBS);
    	obm.setMoodCode(ActMood.EVN);
    	obm.getId().add( Converter.getII(attachment.getDocumentID()));
     
    	ED value = new ED();
    	AttachedMedia document = attachment.getAttachement();
		value.setMediaType(document.getMediaType());
    	value.setIntegrityCheck(document.getIntegrityCheck());
    	
    	
    	TEL ref = new TEL();
    	ref.setValue(document.getFileName());
    	
		JAXBElement<TEL> reference = objectFactory.createEDReference(ref );
		value.getContent().add(reference);
		obm.setValue(value );
    	
		StrucDocRenderMultiMedia mm = new StrucDocRenderMultiMedia();
    	StrucDocCaption caption = new StrucDocCaption();
    	caption.getContent().add("Structured Body File");
    
    	
    	/**
    	 * must use the object here and let JAXB work out the object reference
    	 */
    	mm.getReferencedObject().add(obm);
		mm.setCaption(caption );
		
		JAXBElement<StrucDocRenderMultiMedia> multiMediaElement = objectFactory.createStrucDocTextRenderMultiMedia(mm );
    	narrative.getContent().add(multiMediaElement);
		
		
    	entry.setObservationMedia(obm );
		section.getEntry().add(entry );
		bodyComponent.setSection(section );
		body.getComponent().add(bodyComponent );
    	
    	
    	POCDMT000040Component3 adminobs = getAdministrativeObservationsSection();
    	body.getComponent().add(adminobs);
    	
    	
    	component.setStructuredBody(body );
    	
		return component;
	}

	private POCDMT000040Author getAuthor() {
		ReferralAuthor participant = cdaModel.getAuthor();
		POCDMT000040Person prescriberParticipantPerson = ClinicalModelConverter.getPrescriberPerson( participant );

		POCDMT000040Author author = HeaderUtil.createAuthorWithCurrentTime( 
				participant.getParticipantID(), 
				new RoleImpl(participant.getRoleCode()), 
		        participant.getAddresses(),
				participant.getElectronicCommunicationDetail(), 
				prescriberParticipantPerson
				);
		
		//assignedAuthor[1]/assignedPerson[1]/ns2:asEmployment[
		author.getAssignedAuthor().getAssignedPerson().setAsEmployment( ClinicalModelConverter.getEmploymentOrganisation(participant.getEmploymentOrganisation()));
		
		return author;
		
	}

    private POCDMT000040Component3 getAdministrativeObservationsSection() {
        POCDMT000040Component3 admin = new POCDMT000040Component3();


        POCDMT000040Section section = new POCDMT000040Section();
        section.setCode( SectionEntryCodeSet.ADMINISTRATIVE_OBSERVATIONS );
        section.setTitle( CDATypeUtil.getST( ADMINISTRATIVE_OBSERVATIONS_SECTION_TITLE ) );
        StrucDocText text= new StrucDocText();
        StrucDocContent content = new StrucDocContent();
        content.getContent().add("This section contains no entries.");
		text.getContent().add( new ObjectFactory().createStrucDocParagraphContent(content ));
		text.setMediaType(HL7_TEXT_MEDIA_TYPE);
        section.setText(text );
      
        admin.setSection(section);
        return admin;
    }

	public void setSchematronResource(SchematronResource resource) {
		this.resource=resource;
		
	}

}

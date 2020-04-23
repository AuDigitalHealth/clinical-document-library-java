/*
 * Copyright 2011 NEHTA
 *
 * Licensed under the NEHTA Open Source (Apache) License; you may not use this
 * file except in compliance with the License. A copy of the License is in the
 * 'license.txt' file, which should be provided with this work.
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations
 * under the License.
 */

package au.gov.nehta.builder.etp.prescriptionrequest;

import java.util.List;

import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;

import au.gov.nehta.builder.common.ClinicalModelConverter;
import au.gov.nehta.builder.common.EntryCreator;
import au.gov.nehta.builder.common.HeaderUtil;
import au.gov.nehta.builder.common.SectionEntryCodeSet;
import au.gov.nehta.builder.util.CDATypeUtil;
import au.gov.nehta.builder.util.ClinicalDocumentCreator;
import au.gov.nehta.builder.util.Converter;
import au.gov.nehta.builder.util.CreatorUtil;
import au.gov.nehta.model.cda.etp.PrescriptionRequestCdaModel;
import au.gov.nehta.model.clinical.etp.common.participation.DefaultParticipant;
import au.gov.nehta.model.clinical.etp.common.participation.DispenserParticipant;
import au.gov.nehta.model.clinical.etp.common.participation.DispenserParticipation;
import au.gov.nehta.model.clinical.etp.common.participation.DispensingOrganisationParticipant;
import au.gov.nehta.model.clinical.etp.common.participation.Entitlement;
import au.gov.nehta.model.clinical.etp.common.participation.PrescriberOrganisationParticipant;
import au.gov.nehta.model.clinical.etp.common.participation.PrescriberOrganisationParticipation;
import au.gov.nehta.model.clinical.etp.common.participation.PrescriberParticipation;
import au.gov.nehta.model.clinical.etp.eprescription.PrescriptionItem;
import au.gov.nehta.model.clinical.etp.prescriptionrequest.PrescriberInstructionDetail;
import au.gov.nehta.model.clinical.etp.prescriptionrequest.PrescriptionRequest;
import au.gov.nehta.model.clinical.etp.prescriptionrequest.RequesterNote;
import au.gov.nehta.model.schematron.SchematronResource.SchematronResources;
import au.gov.nehta.model.schematron.SchematronValidationException;
import au.net.electronichealth.ns.cda._2_0.CS;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Author;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040ClinicalDocument;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Component2;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Component3;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Entry;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Organization;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Person;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Section;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040StructuredBody;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import au.net.electronichealth.ns.ci.cda.extensions._3.Coverage2;

public class PrescriptionRequestCreator extends ClinicalDocumentCreator {
	// Constants
//	private static final String INSTRUCTION_SECTION_TITLE = "Prescription Request Source Instruction";

	private PrescriptionRequestCdaModel cdaModel;
	private PrescriptionRequest clinicalModel;

	public PrescriptionRequestCreator( PrescriptionRequestCdaModel cdaModel, PrescriptionRequest clinicalModel ) {
		this.cdaModel = cdaModel;
		this.clinicalModel = clinicalModel;
		
		this.resource = SchematronResources.PRESCRIPTION_REQUEST_3B.resource();
	}
	
	/**
     * Create the prescription request DOM document with a default stylesheet of
     * NEHTA_Generic_CDA_Stylesheet.xsl
     * 
     * @return
     * @throws ParserConfigurationException
     * @throws JAXBException
	 * @throws SchematronValidationException 
     */
	//not yet release
	private Document create()throws ParserConfigurationException, JAXBException, SchematronValidationException{
	    return create( "NEHTA_Generic_CDA_Stylesheet.xsl" );
	}

	//not yet released
	private Document create(String stylesheetName) throws ParserConfigurationException, JAXBException, SchematronValidationException {
		// Construct clinical document with headers
		POCDMT000040ClinicalDocument clinicalDocument = HeaderUtil
				.createClinicalDocument( cdaModel.getBaseClinicalDocument() );
		clinicalDocument.setCode( SectionEntryCodeSet.PRESCRIPTION_REQUEST );

		// Construct Legal Authenticator
		clinicalDocument.setLegalAuthenticator( HeaderUtil.createLegalAuthenticator( cdaModel.getLegalAuthenticator() ) );

		// Construct Custodian
		clinicalDocument.setCustodian( HeaderUtil.createCustodian( this.cdaModel.getCustodian().getAssignedCustodian().getRepresentedCustodianOrganization() ) );

		// Construct Encompassing Encounter (including Prescriber Organisation)
		DispensingOrganisationParticipant org = this.clinicalModel.getContext().getDispensingOrganisation().getParticipant();
		clinicalDocument.setComponentOf( HeaderUtil.createEncompassingEncounter( this.clinicalModel.getContext().getDispensingOrganisation().getRole(),
				ClinicalModelConverter.getDispensingOrganization( org ), org.getHealthCareFacilityID() ) );

		// Construct Author (Dispenser)
		final POCDMT000040Author clinicalDocumentAuthor = getAuthor();
		clinicalDocument.getAuthor().add( clinicalDocumentAuthor );

		// Construct Record Target
		clinicalDocument.getRecordTarget().add( HeaderUtil.createRecordTarget( clinicalModel.getContext().getSubjectOfCare() ) );

		clinicalDocument.setComponent( getStructuredBody() );

        Document doc = CreatorUtil.convertClinicalDocumentToDomDocument( clinicalDocument );
        addStylesheet(stylesheetName, doc);

        // If strict checking is enabled, check this document.
        if (isStrict()) {
            check( doc );
        }

        return doc;
		 
	}

	private POCDMT000040Author getAuthor() {
		DispenserParticipation dispenserParticipation = this.clinicalModel.getContext().getDispenser();
		DispenserParticipant dispenserParticipant = dispenserParticipation.getParticipant();
		POCDMT000040Person dispenserParticipantPerson = ClinicalModelConverter.getDispenserPerson( dispenserParticipant );

		return HeaderUtil.createAuthorWithCurrentTime( dispenserParticipant.getAssignedAuthorId(), dispenserParticipation.getRole(), dispenserParticipant.getAddresses(),
				dispenserParticipant.getElectronicCommunicationDetail(), dispenserParticipantPerson
				);
	}

	private POCDMT000040Component2 getStructuredBody() {
		POCDMT000040Component2 structuredBodyComponent = new POCDMT000040Component2();
		POCDMT000040StructuredBody structuredBody = new POCDMT000040StructuredBody();

		// Prescriber / Instruction
		structuredBody.getComponent().add( getInstructionSection() );

		// Prescription Request Item
		structuredBody.getComponent().add( getRequestItemSection() );


        if(clinicalModel.getContent().getLogo() != null){
           structuredBody.getComponent().add( getLogo() );
        }
        structuredBodyComponent.setStructuredBody( structuredBody );
		
		return structuredBodyComponent;
	}

	private POCDMT000040Component3 getInstructionSection() {
		POCDMT000040Component3 instructionSectionComponent = new POCDMT000040Component3();
		POCDMT000040Section instructionSection = new POCDMT000040Section();
		PrescriberInstructionDetail prescriberInstructionDetail = this.clinicalModel.getContent().getPrescriberInstructionDetail();
		String prescriberInstructionRecipientParticipantId = this.cdaModel.getPrescriberInstructionRecipientParticipantId();
		final PrescriberParticipation prescriber = this.clinicalModel.getContext().getPrescriber();
		final PrescriberOrganisationParticipation prescriberOrganisation = this.clinicalModel.getContext().getPrescriberOrganisation();
		final List<Entitlement> prescriberEntitlement = prescriber.getParticipant().getEntitlement();

		if (prescriberEntitlement != null && prescriberEntitlement.isEmpty() == false) {
			List<Coverage2> entitlements = ClinicalModelConverter.getParticpantEntitlements( prescriberEntitlement, prescriber.getParticipant().getParticipantID() );
			instructionSection.getCoverage2().addAll( entitlements );
		}

		POCDMT000040Entry substanceAdministrationEntry = EntryCreator.getSubstanceAdministrationEntry( prescriberInstructionDetail, prescriberInstructionRecipientParticipantId );

		instructionSection.getEntry().add( substanceAdministrationEntry );

		final StrucDocText instructionSectionNarrativeBlock = PrescriptionRequestCreatorUtil.getInstructionSectionNarrativeBlock( prescriberInstructionDetail, prescriber, prescriberOrganisation );
		instructionSection.setText( instructionSectionNarrativeBlock );
		instructionSection.getAuthor().add( getInstructionAuthor() );
		instructionSection.setCode( SectionEntryCodeSet.PRESCRIBER_INSTRUCTION_DETAIL );
		instructionSection.setTitle( CDATypeUtil.getST( SectionEntryCodeSet.PRESCRIBER_INSTRUCTION_DETAIL.getDisplayName() ) );
		instructionSectionComponent.setSection( instructionSection );

		return instructionSectionComponent;
	}
	
   private POCDMT000040Component3 getLogo() {
        POCDMT000040Component3 LogoSectionComponent = new POCDMT000040Component3();
        POCDMT000040Section section = new POCDMT000040Section();
        
        POCDMT000040Entry logoentry = EntryCreator.getLogoEntry(  clinicalModel.getContent().getLogo()  );
        section.getEntry().add( logoentry );
        LogoSectionComponent.setSection( section );

        return LogoSectionComponent;
    }

	private POCDMT000040Author getInstructionAuthor() {
		PrescriberParticipation prescriber = this.clinicalModel.getContext().getPrescriber();
		DefaultParticipant prescriberParticipant = prescriber.getParticipant();
		PrescriberOrganisationParticipation prescriberOrganisationParticipation = this.clinicalModel.getContext().getPrescriberOrganisation();
		PrescriberOrganisationParticipant prescriberOrganisationParticipant = prescriberOrganisationParticipation.getParticipant();

		POCDMT000040Person authorPerson = ClinicalModelConverter.getPrescriberPerson( prescriberParticipant );

        final POCDMT000040Author author = HeaderUtil.createAuthorNullFlavourTime( prescriberParticipant.getParticipantID(), prescriber.getRole(), prescriberParticipant.getAddresses(),
                prescriberParticipant.getElectronicCommunicationDetail(), authorPerson );

		final POCDMT000040Organization prescriberOrganization = ClinicalModelConverter.getPrescriberOrganization( prescriberOrganisationParticipant );
		prescriberOrganization.setStandardIndustryClassCode( Converter.convertToCECode( prescriberOrganisationParticipation.getRole().getCode() ) );

		author.getAssignedAuthor().setRepresentedOrganization( prescriberOrganization );

		return author;
	}

	private POCDMT000040Component3 getRequestItemSection() {
		POCDMT000040Component3 requestItemSectionComponent = new POCDMT000040Component3();
		POCDMT000040Section requestItemSection = new POCDMT000040Section();

		PrescriptionItem prescriptionRequestItem = this.clinicalModel.getContent().getPrescriptionRequestItem();
		RequesterNote requesterNote = this.clinicalModel.getContent().getRequesterNote();
		DispensingOrganisationParticipant org = this.clinicalModel.getContext().getDispensingOrganisation().getParticipant();
		List<Entitlement> dispensingOrganisationEntitlement = org.getEntitlement();
		List<Entitlement> subjectOfCareEntitlement = this.clinicalModel.getContext().getSubjectOfCare().getEntitlements();

		POCDMT000040Entry substanceAdministrationEntry = EntryCreator.getPRSubstanceAdministrationEntry( prescriptionRequestItem );
		
		//override the status code
		CS statusCode = new CS();
        statusCode.setCode( "suspended" );
        substanceAdministrationEntry.getSubstanceAdministration().setStatusCode( statusCode );
        
		requestItemSection.getEntry().add( substanceAdministrationEntry );

		if (org.getEntitlement() != null) {
			List<Coverage2> dispensingOrganisationEntitlements = ClinicalModelConverter.getDispensingOrganisationEntitlements( dispensingOrganisationEntitlement,
					org.getHealthCareFacilityID() );
			requestItemSection.getCoverage2().addAll( dispensingOrganisationEntitlements );
		}

		if (subjectOfCareEntitlement != null) {
			List<Coverage2> subjectOfCareEntitlements = ClinicalModelConverter.getSubjectOfCareEntitlements( this.clinicalModel.getContext().getSubjectOfCare() );
			requestItemSection.getCoverage2().addAll( subjectOfCareEntitlements );
		}

		if (requesterNote != null) {
			POCDMT000040Entry noteEntry = EntryCreator.getNoteEntry( requesterNote.getNote(), SectionEntryCodeSet.REQUESTER_NOTE );
			requestItemSection.getEntry().add( noteEntry );
		}

		final StrucDocText requestItemSectionNarrativeBlock = PrescriptionRequestCreatorUtil.getPrescriptionRequestItemSectionNarrativeBlock( prescriptionRequestItem, requesterNote,
				subjectOfCareEntitlement, dispensingOrganisationEntitlement );
		requestItemSection.setText( requestItemSectionNarrativeBlock );
		requestItemSection.setCode( SectionEntryCodeSet.PRESCRIPTION_REQUEST_ITEM );
		requestItemSection.setTitle( CDATypeUtil.getST( SectionEntryCodeSet.PRESCRIPTION_REQUEST_ITEM.getDisplayName() ) );
		requestItemSectionComponent.setSection( requestItemSection );

		// Add section components to Structured Body
		return requestItemSectionComponent;
	}

}

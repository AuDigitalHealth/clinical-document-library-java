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

package au.gov.nehta.builder.npdr.dispenserecord;

import java.util.List;

import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;

import au.gov.nehta.builder.common.ClinicalModelConverter;
import au.gov.nehta.builder.common.EntryCreator;
import au.gov.nehta.builder.common.HeaderUtil;
import au.gov.nehta.builder.common.SectionEntryCodeSet;
import au.gov.nehta.builder.common.StructuredBodyUtil;
import au.gov.nehta.builder.npdr.NPDREntryCreator;
import au.gov.nehta.builder.util.CDATypeUtil;
import au.gov.nehta.builder.util.ClinicalDocumentCreator;
import au.gov.nehta.builder.util.CreatorUtil;
import au.gov.nehta.model.cda.common.code.Code;
import au.gov.nehta.model.cda.common.code.CodeImpl;
import au.gov.nehta.model.cda.common.document.RelatedDocument;
import au.gov.nehta.model.cda.npdr.DispenseRecordCdaModel;
import au.gov.nehta.model.cda.npdr.PCEHRDispenseItem;
import au.gov.nehta.model.clinical.common.SubjectOfCareDemographicData;
import au.gov.nehta.model.clinical.common.participation.DateAccuracy;
import au.gov.nehta.model.clinical.common.participation.RoleImpl;
import au.gov.nehta.model.clinical.etp.common.participation.DispenserParticipant;
import au.gov.nehta.model.clinical.etp.common.participation.DispenserParticipation;
import au.gov.nehta.model.clinical.etp.common.participation.DispensingOrganisationParticipant;
import au.gov.nehta.model.clinical.etp.common.participation.DispensingOrganisationParticipation;
import au.gov.nehta.model.clinical.etp.common.participation.Entitlement;
import au.gov.nehta.model.clinical.etp.dispenserecord.DispenseItem;
import au.gov.nehta.model.clinical.etp.dispenserecord.DispenseRecord;
import au.gov.nehta.model.schematron.SchematronResource.SchematronResources;
import au.gov.nehta.model.schematron.SchematronValidationException;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Author;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040ClinicalDocument;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Component2;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Component3;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Entry;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Person;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Section;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040StructuredBody;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import au.net.electronichealth.ns.cda._2_0.XActRelationshipDocument;
import au.net.electronichealth.ns.ci.cda.extensions._3.Coverage2;

public class DispenseRecordCreator extends ClinicalDocumentCreator{
	// Constants
	private static final String DISPENSE_ITEM_SECTION_TITLE = "Dispense Item";
	private static final String ADMINISTRATIVE_OBSERVATIONS_SECTION_TITLE = "Administrative Observations";

	private DispenseRecordCdaModel cdaModel;
	private DispenseRecord clinicalModel;

	public DispenseRecordCreator( DispenseRecordCdaModel dispenseRecordCdaModel, DispenseRecord clinicalModel )   {
		this.cdaModel = dispenseRecordCdaModel;
		this.clinicalModel = clinicalModel;
		
		
		//Since NPDR is a subset of a prescription model, we do some extra checking here:
		NPDRDispenseValidator.check(cdaModel);
		NPDRDispenseValidator.check(clinicalModel);
		
		
		checkSetID();//throws illegalArgumentException
		
		//default to PCEHR Dispense checking
		this.resource = SchematronResources.PCEHR_DISPENSE_3B.resource();
		
	}

    public void checkSetID() {
        //check that the SetID matches for each RPLC
		for (RelatedDocument doc : cdaModel.getRelatedDocuments( )) {
		    if(XActRelationshipDocument.RPLC.equals( doc.getTypeCode() )){
		        String setId = cdaModel.getBaseClinicalDocument().getSetId();
		        
		        if( setId != null && !setId.equals( doc.getSetId().getRoot())){
		            throw new IllegalArgumentException(" Document set ID must match CDA document if provided for a replacement parent document");
		        }
		        
		        //setID must not match for transform code
		    }else  if(XActRelationshipDocument.XFRM.equals( doc.getTypeCode() )){
		    
		            String setId = cdaModel.getBaseClinicalDocument().getSetId();
                
                if( setId != null && setId.equals( doc.getSetId().getRoot())){
                    throw new IllegalArgumentException(" Document set ID must NOT match CDA document if provided for a transform parent document");
                }
		    
		    }
        }
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
		// Construct clinical document with headers
		//final String clinicalDocumentId = 
		POCDMT000040ClinicalDocument clinicalDocument = HeaderUtil.createClinicalDocument( cdaModel.getBaseClinicalDocument() );
		clinicalDocument.setCode( SectionEntryCodeSet.NPDR_DISPENSE_RECORD );

		// Construct Legal Authenticator
		clinicalDocument.setLegalAuthenticator( HeaderUtil.createLegalAuthenticator( cdaModel.getLegalAuthenticator() ) );
		
		// Construct Legal Authenticator
        clinicalDocument.getRelatedDocument().addAll( HeaderUtil.createRelatedDocuments( cdaModel.getRelatedDocuments() ) );

		// Construct Custodian
		clinicalDocument.setCustodian( HeaderUtil.createCustodian( this.cdaModel.getCustodian().getAssignedCustodian().getRepresentedCustodianOrganization() ) );

		
		//hard coded role for dispensing orgs
		Code hardcodedRoleCode = new CodeImpl( "PHARM" );
		hardcodedRoleCode.setCodeSystem( "2.16.840.1.113883.1.11.17660" );
		hardcodedRoleCode.setCodeSystemName( "HL7 ServiceDeliveryLocationRoleType" );
		hardcodedRoleCode.setDisplayName( "Pharmacy" );
		
		
		// Construct Encompassing Encounter (including Dispenser Organisation)
		DispensingOrganisationParticipation dispensingOrg = this.clinicalModel.getContext().getDispensingOrganisation();
		clinicalDocument.setComponentOf( HeaderUtil.createEncompassingEncounter(
		        new RoleImpl(hardcodedRoleCode),
				ClinicalModelConverter.getDispensingOrganization( dispensingOrg.getParticipant() ), dispensingOrg.getParticipant().getHealthCareFacilityID() ) );

		// Construct Author (Dispenser)
		final POCDMT000040Author clinicalDocumentAuthor = getAuthor();
		clinicalDocument.getAuthor().add( clinicalDocumentAuthor );

		// Construct Record Target
		clinicalDocument.getRecordTarget().add( HeaderUtil.createRecordTarget(clinicalModel.getContext().getSubjectOfCare() ) );

		clinicalDocument.setComponent( getStructuredBody() );

		
		Document doc = CreatorUtil.convertClinicalDocumentToDomDocument( clinicalDocument );
		
        
        //If strict checking is enabled, check this document.
        if(isStrict()){
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

		// Dispense Item
		structuredBody.getComponent().add( getDispenseItemSection() );

		// Administrative Observations
		structuredBody.getComponent().add( getAdministrativeObservationsSection() );

		structuredBodyComponent.setStructuredBody( structuredBody );
		
		if( clinicalModel.getContext().getLogo() != null){
		    structuredBody.getComponent().add( getLogo() );
		}
		
		
		return structuredBodyComponent;
	}
	
	
   private POCDMT000040Component3 getLogo() {
        POCDMT000040Component3 LogoSectionComponent = new POCDMT000040Component3();
        POCDMT000040Section section = new POCDMT000040Section();
        
        POCDMT000040Entry logoentry = EntryCreator.getLogoEntry(  clinicalModel.getContext().getLogo()  );
        section.getEntry().add( logoentry );
        LogoSectionComponent.setSection( section );

        return LogoSectionComponent;
    }

	private POCDMT000040Component3 getDispenseItemSection() {
		POCDMT000040Component3 dispenseItemSectionComponent = new POCDMT000040Component3();
		POCDMT000040Section dispenseItemSection = new POCDMT000040Section();
		DispensingOrganisationParticipant org = this.clinicalModel.getContext().getDispensingOrganisation().getParticipant();
		List<Entitlement> dispensingOrganisationEntitlement = org.getEntitlement();
		List<Entitlement> subjectOfCareEntitlement = this.clinicalModel.getContext().getSubjectOfCare().getEntitlements();

		DispenseItem dispenseItem = this.clinicalModel.getContent();

		POCDMT000040Entry substanceAdministrationEntry = NPDREntryCreator.getSubstanceAdministrationEntry( (PCEHRDispenseItem) dispenseItem );
		dispenseItemSection.getEntry().add( substanceAdministrationEntry );

		if (subjectOfCareEntitlement != null) {
			List<Coverage2> subjectOfCareEntitlements =
			        ClinicalModelConverter.getSubjectOfCareEntitlements( this.clinicalModel.getContext().getSubjectOfCare() );
			dispenseItemSection.getCoverage2().addAll( subjectOfCareEntitlements );
		}

		if (dispensingOrganisationEntitlement != null) {
			List<Coverage2> dispensingOrganisationEntitlements = ClinicalModelConverter.getDispensingOrganisationEntitlements( dispensingOrganisationEntitlement,
					org.getHealthCareFacilityID() );
			dispenseItemSection.getCoverage2().addAll( dispensingOrganisationEntitlements );
		}

		final StrucDocText dispenseItemSectionNarrativeBlock = DispenseRecordCreatorUtil.getDispenseItemSectionNarrativeBlock( dispenseItem, subjectOfCareEntitlement,
				dispensingOrganisationEntitlement );
		dispenseItemSection.setText( dispenseItemSectionNarrativeBlock );

		dispenseItemSection.setCode( SectionEntryCodeSet.NPDR_DISPENSE_ITEM );
		dispenseItemSection.setTitle( CDATypeUtil.getST( DISPENSE_ITEM_SECTION_TITLE ) );
		dispenseItemSectionComponent.setSection( dispenseItemSection );

		// Add section components to Structured Body
		return dispenseItemSectionComponent;
	}

	private POCDMT000040Component3 getAdministrativeObservationsSection() {
		POCDMT000040Component3 administrativeObservationsSectionComponent = new POCDMT000040Component3();

		SubjectOfCareDemographicData subjectOfCareDemographicData = this.clinicalModel.getContext().getSubjectOfCare().getPerson().getDemographicData();

		POCDMT000040Section administrativeObservationsSection = new POCDMT000040Section();
		administrativeObservationsSection.setCode( SectionEntryCodeSet.ADMINISTRATIVE_OBSERVATIONS );
		administrativeObservationsSection.setTitle( CDATypeUtil.getST( ADMINISTRATIVE_OBSERVATIONS_SECTION_TITLE ) );
		
		if (subjectOfCareDemographicData != null) {
    		// Administrative Observations entries
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

		
			POCDMT000040Entry ageEntry = EntryCreator.createSubjectOfCareAgeEntry( Integer.toString( subjectOfCareDemographicData.getAgeInYears()) );
			administrativeObservationsSection.getEntry().add( ageEntry );

			if (subjectOfCareDemographicData.isAgeAccurate() != null) {
				POCDMT000040Entry ageAccuracyEntry = EntryCreator.createSubjectOfCareAgeAccuracyEntry( subjectOfCareDemographicData.isAgeAccurate()  );
				administrativeObservationsSection.getEntry().add( ageAccuracyEntry );
			}
		

    		Integer subjectOfCareBirthPlurality = subjectOfCareDemographicData.getBirthPlurality();
    		if (subjectOfCareBirthPlurality != null) {
    			POCDMT000040Entry birthPluralityEntry = EntryCreator.createSubjectOfCareBirthPluralityEntry( subjectOfCareBirthPlurality );
    			administrativeObservationsSection.getEntry().add( birthPluralityEntry );
    		}
    		
    		StrucDocText administrativeObservationsSectionNarrativeBlock = StructuredBodyUtil.getAdministrativeObservationsNarrativeBlock( subjectOfCareDemographicData );
            administrativeObservationsSection.setText( administrativeObservationsSectionNarrativeBlock );
            administrativeObservationsSectionComponent.setSection( administrativeObservationsSection );
		}

		// Administrative Observations narrative block


		return administrativeObservationsSectionComponent;
	}
}

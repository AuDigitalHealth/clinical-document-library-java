package au.gov.nehta.builder.etp.prescriptionrequest;

import java.util.Arrays;
import java.util.List;

import javax.xml.bind.JAXBElement;

import au.gov.nehta.builder.etp.eprescription.EPrescriptionCreatorUtil;
import au.gov.nehta.builder.util.narrative.NarrativeUtil;
import au.gov.nehta.model.clinical.etp.common.participation.Entitlement;
import au.gov.nehta.model.clinical.etp.common.participation.PrescriberInstructionRecipientParticipation;
import au.gov.nehta.model.clinical.etp.common.participation.PrescriberOrganisationParticipation;
import au.gov.nehta.model.clinical.etp.common.participation.PrescriberParticipation;
import au.gov.nehta.model.clinical.etp.eprescription.PrescriptionItem;
import au.gov.nehta.model.clinical.etp.prescriptionrequest.PrescriberInstructionDetail;
import au.gov.nehta.model.clinical.etp.prescriptionrequest.RequesterNote;
import au.net.electronichealth.ns.cda._2_0.ObjectFactory;
import au.net.electronichealth.ns.cda._2_0.StrucDocTable;
import au.net.electronichealth.ns.cda._2_0.StrucDocTbody;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import au.net.electronichealth.ns.cda._2_0.StrucDocThead;

public class PrescriptionRequestCreatorUtil {
    private static final String HL7_TEXT_MEDIA_TYPE = "text/x-hl7-text+xml";
    
	public static StrucDocText getInstructionSectionNarrativeBlock( PrescriberInstructionDetail prescriberInstructionDetail, PrescriberParticipation prescriber,
			PrescriberOrganisationParticipation prescriberOrganisation ) {
		StrucDocText narrativeBlock = new StrucDocText();
		
		PrescriberInstructionRecipientParticipation prescriberInstructionRecipient = prescriberInstructionDetail.getPrescriberInstructionRecipient();
		List<Entitlement> prescriberEntitlement = prescriber.getParticipant().getEntitlement();

		StrucDocTable prescriberInstructionTable = new StrucDocTable();

		StrucDocThead prescriberInstructionTableHead = new StrucDocThead();
		prescriberInstructionTableHead.getTr().add( NarrativeUtil.getTableHeaderRow( Arrays.asList( "Field", "Value" )) );
		prescriberInstructionTable.setThead( prescriberInstructionTableHead );

		StrucDocTbody prescriberInstructionTableBody = new StrucDocTbody();

		
		
	      // DateTime Prescriber Instruction Received
        prescriberInstructionTableBody.getTr().add(
                NarrativeUtil.createTableBodyRowWithCellValues( Arrays.asList( "Date and Time Prescriber Instruction Received",
                        NarrativeUtil.NARRATIVE_DATE_TIME_FORMATTER.print( prescriberInstructionDetail.getDateTimePrescriberInstructionReceived() ) ) ) );

        // Prescriber Instruction
        prescriberInstructionTableBody.getTr()
                .add( NarrativeUtil.createTableBodyRowWithCellValues( Arrays.asList( "Prescriber Instruction", prescriberInstructionDetail.getPrescriberInstruction() ) ) );
        
        // Prescriber Instruction Source
        if (prescriberInstructionDetail.getPrescriberInstructionSource().isCoded()) {
            prescriberInstructionTableBody.getTr().add(
                    NarrativeUtil.createTableBodyRowWithCellValues( Arrays.asList( "Prescriber Instruction Source", prescriberInstructionDetail.getPrescriberInstructionSource().getDisplayName() ) ) );
        } else {
            prescriberInstructionTableBody.getTr().add(
                    NarrativeUtil.createTableBodyRowWithCellValues( Arrays.asList( "Prescriber Instruction Source", prescriberInstructionDetail.getPrescriberInstructionSource().getCode() ) ) );
        }
        

        // Prescriber Instruction Communication Medium
        if (prescriberInstructionDetail.getPrescriberInstructionSource().isCoded()) {
            prescriberInstructionTableBody.getTr().add(
                    NarrativeUtil.createTableBodyRowWithCellValues( Arrays.asList( "Prescriber Instruction Communication Medium", prescriberInstructionDetail
                            .getPrescriberInstructionCommunicationMedium().getDisplayName() ) ) );
        } else {
            prescriberInstructionTableBody.getTr().add(
                    NarrativeUtil.createTableBodyRowWithCellValues( Arrays.asList( "Prescriber Instruction Communication Medium", prescriberInstructionDetail
                            .getPrescriberInstructionCommunicationMedium().getCode() ) ) );
        }
		
		// Prescriber Instruction Recipient
		//TODO:
//		prescriberInstructionTableBody.getTr().add(
//				NarrativeUtil.createTableBodyRowWithCells( NarrativeUtil.getProviderIndividualCells( "Prescriber Instruction Recipient Details", prescriberInstructionRecipient.getParticipant()
//						.getEntityIdentifier(), prescriberInstructionRecipient.getParticipant().getPerson().getPersonName(), prescriberInstructionRecipient.getParticipant().getPerson()
//						.getDemographicData(), prescriberInstructionRecipient.getParticipant().getQualifications() ) ) );

		if (prescriberInstructionRecipient.getParticipant().getAddresses() != null) {
			prescriberInstructionTableBody.getTr().add(
					NarrativeUtil.createTableBodyRowWithCells( NarrativeUtil.getProviderAddressCells( "Prescriber Instruction Recipient Address", prescriberInstructionRecipient.getParticipant()
							.getAddresses() ) ) );
		}

		if (prescriberInstructionRecipient.getParticipant().getElectronicCommunicationDetail() != null) {
			prescriberInstructionTableBody.getTr().add(
					NarrativeUtil.createTableBodyRowWithCells( NarrativeUtil.getElectronicCommunicationCells( "Prescriber Instruction Recipient Electronic Communication Details",
							prescriberInstructionRecipient.getParticipant().getElectronicCommunicationDetail() ) ) );
		}


	
	


		// Prescriber
//		prescriberInstructionTableBody.getTr().add(
//				NarrativeUtil.createTableBodyRowWithCells( NarrativeUtil.getProviderIndividualCells( "Prescriber Details", prescriber.getParticipant().getEntityIdentifier(), prescriber
//						.getParticipant().getPerson().getPersonName(), null, prescriber.getParticipant().getQualifications() ) ) );

		if (prescriber.getParticipant().getAddresses() != null) {
			prescriberInstructionTableBody.getTr().add(
					NarrativeUtil.createTableBodyRowWithCells( NarrativeUtil.getProviderAddressCells( "Prescriber Address", prescriber.getParticipant().getAddresses() ) ) );
		}

		if (prescriber.getParticipant().getElectronicCommunicationDetail() != null) {
			prescriberInstructionTableBody.getTr().add(
					NarrativeUtil.createTableBodyRowWithCells( NarrativeUtil.getElectronicCommunicationCells( "Prescriber Communication Details", prescriber.getParticipant()
							.getElectronicCommunicationDetail() ) ) );
		}

		// Prescriber Entitlements
		if (prescriberEntitlement != null) {
			prescriberInstructionTableBody.getTr().add( NarrativeUtil.createTableBodyRowWithCells( NarrativeUtil.getEntitlementCells( "Prescriber Entitlements", prescriberEntitlement ) ) );
		}

		// Prescriber Organisation
//		prescriberInstructionTableBody.getTr().add(
//				NarrativeUtil.createTableBodyRowWithCells( NarrativeUtil.getProviderOrganisationCells( "Prescriber Organisation", prescriberOrganisation.getParticipant().getEntityIdentifier(),
//						prescriberOrganisation.getParticipant().getOrganisation() ) ) );

		prescriberInstructionTableBody.getTr().add(
				NarrativeUtil.createTableBodyRowWithCells( NarrativeUtil.getProviderAddressCells( "Prescriber Organisation Address", prescriberOrganisation.getParticipant().getAddresses() ) ) );

		prescriberInstructionTableBody.getTr().add(
				NarrativeUtil.createTableBodyRowWithCells( NarrativeUtil.getElectronicCommunicationCells( "Prescriber Organisation Communication Details", prescriberOrganisation.getParticipant()
						.getElectronicCommunicationDetail() ) ) );

		prescriberInstructionTable.getTbody().add( prescriberInstructionTableBody );

		JAXBElement<StrucDocTable> prescriptionItemTableJaxbElement = new ObjectFactory().createStrucDocTextTable( prescriberInstructionTable );

		narrativeBlock.getContent().add( prescriptionItemTableJaxbElement );
		narrativeBlock.setMediaType( HL7_TEXT_MEDIA_TYPE );
		return narrativeBlock;
	}

	public static StrucDocText getPrescriptionRequestItemSectionNarrativeBlock( PrescriptionItem prescriptionRequestItem, RequesterNote requesterNote,
			List<Entitlement> subjectOfCareEntitlement, List<Entitlement> dispensingOrganisationEntitlement ) {
		StrucDocText narrativeBlock = new StrucDocText();
		
	    String note=null;
		if(requesterNote != null){  
		    note = requesterNote.getNote();
		}
		
        EPrescriptionCreatorUtil.buildPrescriptionItemNarrative( prescriptionRequestItem, note, subjectOfCareEntitlement, narrativeBlock );
        
      
		narrativeBlock.setMediaType( HL7_TEXT_MEDIA_TYPE );
		return narrativeBlock;
	}
}

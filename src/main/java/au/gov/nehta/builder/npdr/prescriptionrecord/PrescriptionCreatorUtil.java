package au.gov.nehta.builder.npdr.prescriptionrecord;

import static au.gov.nehta.builder.util.narrative.NarrativeUtil.NARRATIVE_DATE_TIME_FORMATTER;
import static au.gov.nehta.builder.util.narrative.NarrativeUtil.booleanToYesNo;
import static au.gov.nehta.builder.util.narrative.NarrativeUtil.createTableBodyRowWithCellValues;

import java.util.Arrays;
import java.util.List;

import javax.xml.bind.JAXBElement;

import au.gov.nehta.builder.DocumentCreatorUtil;
import au.gov.nehta.builder.util.Converter;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.code.SNOMED_AU_Code;
import au.gov.nehta.model.cda.common.prescription.Observations;
import au.gov.nehta.model.cda.common.time.SetComponentTime;
import au.gov.nehta.model.cda.npdr.PCEHRPrescriptionItem;
import au.gov.nehta.model.clinical.etp.common.item.Dosage;
import au.gov.nehta.model.clinical.etp.common.item.QuantityUnitDescription;
import au.gov.nehta.model.clinical.etp.common.participation.Entitlement;
import au.gov.nehta.model.clinical.etp.eprescription.BodyHeight;
import au.gov.nehta.model.clinical.etp.eprescription.BodyWeight;
import au.gov.nehta.model.clinical.etp.eprescription.PrescriptionNoteDetail;
import au.net.electronichealth.ns.cda._2_0.CD;
import au.net.electronichealth.ns.cda._2_0.ObjectFactory;
import au.net.electronichealth.ns.cda._2_0.StrucDocTable;
import au.net.electronichealth.ns.cda._2_0.StrucDocTbody;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import au.net.electronichealth.ns.cda._2_0.StrucDocTr;

public class PrescriptionCreatorUtil extends DocumentCreatorUtil {
	private static final String HL7_TEXT_MEDIA_TYPE = "text/x-hl7-text+xml";

	public static StrucDocText getPrescriptionItemSectionNarrativeBlock( PCEHRPrescriptionItem item, PrescriptionNoteDetail prescriptionNoteDetail,
		List<Entitlement> subjectOfCareEntitlement, List<Entitlement> prescriberEntitlement ) {
		StrucDocText narrativeBlock = new StrucDocText();

		String note = null;
		if(prescriptionNoteDetail != null) note =  prescriptionNoteDetail.getNote();
		
		buildPrescriptionItemNarrative( item, note, subjectOfCareEntitlement, narrativeBlock );
		
		narrativeBlock.setMediaType( HL7_TEXT_MEDIA_TYPE );
		return narrativeBlock;
	}

    public static void buildPrescriptionItemNarrative( PCEHRPrescriptionItem item, String notes, List<Entitlement> subjectOfCareEntitlement, StrucDocText narrativeBlock ) {
        StrucDocTable prescriptionItemTable = new StrucDocTable();
        addCaption(prescriptionItemTable, "Prescription Item" );
        String[] fieldValueHeader = { "Field", "Value"}; 
        addHeader(prescriptionItemTable, fieldValueHeader );

		StrucDocTbody prescriptionItemTableBody = addBody(prescriptionItemTable);

		add(prescriptionItemTableBody, "Date and Time Prescription Written",
						NARRATIVE_DATE_TIME_FORMATTER.print( item.getDateTimePrescriptionWritten())  );

		add(prescriptionItemTableBody, "Date and Time Prescription Expires",
						NARRATIVE_DATE_TIME_FORMATTER.print( item.getDateTimePrescriptionExpires() ) );

		
		if(item.getPrescriptionItemIdentifier() != null ){
		    add(prescriptionItemTableBody, "Prescription Item Identifier", item.getPrescriptionItemIdentifier().getExtension()   );
        }

		if( item.getPbsRpbsItemCode() != null){
		    add(prescriptionItemTableBody, "Therapeutic Good Identification", print(item.getPbsRpbsItemCode()) );
		}
		
		if(item.getGenericName() != null){
             add( prescriptionItemTableBody,
                     "Therapeutic Good Generic Name (Additional Therapeutic Good Detail) ", 
                     item.getGenericName() );
        }
         

		if (item.getFormula() != null) {
		    add(prescriptionItemTableBody, "Formula", item.getFormula() );
		}
		
		if (item.getProductFormCode() != null) {
            add(prescriptionItemTableBody, "Form", item.getProductFormCode().getDisplayName() );
        }
		
		if (item.getDirections() != null) {
		    add(prescriptionItemTableBody, "Directions", item.getDirections()  );
		}
		

		//
		if(item.getBrandSubstituteAllowed() != null){
			prescriptionItemTableBody.getTr().add(
				createTableBodyRowWithCellValues( Arrays.asList( "Brand Substitution Allowed", booleanToYesNo( item.getBrandSubstituteAllowed() ) ) ) );
		}
		prescriptionItemTableBody.getTr().add( createTableBodyRowWithCellValues( Arrays.asList( "Maximum number of Repeats", item.getMaximumNumberOfRepeats().toString() ) ) );

		if (item.getMinimumIntervalBetweenRepeats() != null) {
			String minimumIntervalBetweenRepeats = item.getMinimumIntervalBetweenRepeats().getNarrative();
			add( prescriptionItemTableBody,  "Minimum Interval Between Repeats", minimumIntervalBetweenRepeats );
		}

		
		if(item.getPbsType() != null){
		    add( prescriptionItemTableBody,  "PBS Prescription Type", print(item.getPbsType()) );
		}
		if(item.getMedicalBenefitCategoryType() != null){
		    add( prescriptionItemTableBody,  "Medical Benefit Category Type", item.getMedicalBenefitCategoryType().getAlternativeCode() );
		}
		
		
		if(item.getCloseTheGapBenifitId() != null){
            add( prescriptionItemTableBody,  "PBS Close the Gap Benefit", item.getCloseTheGapBenifitId().getExtension() );
        }
		
		 if (item.getPbsRpbsItemCode() != null && item.getPbsRpbsItemCode().getTranslations() != null && item.getPbsRpbsItemCode().getTranslations().size() > 0) {
	            
	            StringBuffer translations = new StringBuffer();
	            for(Coded code: item.getPbsRpbsItemCode().getTranslations()){
	                translations.append( " - " );
	                translations.append( code.getOriginalText() );
	            }
	            add( prescriptionItemTableBody, "PBS/RPBS Item Code", translations.toString() );
	        }
        
		
//        PBS/RPBS Manufacturer Code
        if(item.getPbsRpbsManufacturerCode() != null){
            add( prescriptionItemTableBody,  "PBS/RPBS Manufacturer Code", item.getPbsRpbsManufacturerCode().getExtension() );
        }
        if(item.getGroundsForConcurrentSupply() != null){
            add( prescriptionItemTableBody,  "Grounds for Concurrent Supply",  item.getGroundsForConcurrentSupply().getDisplayName()  );
        }
        
        if(item.getPbsAuthorityPrescriptionNumber() != null){
            add( prescriptionItemTableBody,  "PBS/RPBS Authority Prescription Number", item.getPbsAuthorityPrescriptionNumber().getExtension() );
        }
		
		if (item.getPbsAuthorityApprovalNumber() != null) {
		    add( prescriptionItemTableBody,  "PBS/RPBS Authority Approval Number",  item.getPbsAuthorityApprovalNumber().getExtension() );
		}
		
//		prescriptionItemTableBody.getTr().add( NarrativeUtil.createTableBodyRowWithCellValues( Arrays.asList( "Quantity of Therapeutic Good", prescriptionItem.getQuantityOfTherapeuticGood() ) ) );
		if (item.getStreamlinedAuthorityApprovalNumber() != null) {
            add( prescriptionItemTableBody,  "Streamlined Authority Approval Number",  item.getStreamlinedAuthorityApprovalNumber().getExtension() );
        }
		
		if (item.getStateAuthorityNumber() != null) {
		    add( prescriptionItemTableBody,  "State Authority Number", item.getStateAuthorityNumber().getExtension() );
		}

		if (item.getReasonForTherapeuticGood() != null) {
		    add( prescriptionItemTableBody,  "Reason for Therapeutic Good", item.getReasonForTherapeuticGood() );
		}

		if (item.getAdditionalComments() != null) {
		    add( prescriptionItemTableBody,  "Additional Comments", item.getAdditionalComments() );
		}
		
		if (item.getDispensItemIdentifier() != null) {
            add( prescriptionItemTableBody,  "Dispense Item Identifier", item.getDispensItemIdentifier().getExtension() );
        }
		
		if (item.getMedicationInstructionIdentifier() != null) {
            add( prescriptionItemTableBody,  "Medication Instruction Identifier", item.getMedicationInstructionIdentifier().getExtension() );
        }
		  
		if (notes != null) {
		    if(item.isRequestItem())
		        add( prescriptionItemTableBody,  "Requester Note Detail", notes );
		    else
		    add( prescriptionItemTableBody,  "Prescription Note Detail", notes );
		}

		

		
        StrucDocTable timmingTable = new StrucDocTable();
        addCaption(timmingTable, "Timing");
        addHeader(timmingTable, fieldValueHeader );
        StrucDocTbody timingBody =addBody(timmingTable);
        
        boolean isTimingTableRequired=false;
        
        if(item.getTimingDescription() != null){
            isTimingTableRequired=true;
            add(timingBody, "Timing Description",item.getTimingDescription() );
        }
        
        if(item.getStructuredTime() != null && item.getStructuredTime().size()>0 ){
            isTimingTableRequired=true;
            StringBuffer buff = new StringBuffer();
            
            for(SetComponentTime t: item.getStructuredTime()){
                if(t.getNarrative() != null){
                 buff.append( t.getNarrative() );
                 buff.append( "<br />");
                }
            }
            
            //if we got narratives, use them
            if(buff.length() > 0)
                add(timingBody, "Effective Time",buff.toString() );
        }
        
        
        if(item.getPRN() != null){
            isTimingTableRequired=true;
            add(timingBody, "PRN",item.getPRN().toString());
        }
        
        if(item.getStartCriterion() != null){
            isTimingTableRequired=true;
            add(timingBody, "Start Criterion", "Yes");
            add(timingBody, "Start Date", print( item.getStartCriterion().getDateTime()  ) );
        }
        
       
        if(item.getStopCriterion() != null){
            isTimingTableRequired=true;
            add(timingBody, "Stop Criterion", "Yes");
            add(timingBody, "Stop Date", print( item.getStopCriterion().getDateTime() ) );
        }
        
        
        Dosage dosage = item.getDosage();
        if(dosage!= null){
            if(dosage.getMaxDose() != null ){
                add(timingBody, "Maximum Dose", dosage.getMaxDose().toString());
            }
        }
        
        if(item.isLongTerm()  != null ){
            add(timingBody, "Long term", item.isLongTerm().toString());
        }
        
   
        
        StrucDocTable doseTable=null;
        if(dosage!= null && dosage.getDoseQuantity() != null ){ 
            // Structured dose
            doseTable = new StrucDocTable();
            addCaption(doseTable, "Structured Dose");
            addHeader(doseTable, fieldValueHeader );
            StrucDocTbody doseBody = addBody(doseTable);

            QuantityUnitDescription doseQty = dosage.getDoseQuantity();

            if (doseQty != null) {
                if (doseQty.getRealQuantity() != null) {
                    add( doseBody, "Quantity", doseQty.getRealQuantity().getValue() );
                }

                String dispensingUnit = "";
                if (doseQty.getCodedUnit() != null ) {
                    dispensingUnit = print( doseQty.getCodedUnit() );
                } else {
                    dispensingUnit = doseQty.getRealQuantity().getUnit();
                }
                add( doseBody, "Dispensing Unit", dispensingUnit );
                
                if (doseQty.getQuantityDescription() != null) {
                    add( doseBody, "Quantity Description", doseQty.getQuantityDescription() );
                }
            }

        }
     
       
        
       
       
       //Administration Details
        StrucDocTable admTable = new StrucDocTable();
        addCaption(admTable,"Administration Details");
        addHeader(admTable, fieldValueHeader);
        StrucDocTbody admBody = addBody(admTable);
        
        if(item.getRouteCode() != null){
            add(admBody ,"Route" , print(item.getRouteCode()) );
        }
        
        if(item.getApproachSiteCode() != null){
            add(admBody ,"Anatomical Site" , print(item.getApproachSiteCode()) );
        }
        
         if(item.getMethodCode() != null){
            add(admBody ,"Medication Delivery Method" , print(item.getMethodCode()) );
        }
        
        
        //entitlements
        StrucDocTable entTable = new StrucDocTable();
        addCaption(entTable, "ParticipantEntitlement Details");
        addHeader(entTable, fieldValueHeader);
        
        StrucDocTbody entBody = addBody(entTable);
       
        if (subjectOfCareEntitlement != null) {
            for (Entitlement e : subjectOfCareEntitlement) {
               add(entBody, e.getEntitlementType().getDisplayName() , e.getEntitlementNumber().getExtension() );
            }
        }
        
        
   
        
		JAXBElement<StrucDocTable> prescriptionItemTableJaxbElement = new ObjectFactory().createStrucDocTextTable( prescriptionItemTable );
		narrativeBlock.getContent().add( prescriptionItemTableJaxbElement );
		
		if(isTimingTableRequired){
    		JAXBElement<StrucDocTable>timmingTableJaxbElement = new ObjectFactory().createStrucDocTextTable( timmingTable );
    		narrativeBlock.getContent().add( timmingTableJaxbElement );
		}
		
		if(doseTable != null){
		JAXBElement<StrucDocTable>dosageTableJaxbElement = new ObjectFactory().createStrucDocTextTable( doseTable );
		narrativeBlock.getContent().add( dosageTableJaxbElement );
		}
	

        JAXBElement<StrucDocTable> admTableJaxbElement = new ObjectFactory().createStrucDocTextTable( admTable );
        narrativeBlock.getContent().add( admTableJaxbElement );		
       
        JAXBElement<StrucDocTable>entTableJaxbElement = new ObjectFactory().createStrucDocTextTable( entTable );
        narrativeBlock.getContent().add( entTableJaxbElement );
    }

	public static StrucDocText getObservationsSectionNarrativeBlock( Observations observations ) {
		
		StrucDocTable table = new StrucDocTable();
		addCaption(table, "Observations");
		addHeader(table, "Name", "Value", "Date");
		
		StrucDocTbody observationsTableBody = addBody(table);

		List<StrucDocTr> rows = observationsTableBody.getTr();
        if (observations.getBodyWeight() != null) {
			BodyWeight bodyWeight = observations.getBodyWeight();
			rows.add(
					createTableBodyRowWithCellValues( 
							Arrays.asList( "Body Weight",
							bodyWeight.getValue() + " " + bodyWeight.getUnit(),
							print( bodyWeight.getDateTimeOfObservation()  ))));
		}

		if (observations.getBodyHeight() != null) {
			BodyHeight bodyHeight = observations.getBodyHeight();
			rows.add(
					createTableBodyRowWithCellValues( Arrays.asList( "Body Height", bodyHeight.getValue() + " " + bodyHeight.getUnit(),
							 print( bodyHeight.getDateTimeOfObservation()  ) ) ) );
		}


		return textWithTable(table);
	}

	public static CD getWeightObservationCode() {
		SNOMED_AU_Code weightCode = new SNOMED_AU_Code( "27113001", "Body Weight" );
		return Converter.convertToCDCode( weightCode );
	}

	public static CD getHeightObservationCode() {
		SNOMED_AU_Code heightCode = new SNOMED_AU_Code( "50373000", "Body Height" );
		return Converter.convertToCDCode( heightCode );
	}
}

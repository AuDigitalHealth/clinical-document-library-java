package au.gov.nehta.builder.npdr.dispenserecord;

import static au.gov.nehta.builder.util.narrative.NarrativeUtil.booleanToYesNo;
import static au.gov.nehta.builder.util.narrative.NarrativeUtil.createTableBodyRowWithCells;
import static au.gov.nehta.builder.util.narrative.NarrativeUtil.getEntitlementCells;
import static au.gov.nehta.builder.util.narrative.NarrativeUtil.getSubjectOfCareEntitlementCells;

import java.util.List;

import javax.xml.bind.JAXBElement;

import au.gov.nehta.builder.DocumentCreatorUtil;
import au.gov.nehta.builder.util.narrative.NarrativeUtil;
import au.gov.nehta.model.clinical.etp.common.item.Ingredient;
import au.gov.nehta.model.clinical.etp.common.item.QuantityUnitDescription;
import au.gov.nehta.model.clinical.etp.common.participation.Entitlement;
import au.gov.nehta.model.clinical.etp.dispenserecord.DispenseItem;
import au.net.electronichealth.ns.cda._2_0.ObjectFactory;
import au.net.electronichealth.ns.cda._2_0.StrucDocTable;
import au.net.electronichealth.ns.cda._2_0.StrucDocTbody;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;

public class DispenseRecordCreatorUtil extends DocumentCreatorUtil{
	public static StrucDocText getDispenseItemSectionNarrativeBlock( DispenseItem item, List<Entitlement> subjectOfCareEntitlement, List<Entitlement> dispensingOrganisationEntitlement ) {
		StrucDocText narrativeBlock = new StrucDocText();

		StrucDocTable dispenseItemTable = new StrucDocTable();
		addCaption(dispenseItemTable,  "Dispense Item" );
		addHeader(dispenseItemTable, "Field", "Value" );
		StrucDocTbody itemTable = addBody(dispenseItemTable);
		
		
		add(itemTable, "Status", item.getDispensingStatus().getStatusCode() );
		add(itemTable, "Dispense Item Identifier", item.getDispenseItem().getExtension() );
		

		add(itemTable, "Date and Time of Dispense Event",
						NarrativeUtil.NARRATIVE_DATE_TIME_FORMATTER.print( item.getEventDate() ) ) ;

		add(itemTable,"Prescription Item Identifier", item.getPrescriptionItem().getExtension()  );

		if (item.getTheraputicGood().isCoded()) {
		    add(itemTable, "Therapeutic Good Identification", print(item.getTheraputicGood()) );
		} 

		if (item.getFormula() != null) {
		    add(itemTable, "Formula", item.getFormula() ) ;
		}
		
		if (item.getLabelInstruction() != null) {
            add(itemTable, "Label Instruction", item.getLabelInstruction() ) ;
        }

//		if(dispenseItem.getQuantityDispensed().getQuantityToDispense() != null){
//		    add(itemTable,"Quantity of Therapeutic Good", dispenseItem.getQuantityDispensed().getQuantityToDispense().getValue() ) ;
//		}
		add(itemTable,"Brand Substitution Occurred", NarrativeUtil.booleanToYesNo( item.isbrandSubstitutionOccured() ) );

		add(itemTable,"Maximum number of Repeats", item.getMaxRepeats().toString()  );

		add(itemTable, "Number of this Dispense", item.getNumberOfThisDispense().toString()  );

		
	 

		if( item.getCloseTheGapId() != null){
		    add(itemTable, "PBS Close the Gap Benefit", item.getCloseTheGapId().getExtension());
		}
		
		if(item.getPbsItemCode() != null){
		    add(itemTable, "PBS/RPBS Item Code", item.getPbsItemCode().getDisplayName());
		}
		
		if(item.getPbsManufactureCode() != null){
		    add(itemTable, "PBS/RPBS Manufacturer Code", item.getPbsManufactureCode().getExtension()+" "+ item.getPbsManufactureCode().getAssigningAuthorityName());
		}
		 
		add(itemTable, "Claim Category Type", print(item.getClaimTypeCategory()) );
		
		if (item.isEarlySupplyWithBenifit() != null && item.isEarlySupplyWithBenifit() ) {
		    add(itemTable, "Early Supply With Pharmaceutical Benefit",	booleanToYesNo( true ) );
		}

		
		if (item.getAdditionalComments() != null) {
		    add(itemTable, "Additional Comments", item.getAdditionalComments()  );
		}

		if (dispensingOrganisationEntitlement != null) {
			itemTable.getTr().add(
					createTableBodyRowWithCells( getEntitlementCells( "Dispensing Organisation Entitlements", dispensingOrganisationEntitlement ) ) );
		}

		if (subjectOfCareEntitlement != null) {
			itemTable.getTr().add( createTableBodyRowWithCells( getSubjectOfCareEntitlementCells( "Subject of Care Entitlements", subjectOfCareEntitlement ) ) );
		}

		JAXBElement<StrucDocTable> prescriptionItemTableJaxbElement = new ObjectFactory().createStrucDocTextTable( dispenseItemTable );
		narrativeBlock.getContent().add( prescriptionItemTableJaxbElement );

		//
		// Qunatity  
		//
		
		
        
        QuantityUnitDescription quantityDispensed = item.getQuantityDispensed();
		if(quantityDispensed != null){
		    StrucDocTable quantityTable = new StrucDocTable();
		    addHeader(quantityTable,  "Field", "Value" );
	        addCaption(quantityTable, "Quantity To Dispense");
	        StrucDocTbody quantityBody = addBody(quantityTable);
		   
	     
		    
		    add(quantityBody, "Quantity", quantityDispensed.getRealQuantity().getValue()  );
		    
		    String dispensingUnit="";
		    if(quantityDispensed.getCodedUnit() != null){
		        dispensingUnit= print(quantityDispensed.getCodedUnit());
		    }else{
		        dispensingUnit = quantityDispensed.getRealQuantity().getUnit();
		    }
		    add(quantityBody, "Dispensing Unit", dispensingUnit  );
		    
	        narrativeBlock.getContent().add( new ObjectFactory().createStrucDocTextTable( quantityTable ) );
	        
		}
	
	    
	    //
        // PBS Extemporaneous Ingredient  
        //
	    
        if(quantityDispensed != null){
            if(item.getExtemporaneousIngredients().size() > 0){
            StrucDocTable ingrTable = new StrucDocTable();
            
            addHeader(ingrTable, "Ingredient Name", "Ingredient Quantity");
            addCaption(ingrTable,"PBS Extemporaneous Ingredient");
            StrucDocTbody ingrBody = addBody(ingrTable);
            
            
            for(Ingredient i:item.getExtemporaneousIngredients()){
                add(ingrBody, print(i.getIngredientCode()), i.getQuantity().toString()  );
            }
            
           
            narrativeBlock.getContent().add( new ObjectFactory().createStrucDocTextTable( ingrTable ) );
            }
        }
        
	    
		return narrativeBlock;
	}
	
	 
}

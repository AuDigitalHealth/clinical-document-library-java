package au.gov.nehta.model.clinical.etp.dispenserecord;

import java.util.ArrayList;
import java.util.List;

import org.joda.time.DateTime;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.etp.common.item.Ingredient;
import au.gov.nehta.model.clinical.etp.common.item.QuantityUnitDescription;

public class DispenseItemImpl implements DispenseItem {

    Coded theraputicGood;
    DateTime eventDate;
    UniqueIdentifier prescriptionItem;
    UniqueIdentifier dispenseItem;
    
    String formula;                 //optional
    String labelInstruction;        //optional
    
    Boolean isbrandSubstitutionOccured; 
    
    Integer maxRepeats;
    Integer numberOfThisDispense; 
    
    UniqueIdentifier closeTheGapId;           //optional    
    
    Coded pbsItemCode;               //optional
    UniqueIdentifier pbsManufacturerCode;        //optional
    
    QuantityUnitDescription quantityDispensed; //optional
    
    List<Ingredient> extemporaneousIngredients = new ArrayList<Ingredient>();   //optional
    
    Coded claimTypeCategory;     
    Coded underCoPayment;            //optional
    Boolean earlySupplyWithBenifit;    //optional
    
    String additionalComments;      //optional
    
    Coded patientCategory;   
    
    String racfId;                  //optional

    DispensingStatusType status; 
    
    /**
     * use the DispenseItemBuilder instead 
     */
    protected DispenseItemImpl(){}
    
    
    /* (non-Javadoc)
     * @see au.gov.nehta.model.clinical.etp.dispenserecord.DispenseItems#getTheraputicGood()
     */
    @Override
    public Coded getTheraputicGood() {
        return theraputicGood;
    }

    /* (non-Javadoc)
     * @see au.gov.nehta.model.clinical.etp.dispenserecord.DispenseItems#getEventDate()
     */
    @Override
    public DateTime getEventDate() {
        return eventDate; 
    }

    /* (non-Javadoc)
     * @see au.gov.nehta.model.clinical.etp.dispenserecord.DispenseItems#getPrescriptionItem()
     */
    @Override
    public UniqueIdentifier getPrescriptionItem() {
        return prescriptionItem;
    }

    /* (non-Javadoc)
     * @see au.gov.nehta.model.clinical.etp.dispenserecord.DispenseItems#getDispenseItem()
     */
    @Override
    public UniqueIdentifier getDispenseItem() {
        return dispenseItem;
    }

    /* (non-Javadoc)
     * @see au.gov.nehta.model.clinical.etp.dispenserecord.DispenseItems#getFormula()
     */
    @Override
    public String getFormula() {
        return formula;
    }

    /* (non-Javadoc)
     * @see au.gov.nehta.model.clinical.etp.dispenserecord.DispenseItems#getLabelInstruction()
     */
    @Override
    public String getLabelInstruction() {
        return labelInstruction;
    }

    /* (non-Javadoc)
     * @see au.gov.nehta.model.clinical.etp.dispenserecord.DispenseItems#getIsbrandSubstitutionOccured()
     */
    @Override
    public Boolean isbrandSubstitutionOccured() {
        return isbrandSubstitutionOccured;
    }

    /* (non-Javadoc)
     * @see au.gov.nehta.model.clinical.etp.dispenserecord.DispenseItems#getMaxRepeats()
     */
    @Override
    public Integer getMaxRepeats() {
        return maxRepeats;
    }

    /* (non-Javadoc)
     * @see au.gov.nehta.model.clinical.etp.dispenserecord.DispenseItems#getNumberOfDispenses()
     */
    @Override
    public Integer getNumberOfThisDispense() {
        return numberOfThisDispense;
    }

    /* (non-Javadoc)
     * @see au.gov.nehta.model.clinical.etp.dispenserecord.DispenseItems#getCloseTheGapId()
     */
    @Override
    public UniqueIdentifier getCloseTheGapId() {
        return closeTheGapId;
    }

    /* (non-Javadoc)
     * @see au.gov.nehta.model.clinical.etp.dispenserecord.DispenseItems#getPbsItemCode()
     */
    @Override
    public Coded getPbsItemCode() {
        return pbsItemCode;
    }

    /* (non-Javadoc)
     * @see au.gov.nehta.model.clinical.etp.dispenserecord.DispenseItems#getPbsManufactureCode()
     */
    @Override
    public UniqueIdentifier getPbsManufactureCode() {
        return pbsManufacturerCode;
    }

    /* (non-Javadoc)
     * @see au.gov.nehta.model.clinical.etp.dispenserecord.DispenseItems#getQuantityDispensed()
     */
    @Override
    public QuantityUnitDescription getQuantityDispensed() {
        return quantityDispensed;
    }

    /* (non-Javadoc)
     * @see au.gov.nehta.model.clinical.etp.dispenserecord.DispenseItems#getExtemporaneousIngredients()
     */
    @Override
    public List<Ingredient> getExtemporaneousIngredients() {
        return extemporaneousIngredients;
    }

    /* (non-Javadoc)
     * @see au.gov.nehta.model.clinical.etp.dispenserecord.DispenseItems#getClaimTypeCategory()
     */
    @Override
    public Coded getClaimTypeCategory() {
        return claimTypeCategory;
    }

    /* (non-Javadoc)
     * @see au.gov.nehta.model.clinical.etp.dispenserecord.DispenseItems#getUnderCoPayment()
     */
    @Override
    public Coded getUnderCoPayment() {
        return underCoPayment;
    }

    /* (non-Javadoc)
     * @see au.gov.nehta.model.clinical.etp.dispenserecord.DispenseItems#getEarlySupplyWithBenifit()
     */
    @Override
    public Boolean isEarlySupplyWithBenifit() {
        return earlySupplyWithBenifit;
    }

    /* (non-Javadoc)
     * @see au.gov.nehta.model.clinical.etp.dispenserecord.DispenseItems#getAdditionalComments()
     */
    @Override
    public String getAdditionalComments() {
        return additionalComments;
    }

    /* (non-Javadoc)
     * @see au.gov.nehta.model.clinical.etp.dispenserecord.DispenseItems#getPatientCategory()
     */
    @Override
    public Coded getPatientCategory() {
        return patientCategory;
    }

    /* (non-Javadoc)
     * @see au.gov.nehta.model.clinical.etp.dispenserecord.DispenseItems#getRacfId()
     */
    @Override
    public String getRacfId() {
        return racfId;
    }


    public DispensingStatusType getDispensingStatus() {
        return status;
    }


    /**
     * @param theraputicGood the theraputicGood to set
     */
    public void setTheraputicGood( Coded theraputicGood ) {
        this.theraputicGood = theraputicGood;
    }


    /**
     * @param eventDate the eventDate to set
     */
    public void setEventDate( DateTime eventDate ) {
        this.eventDate = eventDate;  
    }


    /**
     * @param prescriptionItem the prescriptionItem to set
     */
    public void setPrescriptionItem( UniqueIdentifier prescriptionItem ) {
        this.prescriptionItem = prescriptionItem;
    }


    /**
     * @param dispenseItem the dispenseItem to set
     */
    public void setDispenseItem( UniqueIdentifier dispenseItem ) {
        this.dispenseItem = dispenseItem;
    }


    /**
     * @param formula the formula to set
     */
    public void setFormula( String formula ) {
        this.formula = formula;
    }


    /**
     * @param labelInstruction the labelInstruction to set
     */
    public void setLabelInstruction( String labelInstruction ) {
        this.labelInstruction = labelInstruction;
    }


    /**
     * @param isbrandSubstitutionOccured the isbrandSubstitutionOccured to set
     */
    public void setIsbrandSubstitutionOccured( Boolean isbrandSubstitutionOccured ) {
        this.isbrandSubstitutionOccured = isbrandSubstitutionOccured;
    }


    /**
     * @param maxRepeats the maxRepeats to set
     */
    public void setMaxRepeats( Integer maxRepeats ) {
        this.maxRepeats = maxRepeats;
    }


    /**
     * @param numberOfThisDispense the numberOfThisDispense to set
     */
    public void setNumberOfThisDispense( Integer numberOfThisDispense ) {
        this.numberOfThisDispense = numberOfThisDispense;
    }


    /**
     * @param closeTheGapId the closeTheGapId to set
     */
    public void setCloseTheGapId( UniqueIdentifier closeTheGapId ) {
        this.closeTheGapId = closeTheGapId;
    }


    /**
     * @param pbsItemCode the pbsItemCode to set
     */
    public void setPbsItemCode( Coded pbsItemCode ) {
        this.pbsItemCode = pbsItemCode;
    }


    /**
     * @param pbsManufacturerCode the pbsManufacturerCode to set
     */
    public void setPbsManufacturerCode( UniqueIdentifier pbsManufacturerCode ) {
        this.pbsManufacturerCode = pbsManufacturerCode;
    }


    /**
     * @param quantityDispensed the quantityDispensed to set
     */
    public void setQuantityDispensed( QuantityUnitDescription quantityDispensed ) {
        this.quantityDispensed = quantityDispensed;
    }


    /**
     * @param extemporaneousIngredients the extemporaneousIngredients to set
     */
    public void setExtemporaneousIngredients( List<Ingredient> extemporaneousIngredients ) {
        this.extemporaneousIngredients = extemporaneousIngredients;
    }


    /**
     * @param claimTypeCategory the claimTypeCategory to set
     */
    public void setClaimTypeCategory( Coded claimTypeCategory ) {
        this.claimTypeCategory = claimTypeCategory;
    }


    /**
     * @param underCoPayment the underCoPayment to set
     */
    public void setUnderCoPayment( Coded underCoPayment ) {
        this.underCoPayment = underCoPayment;
    }


    /**
     * @param earlySupplyWithBenifit the earlySupplyWithBenifit to set
     */
    public void setEarlySupplyWithBenifit( Boolean earlySupplyWithBenifit ) {
        this.earlySupplyWithBenifit = earlySupplyWithBenifit;
    }


    /**
     * @param additionalComments the additionalComments to set
     */
    public void setAdditionalComments( String additionalComments ) {
        this.additionalComments = additionalComments;
    }


    /**
     * @param patientCategory the patientCategory to set
     */
    public void setPatientCategory( Coded patientCategory ) {
        this.patientCategory = patientCategory;
    }


    /**
     * @param racfId the racfId to set
     */
    public void setRacfId( String racfId ) {
        this.racfId = racfId;
    }


    /**
     * @param status the status to set
     */
    public void setStatus( DispensingStatusType status ) {
        this.status = status;
    }

    
}

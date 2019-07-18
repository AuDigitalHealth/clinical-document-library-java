package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.cda.common.code.Coded;

public class KnownMedicationImpl implements KnownMedication {
    private Coded therapeuticGoodIdentification;
    private String directions;
    private String clinicalIndication;
    private String medicationInstructionComment;
    private Coded changeType;
    private Coded changeStatus;
    private String changeDesc;
    private String changeOrRecommendationReason;

    @Override
    public Coded getTherapeuticGoodIdentification() {
        return therapeuticGoodIdentification;
    }

    @Override
    public void setTherapeuticGoodIdentification(Coded therapeuticGoodIdentification) {
        this.therapeuticGoodIdentification = therapeuticGoodIdentification;
    }

    @Override
    public String getDirections() {
        return directions;
    }

    @Override
    public void setDirections(String directions) {
        this.directions = directions;
    }

    @Override
    public String getClinicalIndication() {
        return clinicalIndication;
    }

    @Override
    public void setClinicalIndication(String clinicalIndication) {
        this.clinicalIndication = clinicalIndication;
    }

    @Override
    public String getMedicationInstructionComment() {
        return medicationInstructionComment;
    }

    @Override
    public void setMedicationInstructionComment(String medicationInstructionComment) {
        this.medicationInstructionComment = medicationInstructionComment;
    }

    @Override
    public Coded getChangeType() {
        return changeType;
    }

    @Override
    public void setChangeType(Coded changeType) {
        this.changeType = changeType;
    }

    @Override
    public Coded getChangeStatus() {
        return changeStatus;
    }

    @Override
    public void setChangeStatus(Coded changeStatus) {
        this.changeStatus = changeStatus;
    }

    @Override
    public String getChangeDesc() {
        return changeDesc;
    }

    @Override
    public void setChangeDesc(String changeDesc) {
        this.changeDesc = changeDesc;
    }

    @Override
    public String getChangeOrRecommendationReason() {
        return changeOrRecommendationReason;
    }

    @Override
    public void setChangeOrRecommendationReason(String changeOrRecommendationReason) {
        this.changeOrRecommendationReason = changeOrRecommendationReason;
    }
}

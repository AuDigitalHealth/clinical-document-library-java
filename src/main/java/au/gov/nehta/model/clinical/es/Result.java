package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.cda.common.code.Coded;

public class Result {
    private Coded individualPathologyTestResultName;

    private ResultValue individualPathologyTestResultValue;

    private String individualPathologyTestResultComment;

    private String individualPathologyTestResultReferenceRangeGuidance;

    private Coded individualPathologyTestResultStatus;

    public Coded getIndividualPathologyTestResultName() {
        return individualPathologyTestResultName;
    }

    public void setIndividualPathologyTestResultName(Coded individualPathologyTestResultName) {
        this.individualPathologyTestResultName = individualPathologyTestResultName;
    }

    public ResultValue getIndividualPathologyTestResultValue() {
        return individualPathologyTestResultValue;
    }

    public void setIndividualPathologyTestResultValue(
            ResultValue individualPathologyTestResultValue) {
        this.individualPathologyTestResultValue = individualPathologyTestResultValue;
    }

    public String getIndividualPathologyTestResultComment() {
        return individualPathologyTestResultComment;
    }

    public void setIndividualPathologyTestResultComment(String individualPathologyTestResultComment) {
        this.individualPathologyTestResultComment = individualPathologyTestResultComment;
    }

    public String getIndividualPathologyTestResultReferenceRangeGuidance() {
        return individualPathologyTestResultReferenceRangeGuidance;
    }

    public void setIndividualPathologyTestResultReferenceRangeGuidance(
            String individualPathologyTestResultReferenceRangeGuidance) {
        this.individualPathologyTestResultReferenceRangeGuidance =
                individualPathologyTestResultReferenceRangeGuidance;
    }

    public Coded getIndividualPathologyTestResultStatus() {
        return individualPathologyTestResultStatus;
    }

    public void setIndividualPathologyTestResultStatus(Coded individualPathologyTestResultStatus) {
        this.individualPathologyTestResultStatus = individualPathologyTestResultStatus;
    }
}

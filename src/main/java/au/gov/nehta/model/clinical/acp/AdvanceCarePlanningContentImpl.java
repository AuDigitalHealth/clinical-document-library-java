package au.gov.nehta.model.clinical.acp;

public class AdvanceCarePlanningContentImpl implements AdvanceCarePlanningContent {

    private AdvanceCareInformationSection advanceCareInformationSection;

    @Override
    public AdvanceCareInformationSection getAdvanceCareInformationSection() {
        return advanceCareInformationSection;
    }

    @Override
    public void setAdvanceCareInformationSection(
            AdvanceCareInformationSection advanceCareInformationSection) {
        this.advanceCareInformationSection = advanceCareInformationSection;
    }
}

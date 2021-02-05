package au.gov.nehta.model.clinical.sl;

import au.gov.nehta.model.clinical.es.DiagnosticInvestigations;
import au.gov.nehta.model.clinical.es.Medications;
import au.gov.nehta.model.clinical.es.NewlyIdentifiedAdverseReactions;
import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;

public class SpecialistLetterContentImpl implements SpecialistLetterContent {

    private ResponseDetails responseDetails;
    private Recommendations recommendations;
    private Medications medications;
    private NewlyIdentifiedAdverseReactions newlyIdentifiedAdverseReactions;
    private DiagnosticInvestigations diagnosticInvestigations;
    private AttachedMedia reportFile;
    private StrucDocText customNarrativeText;
    private String customNarrativeTitle;

    public SpecialistLetterContentImpl(ResponseDetails responseDetails,
        Recommendations recommendations, Medications medications,
        NewlyIdentifiedAdverseReactions newlyIdentifiedAdverseReactions,
        DiagnosticInvestigations diagnosticInvestigations) {

        this.responseDetails = responseDetails;
        this.recommendations = recommendations;
        this.medications = medications;
        this.newlyIdentifiedAdverseReactions = newlyIdentifiedAdverseReactions;
        this.diagnosticInvestigations = diagnosticInvestigations;
    }

    public SpecialistLetterContentImpl(AttachedMedia reportFile) {
        this.reportFile = reportFile;
    }

    public SpecialistLetterContentImpl(String customNarrativeTitle,
        StrucDocText customNarrativeText) {

        this.customNarrativeTitle = customNarrativeTitle;
        this.customNarrativeText = customNarrativeText;
    }

    @Override
    public ResponseDetails getResponseDetails() {
        return responseDetails;
    }

    @Override
    public Recommendations getRecommendations() {
        return recommendations;
    }

    @Override
    public Medications getMedications() {
        return medications;
    }

    @Override
    public StrucDocText getCustomNarrativeMedications() {
        return null;
    }

    @Override
    public void setCustomNarrativeMedications(StrucDocText customNarrativeMedications) {

    }

    @Override
    public NewlyIdentifiedAdverseReactions getNewlyIdentifiedAdverseReactions() {
        return newlyIdentifiedAdverseReactions;
    }

    @Override
    public DiagnosticInvestigations getDiagnosticInvestigations() {
        return diagnosticInvestigations;
    }

    @Override
    public void setResponseDetails(ResponseDetails responseDetails) {
        this.responseDetails = responseDetails;
    }

    @Override
    public void setRecommendations(Recommendations recommendations) {
        this.recommendations = recommendations;
    }

    @Override
    public void setMedications(Medications medications) {
        this.medications = medications;
    }

    @Override
    public void setNewlyIdentifiedAdverseReactions(
        NewlyIdentifiedAdverseReactions newlyIdentifiedAdverseReactions) {

        this.newlyIdentifiedAdverseReactions = newlyIdentifiedAdverseReactions;
    }

    @Override
    public void setDiagnosticInvestigations(
        DiagnosticInvestigations diagnosticInvestigations) {

        this.diagnosticInvestigations = diagnosticInvestigations;
    }

    @Override
    public AttachedMedia getReportFile() {
        return reportFile;
    }

    @Override
    public void setReportFile(AttachedMedia reportFile) {
        this.reportFile = reportFile;
    }

    public StrucDocText getCustomNarrativeText() {
        return customNarrativeText;
    }

    public void setCustomNarrativeText(StrucDocText customNarrativeText) {
        this.customNarrativeText = customNarrativeText;
    }

    public String getCustomNarrativeTitle() {
        return customNarrativeTitle;
    }

    public void setCustomNarrativeTitle(String customNarrativeTitle) {
        this.customNarrativeTitle = customNarrativeTitle;
    }
}

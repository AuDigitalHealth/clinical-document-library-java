package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;

public class EventSummaryContentImpl implements EventSummaryContent {

    private StrucDocText customNarrativeAdministrativeObservations;
    private AttachedMedia structuredBodyFiles;
    private Medications medications;
    private StrucDocText customNarrativeMedications;
    private EventDetails eventDetails;
    private NewlyIdentifiedAdverseReactions newlyIdentifiedAdverseReactions;
    private DiagnosesInterventions diagnosesInterventions;
    private Immunisations immunisations;
    private StrucDocText customNarrativeImmunisations;
    private DiagnosticInvestigations diagnosticInvestigations;

    public EventSummaryContentImpl(StrucDocText customNarrativeAdministrativeObservations,
                                   AttachedMedia structuredBodyFiles, Medications medications,
                                   StrucDocText customNarrativeMedications, EventDetails eventDetails,
                                   NewlyIdentifiedAdverseReactions newlyIdentifiedAdverseReactions,
                                   DiagnosesInterventions diagnosesInterventions, Immunisations immunisations,
                                   StrucDocText customNarrativeImmunisations,
                                   DiagnosticInvestigations diagnosticInvestigations) {
        this.customNarrativeAdministrativeObservations = customNarrativeAdministrativeObservations;
        this.structuredBodyFiles = structuredBodyFiles;
        this.medications = medications;
        this.customNarrativeMedications = customNarrativeMedications;
        this.eventDetails = eventDetails;
        this.newlyIdentifiedAdverseReactions = newlyIdentifiedAdverseReactions;
        this.diagnosesInterventions = diagnosesInterventions;
        this.immunisations = immunisations;
        this.customNarrativeImmunisations = customNarrativeImmunisations;
        this.diagnosticInvestigations = diagnosticInvestigations;
    }


    @Override
    public StrucDocText getCustomNarrativeAdministrativeObservations() {
        return customNarrativeAdministrativeObservations;
    }

    @Override
    public AttachedMedia getStructuredBodyFiles() {
        return structuredBodyFiles;
    }

    @Override
    public Medications getMedications() {
        return medications;
    }

    @Override
    public StrucDocText getCustomNarrativeMedications() {
        return customNarrativeMedications;
    }

    @Override
    public EventDetails getEventDetails() {
        return eventDetails;
    }

    @Override
    public NewlyIdentifiedAdverseReactions getNewlyIdentifiedAdverseReactions() {
        return newlyIdentifiedAdverseReactions;
    }

    @Override
    public DiagnosesInterventions getDiagnosesInterventions() {
        return diagnosesInterventions;
    }

    @Override
    public Immunisations getImmunisations() {
        return immunisations;
    }

    @Override
    public StrucDocText getCustomNarrativeImmunisations() {
        return customNarrativeImmunisations;
    }

    @Override
    public DiagnosticInvestigations getDiagnosticInvestigations() {
        return diagnosticInvestigations;
    }

    @Override
    public void setCustomNarrativeAdministrativeObservations(StrucDocText customNarrativeAdministrativeObservations) {
        this.customNarrativeAdministrativeObservations = customNarrativeAdministrativeObservations;
    }

    @Override
    public void setStructuredBodyFiles(AttachedMedia structuredBodyFiles) {
        this.structuredBodyFiles = structuredBodyFiles;
    }

    @Override
    public void setMedications(Medications medications) {
        this.medications = medications;
    }

    @Override
    public void setCustomNarrativeMedications(StrucDocText customNarrativeMedications) {
        this.customNarrativeMedications = customNarrativeMedications;
    }

    @Override
    public void setEventDetails(EventDetails eventDetails) {
        this.eventDetails = eventDetails;
    }

    @Override
    public void setNewlyIdentifiedAdverseReactions(NewlyIdentifiedAdverseReactions newlyIdentifiedAdverseReactions) {
        this.newlyIdentifiedAdverseReactions = newlyIdentifiedAdverseReactions;
    }

    @Override
    public void setDiagnosesInterventions(DiagnosesInterventions diagnosesInterventions) {
        this.diagnosesInterventions = diagnosesInterventions;
    }

    @Override
    public void setImmunisations(Immunisations immunisations) {
        this.immunisations = immunisations;
    }

    @Override
    public void setCustomNarrativeImmunisations(StrucDocText customNarrativeImmunisations) {
        this.customNarrativeImmunisations = customNarrativeImmunisations;
    }

    @Override
    public void setDiagnosticInvestigations(DiagnosticInvestigations diagnosticInvestigations) {
        this.diagnosticInvestigations = diagnosticInvestigations;
    }
}

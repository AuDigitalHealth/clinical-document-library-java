package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;

public interface EventSummaryContent {

    StrucDocText getCustomNarrativeAdministrativeObservations();

    AttachedMedia getStructuredBodyFiles();

    Medications getMedications();

    StrucDocText getCustomNarrativeMedications();

    EventDetails getEventDetails();

    NewlyIdentifiedAdverseReactions getNewlyIdentifiedAdverseReactions();  //TODO Check : called Adverse Reactions in .Net of type (IAdverseReactionsWithoutExclusions) (Is there a difference?)

    DiagnosesInterventions getDiagnosesInterventions();

    Immunisations getImmunisations();

    StrucDocText getCustomNarrativeImmunisations();

    DiagnosticInvestigations getDiagnosticInvestigations();


    void setCustomNarrativeAdministrativeObservations(StrucDocText customNarrativeAdministrativeObservations);

    void setStructuredBodyFiles(AttachedMedia attachedMedia);

    void setMedications(Medications medications);

    void setCustomNarrativeMedications(StrucDocText customNarrativeMedications);

    void setEventDetails(EventDetails eventDetails);

    void setNewlyIdentifiedAdverseReactions(NewlyIdentifiedAdverseReactions newlyIdentifiedAdverseReactions);

    void setDiagnosesInterventions(DiagnosesInterventions diagnosesInterventions);

    void setImmunisations(Immunisations immunisations);

    void setCustomNarrativeImmunisations(StrucDocText customNarrativeImmunisations);

    void setDiagnosticInvestigations(DiagnosticInvestigations diagnosticInvestigations);

    //TODO Missing Validation

}







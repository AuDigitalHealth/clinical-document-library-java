package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.clinical.common.ProblemDiagnosis;
import au.gov.nehta.model.clinical.common.UncatagorisedMedicalHistoryItem;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import java.util.List;


public class DiagnosesInterventions {
    private List<ProblemDiagnosis> problemDiagnoses;
    private List<Procedure> procedures;
    private List<UncatagorisedMedicalHistoryItem> uncatagorisedMedicalHistoryItems;
    private StrucDocText customNarrativeDiagnosesIntervention;

    public List<ProblemDiagnosis> getProblemDiagnoses() {
        return problemDiagnoses;
    }

    public void setProblemDiagnoses(List<ProblemDiagnosis> problemDiagnoses) {
        this.problemDiagnoses = problemDiagnoses;
    }

    public List<Procedure> getProcedures() {
        return procedures;
    }

    public void setProcedures(List<Procedure> procedures) {
        this.procedures = procedures;
    }

    public List<UncatagorisedMedicalHistoryItem> getUncatagorisedMedicalHistoryItems() {
        return uncatagorisedMedicalHistoryItems;
    }

    public void setUncatagorisedMedicalHistoryItems(
            List<UncatagorisedMedicalHistoryItem> uncatagorisedMedicalHistoryItems) {
        this.uncatagorisedMedicalHistoryItems = uncatagorisedMedicalHistoryItems;
    }

    public StrucDocText getCustomNarrativeDiagnosesIntervention() {
        return customNarrativeDiagnosesIntervention;
    }

    public void setCustomNarrativeDiagnosesIntervention(
            StrucDocText customNarrativeDiagnosesIntervention) {
        this.customNarrativeDiagnosesIntervention = customNarrativeDiagnosesIntervention;
    }
}

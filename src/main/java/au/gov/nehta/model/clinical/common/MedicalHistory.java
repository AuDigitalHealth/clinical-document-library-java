package au.gov.nehta.model.clinical.common;

import au.gov.nehta.model.clinical.es.Procedure;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;

import java.util.List;


public class MedicalHistory {

    private List<ProblemDiagnosis> problemDiagnoses;
    private List<Procedure> procedures;
    private List<UncategorisedMedicalHistoryItem> uncategorisedMedicalHistoryItems;
    private StrucDocText customNarrative;

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

    public List<UncategorisedMedicalHistoryItem> getUncategorisedMedicalHistoryItems() {
        return uncategorisedMedicalHistoryItems;
    }

    public void setUncategorisedMedicalHistoryItems(
            List<UncategorisedMedicalHistoryItem> uncategorisedMedicalHistoryItems) {
        this.uncategorisedMedicalHistoryItems = uncategorisedMedicalHistoryItems;
    }

    public StrucDocText getCustomNarrative() {
        return customNarrative;
    }

    public void setCustomNarrative(
            StrucDocText customNarrative) {
        this.customNarrative = customNarrative;
    }
}

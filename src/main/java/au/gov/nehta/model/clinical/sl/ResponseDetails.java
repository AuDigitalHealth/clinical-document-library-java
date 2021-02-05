package au.gov.nehta.model.clinical.sl;

import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import java.util.List;

public interface ResponseDetails {

    StrucDocText getCustomNarrative();

    void setCustomNarrative(StrucDocText customNarrative);

    List<Diagnosis> getDiagnoses();

    List<Procedure> getProcedures();

    List<OtherDiagnosisProcedureEntry> getOtherDiagnosisProcedureEntries();

    ResponseNarrative getResponseNarrative();

    void setDiagnoses(List<Diagnosis> diagnoses);

    void setProcedures(List<Procedure> procedures);

    void setOtherDiagnosisProcedureEntries(List<OtherDiagnosisProcedureEntry> otherDiagnosisProcedureEntries);

    void setResponseNarrative(ResponseNarrative responseNarrative);
}

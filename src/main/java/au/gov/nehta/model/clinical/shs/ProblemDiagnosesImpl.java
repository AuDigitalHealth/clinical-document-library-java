package au.gov.nehta.model.clinical.shs;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.code.NCTISGlobalStatement;
import au.gov.nehta.model.clinical.common.ProblemDiagnosis;

import java.util.List;

/**
 * The problems and/or diagnoses that form part of the current and past
 * medical history of the subject of care.
 */
public class ProblemDiagnosesImpl extends ExclusionStatementImpl implements ProblemDiagnoses {

    private List<ProblemDiagnosis> diagnoses;

    /**
     * 
     * @param exclusionStatement
     * 
     *            Statements that positively assert that the patient does not
     *            have the problem or diagnosis.
     */
    public ProblemDiagnosesImpl(Coded exclusionStatement) {
        super(exclusionStatement);
    }

    /**
     * @param diagnoses
     * The problems and/or diagnoses that form part of the current and past
     * medical history of the subject of care.
     */
    public ProblemDiagnosesImpl(List<ProblemDiagnosis> diagnoses) {
        ArgumentUtils.checkNotNullNorEmpty(diagnoses, "diagnoses");
        this.diagnoses = diagnoses;
    }

    /**
     * Convenience method for a likely case.
     */
    public static ProblemDiagnoses noneKnown(){
        return new ProblemDiagnosesImpl(NCTISGlobalStatement.NONE_KNOWN);
    }

    /**
     * The problems and/or diagnoses that form part of the current and past
     * medical history of the subject of care.
     */
    @Override
    public List<ProblemDiagnosis> getDiagnoses() {
        return diagnoses;
    }
}

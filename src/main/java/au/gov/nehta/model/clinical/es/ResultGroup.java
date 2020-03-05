package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.cda.common.code.Coded;
import java.util.List;

/*
 * PATHOLOGY TEST RESULT GROUP
 * */
public class ResultGroup {

    private Coded pathologyTestResultGroupName;

    private List<Result> individualPathologyTestResults;

    private TestSpecimenDetail resultGroupSpecimenDetail;

    public Coded getPathologyTestResultGroupName() {
        return pathologyTestResultGroupName;
    }

    public void setPathologyTestResultGroupName(Coded pathologyTestResultGroupName) {
        this.pathologyTestResultGroupName = pathologyTestResultGroupName;
    }

    public List<Result> getIndividualPathologyTestResults() {
        return individualPathologyTestResults;
    }

    public void setIndividualPathologyTestResults(List<Result> individualPathologyTestResults) {
        this.individualPathologyTestResults = individualPathologyTestResults;
    }

    public TestSpecimenDetail getResultGroupSpecimenDetail() {
        return resultGroupSpecimenDetail;
    }

    public void setResultGroupSpecimenDetail(TestSpecimenDetail resultGroupSpecimenDetail) {
        this.resultGroupSpecimenDetail = resultGroupSpecimenDetail;
    }
}

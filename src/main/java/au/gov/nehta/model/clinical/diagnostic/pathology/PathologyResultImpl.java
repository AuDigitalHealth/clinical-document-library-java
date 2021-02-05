package au.gov.nehta.model.clinical.diagnostic.pathology;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.code.DiagnosticServiceCode;
import au.gov.nehta.model.cda.common.code.SNOMED_CT_ResultStatusCode;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifierImpl;

import java.time.ZonedDateTime;

/**
 * PATHOLOGY TEST RESULT
 */
public class PathologyResultImpl implements PathologyResult {
    private UniqueIdentifier id = UniqueIdentifierImpl.random();
    private UniqueIdentifier timeId = UniqueIdentifierImpl.random();
    private Coded testName;
    private DiagnosticServiceCode diagnosticService;
    private ZonedDateTime testTime;
    private SpecimenDetail specimenDetail;
    private Coded testResultStatus;


    public PathologyResultImpl(Coded testName,
                               DiagnosticServiceCode diagnosticService,
                               ZonedDateTime testTime,
                               SpecimenDetail specimenDetail,
                               SNOMED_CT_ResultStatusCode testResultStatus
    ) {
        ArgumentUtils.checkNotNull(diagnosticService, "PathologyResult diagnosticService");
        ArgumentUtils.checkNotNull(testName, "PathologyResult testName");
        ArgumentUtils.checkNotNull(testTime, "PathologyResult testTime");
        ArgumentUtils.checkNotNull(specimenDetail, "PathologyResult specimenDetail");
        ArgumentUtils.checkNotNull(testResultStatus, "PathologyResult testResultStatus");

        if (!(testResultStatus == SNOMED_CT_ResultStatusCode.FINAL_RESULTS ||
                testResultStatus == SNOMED_CT_ResultStatusCode.PRELIMINARY ||
                testResultStatus == SNOMED_CT_ResultStatusCode.CORRECTION_TO_RESULTS
        )) {
            throw new IllegalArgumentException("testResultStatus code must be (P)RELIMINARY (F)INAL_RESULTS or (C)ORRECTION_TO_RESULTS");
        }

        this.testName = testName;
        this.diagnosticService = diagnosticService;
        this.testTime = testTime;
        this.specimenDetail = specimenDetail;
        this.testResultStatus = testResultStatus;
    }

    @Override
    public SpecimenDetail getSpecimenDetail() {
        return specimenDetail;
    }

    @Override
    public UniqueIdentifier getId() {
        return id;
    }

    /**
     * Set the ID for the Pathology Result Section of the CDA document.
     * If not explicitly set this will become a random UUID.
     *
     * @param id
     */
    public void setId(UniqueIdentifier id) {
        this.id = id;
    }

    @Override
    public Coded getPathologyTestResultName() {
        return testName;
    }

    @Override
    public Coded getDiagnosticService() {
        return diagnosticService;
    }

    @Override
    public ZonedDateTime getTestTime() {
        return testTime;
    }

    /**
     * This field is mapped to the ID under entryRelationship[tst_date]/observation/id
     * in the IG for the test time and is mostly harmless.
     * <p>
     * Set the ID for the Pathology Result Section of the CDA document.
     * If not explicitly set this will become a random UUID.
     *
     * @param id UniqueIdentifier, a random UUID if never supplied
     */
    public void setTimeId(UniqueIdentifier id) {
        this.id = id;
    }

    @Override
    public UniqueIdentifier getTestTimeId() {
        return timeId;
    }

    @Override
    public Coded getResultStatus() {
        return testResultStatus;
    }
}

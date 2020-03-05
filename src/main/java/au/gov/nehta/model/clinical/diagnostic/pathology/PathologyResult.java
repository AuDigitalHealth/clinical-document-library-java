package au.gov.nehta.model.clinical.diagnostic.pathology;

import org.joda.time.DateTime;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;

public interface PathologyResult {
    public Coded getPathologyTestResultName();
    public SpecimenDetail getSpecimenDetail();
    public UniqueIdentifier getId();
    public Coded getDiagnosticService();
    public DateTime getTestTime();
    public UniqueIdentifier getTestTimeId();
    public Coded getResultStatus();
}

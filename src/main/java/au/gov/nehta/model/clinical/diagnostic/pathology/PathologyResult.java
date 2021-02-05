package au.gov.nehta.model.clinical.diagnostic.pathology;

import java.time.ZonedDateTime;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;

public interface PathologyResult {
    Coded getPathologyTestResultName();

    SpecimenDetail getSpecimenDetail();

    UniqueIdentifier getId();

    Coded getDiagnosticService();

    ZonedDateTime getTestTime();

    UniqueIdentifier getTestTimeId();

    Coded getResultStatus();
}

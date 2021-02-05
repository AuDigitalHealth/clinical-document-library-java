package au.gov.nehta.model.clinical.shs;

import au.gov.nehta.model.clinical.common.KnownMedication;

import java.util.List;

/*
 * Medicine which the subject of care is using. This includes
 * self-prescribed, clinician prescribed and non-prescription medicines.
 */
public interface Medications extends ExclusionStatement {

    /**
     * Medicines which the subject of care is using. This includes
     * self-prescribed, clinician prescribed and non-prescription medicines.
     */
    List<KnownMedication> getKnownMedications();
}

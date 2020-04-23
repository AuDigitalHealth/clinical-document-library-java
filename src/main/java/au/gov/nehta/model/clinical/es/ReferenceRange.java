package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.clinical.common.types.QuantityRange;

public class ReferenceRange {
    private Coded referenceRangeMeaning;
    private QuantityRange referenceRange;

    public Coded getReferenceRangeMeaning() {
        return referenceRangeMeaning;
    }

    public void setReferenceRangeMeaning(Coded referenceRangeMeaning) {
        this.referenceRangeMeaning = referenceRangeMeaning;
    }

    public QuantityRange getReferenceRange() {
        return referenceRange;
    }

    public void setReferenceRange(QuantityRange referenceRange) {
        this.referenceRange = referenceRange;
    }
}

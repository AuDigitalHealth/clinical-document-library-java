package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.cda.common.code.Coded;

public class CollectionAndHandling {
    protected Coded samplingPreconditions;

    public Coded getSamplingPreconditions() {
        return samplingPreconditions;
    }

    public void setSamplingPreconditions(Coded samplingPreconditions) {
        this.samplingPreconditions = samplingPreconditions;
    }
}

package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.cda.common.code.SNOMED_AU_Code;

public class SpecificLocation {
    protected SNOMED_AU_Code anatomicalLocationName;
    protected SNOMED_AU_Code side;

    public SpecificLocation(SNOMED_AU_Code anatomicalLocationName,
        SNOMED_AU_Code side) {
        this.anatomicalLocationName = anatomicalLocationName;
        this.side = side;
    }

    public SNOMED_AU_Code getAnatomicalLocationName() {
        return anatomicalLocationName;
    }

    public void setAnatomicalLocationName(SNOMED_AU_Code anatomicalLocationName) {
        this.anatomicalLocationName = anatomicalLocationName;
    }

    public SNOMED_AU_Code getSide() {
        return side;
    }

    public void setSide(SNOMED_AU_Code side) {
        this.side = side;
    }
}

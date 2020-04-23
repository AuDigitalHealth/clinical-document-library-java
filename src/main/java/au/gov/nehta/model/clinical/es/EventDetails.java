package au.gov.nehta.model.clinical.es;

import au.net.electronichealth.ns.cda._2_0.StrucDocText;

/**
 *
 */
public class EventDetails {
    /**
     * Clinical Synopsis Description
     */
    private String clinicalSynopsisDesc;

    private StrucDocText customNarrative;

    public String getClinicalSynopsisDesc() {
        return clinicalSynopsisDesc;
    }

    public StrucDocText getCustomNarrative() {
        return customNarrative;
  }

    public void setClinicalSynopsisDesc(String clinicalSynopsisDesc) {
        this.clinicalSynopsisDesc = clinicalSynopsisDesc;
    }

    public void setCustomNarrative(StrucDocText customNarrative) {
        this.customNarrative = customNarrative;
    }

}

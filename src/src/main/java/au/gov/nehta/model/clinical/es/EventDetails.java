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

    private StrucDocText customNarrativeEventDetails;  //TODO Check if this is required (Exists in .NET, not in CDA)

    public EventDetails(String clinicalSynopsisDesc, StrucDocText customNarrativeEventDetails) {
        this.clinicalSynopsisDesc = clinicalSynopsisDesc;
        this.customNarrativeEventDetails = customNarrativeEventDetails;
    }

    public String getClinicalSynopsisDesc() {
        return clinicalSynopsisDesc;
    }

    public StrucDocText getCustomNarrativeEventDetails() {
        return customNarrativeEventDetails;
  }

  //TODO  Validation Required
}

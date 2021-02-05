package au.gov.nehta.model.clinical.sr;

import au.gov.nehta.model.cda.common.code.Coded;
import java.util.List;

public class InterpreterRequiredAlert {

    private Coded alertDescription;
    private List<Coded> preferredLanguages;

    public Coded getAlertDescription() {
        return alertDescription;
    }

    public void setAlertDescription(Coded alertDescription) {
        this.alertDescription = alertDescription;
    }

    public List<Coded> getPreferredLanguages() {
        return preferredLanguages;
    }

    public void setPreferredLanguages(List<Coded> preferredLanguages) {
        this.preferredLanguages = preferredLanguages;
    }
}

package au.gov.nehta.model.clinical.ds;

import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;

public interface DischargeSummaryContent {

    Event getEvent();

    Medications getMedications();

    HealthProfile getHealthProfile();

    Plan getPlan();

    void setEvent(Event event);

    void setMedications(Medications medications);

    void setHealthProfile(HealthProfile healthProfile);

    void setPlan(Plan plan);

    AttachedMedia getReportFile();

    void setReportFile(AttachedMedia reportFile);

    String getCustomNarrativeTitle();

    void setCustomNarrativeTitle(String customNarrativeTitle);

    StrucDocText getCustomNarrativeText();
}

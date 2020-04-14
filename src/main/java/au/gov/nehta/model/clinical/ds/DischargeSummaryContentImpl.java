package au.gov.nehta.model.clinical.ds;

import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;

public class DischargeSummaryContentImpl implements DischargeSummaryContent {

  private Event event;
  private Medications medications;
  private HealthProfile healthProfile;
  private Plan plan;
  private AttachedMedia reportFile;
  private StrucDocText customNarrativeText;
  private String customNarrativeTitle;

  public DischargeSummaryContentImpl(Event event, Medications medications,
      HealthProfile healthProfile, Plan plan) {
    this.event = event;
    this.medications = medications;
    this.healthProfile = healthProfile;
    this.plan = plan;
  }

  public DischargeSummaryContentImpl(AttachedMedia reportFile) {
    this.reportFile = reportFile;
  }

  public DischargeSummaryContentImpl(String customNarrativeTitle,
      StrucDocText customNarrativeText) {
    this.customNarrativeTitle = customNarrativeTitle;
    this.customNarrativeText = customNarrativeText;
  }

  @Override
  public Event getEvent() {
    return event;
  }

  @Override
  public Medications getMedications() {
    return medications;
  }

  @Override
  public HealthProfile getHealthProfile() {
    return healthProfile;
  }

  @Override
  public Plan getPlan() {
    return plan;
  }

  @Override
  public void setEvent(Event event) {
    this.event = event;
  }

  @Override
  public void setMedications(Medications medications) {
    this.medications = medications;
  }

  @Override
  public void setHealthProfile(HealthProfile healthProfile) {
    this.healthProfile = healthProfile;
  }

  @Override
  public void setPlan(Plan plan) {
    this.plan = plan;
  }

  @Override
  public AttachedMedia getReportFile() {
    return reportFile;
  }

  @Override
  public void setReportFile(AttachedMedia reportFile) {
    this.reportFile = reportFile;
  }

  @Override
  public String getCustomNarrativeTitle() {
    return customNarrativeTitle;
  }

  @Override
  public void setCustomNarrativeTitle(String customNarrativeTitle) {
    this.customNarrativeTitle = customNarrativeTitle;
  }

  @Override
  public StrucDocText getCustomNarrativeText() {
    return customNarrativeText;
  }
}

package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;

public class OtherTestResultImpl implements OtherTestResult {

  private Coded reportName;
  private Coded reportStatus;
  private StrucDocText customNarrative;
  private PreciseDate reportDate;
  private AttachedMedia reportFile;
  private String reportContent;

  public OtherTestResultImpl(Coded reportName, Coded reportStatus,
      PreciseDate reportDate, AttachedMedia reportFie) {
    this.reportName = reportName;
    this.reportStatus = reportStatus;
    this.reportDate = reportDate;
    this.reportFile = reportFie;
    this.reportContent = null;
  }

  public OtherTestResultImpl(Coded reportName, Coded reportStatus,
      PreciseDate reportDate, String reportContent) {
    this.reportName = reportName;
    this.reportStatus = reportStatus;
    this.reportDate = reportDate;
    this.reportContent = reportContent;
    this.reportFile = null;
  }

  @Override
  public Coded getReportName() {
    return reportName;
  }

  public void setReportName(Coded reportName) {
    this.reportName = reportName;
  }

  @Override
  public Coded getReportStatus() {
    return reportStatus;
  }

  @Override
  public void setReportStatus(Coded reportStatus) {
    this.reportStatus = reportStatus;
  }

  @Override
  public StrucDocText getCustomNarrative() {
    return customNarrative;
  }

  @Override
  public void setCustomNarrative(StrucDocText customNarrative) {
    this.customNarrative = customNarrative;
  }

  @Override
  public PreciseDate getReportDate() {
    return reportDate;
  }

  @Override
  public void setReportDate(PreciseDate reportDate) {
    this.reportDate = reportDate;
  }

  @Override
  public AttachedMedia getReportFile() {
    return reportFile;
  }

  @Override
  public void setReportFile(AttachedMedia reportFile) {
    this.reportFile = reportFile;
    this.reportContent = null;
  }

  @Override
  public String getReportContent() {
    return reportContent;
  }

  @Override
  public void setReportContent(String reportContent) {
    this.reportContent = reportContent;
    this.reportFile = null;
  }
}

package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;

public interface OtherTestResult {

    Coded getReportName();

    Coded getReportStatus();

    PreciseDate getReportDate();

    //TODO  public EncapsulatedData ReportContent as per .net

    StrucDocText getCustomNarrative();

    void setReportName(Coded reportName);

    void setReportStatus(Coded reportStatus);

    void setReportDate(PreciseDate preciseDate);

    void setCustomNarrative(StrucDocText customNarrative);

    AttachedMedia getReportFile();

    void setReportFile(AttachedMedia reportFile);

    String getReportContent();

    void setReportContent(String reportContent);

  Class getExecutingClass();

  void setExecutingClass(Class executingClass);
}

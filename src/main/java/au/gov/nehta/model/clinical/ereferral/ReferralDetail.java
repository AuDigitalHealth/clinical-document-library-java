package au.gov.nehta.model.clinical.ereferral;

import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProvider;

public class ReferralDetail {

  private PreciseDate referralDateTime;
  private String referralReason;
  private RestrictedTimeInterval referralValidityDuration;
  private ParticipationServiceProvider usualGP;
  private ParticipationServiceProvider referee;

  public PreciseDate getReferralDateTime() {
    return referralDateTime;
  }

  public void setReferralDateTime(PreciseDate referralDateTime) {
    this.referralDateTime = referralDateTime;
  }

  public String getReferralReason() {
    return referralReason;
  }

  public void setReferralReason(String referralReason) {
    this.referralReason = referralReason;
  }

  public RestrictedTimeInterval getReferralValidityDuration() {
    return referralValidityDuration;
  }

  public void setReferralValidityDuration(
      RestrictedTimeInterval referralValidityDuration) {
    this.referralValidityDuration = referralValidityDuration;
  }

  public ParticipationServiceProvider getUsualGP() {
    return usualGP;
  }

  public void setUsualGP(
      ParticipationServiceProvider usualGP) {
    this.usualGP = usualGP;
  }

  public ParticipationServiceProvider getReferee() {
    return referee;
  }

  public void setReferee(
      ParticipationServiceProvider referee) {
    this.referee = referee;
  }
}

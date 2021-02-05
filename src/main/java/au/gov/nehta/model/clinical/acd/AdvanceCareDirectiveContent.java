package au.gov.nehta.model.clinical.acd;

import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProvider;

import java.util.List;

public interface AdvanceCareDirectiveContent {

    List<ParticipationServiceProvider> getACDCustodians();

    void setACDCustodians(List<ParticipationServiceProvider> acdCustodians);
}

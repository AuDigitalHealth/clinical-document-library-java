package au.gov.nehta.model.clinical.etp.common.participation;

import au.gov.nehta.model.cda.common.id.AsEntityIdentifier;
import au.gov.nehta.model.cda.common.telecom.Telecom;
import java.util.List;

public interface Participant {

  AsEntityIdentifier getEntityIdentifiers();

  ProviderAddress getAddresses();

  List<Telecom> getElectronicCommunicationDetail();

  void setAddress(ProviderAddress address);

  void addElectronicCommunicationDetail(Telecom electronicCommunicationDetail);

  void setElectronicCommunicationDetail(List<Telecom> electronicCommunicationDetail);

}

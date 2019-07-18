package au.gov.nehta.model.clinical.diagnostic.pathology;

import java.util.List;

import au.gov.nehta.model.cda.common.telecom.Telecom;
import au.gov.nehta.model.clinical.etp.common.participation.AddressContext;

public interface ExtendedEmploymentOrganisation extends EmploymentOrganisation {
	  public List<? extends Telecom> getElectronicCommunicationDetails();
      public List<? extends AddressContext> getAddresses();
}

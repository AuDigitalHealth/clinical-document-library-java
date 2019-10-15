package au.gov.nehta.model.cda.common.person_org;

import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.clinical.etp.common.participation.Entitlement;
import au.gov.nehta.model.clinical.etp.common.participation.PersonWithOrganization;
import java.util.List;

public interface PersonHealthcareProvider extends PersonWithOrganization, PersonWithRelationship {

  List<Entitlement> getEntitlements();

  void setEntitlements(List<Entitlement> entitlements);

  String getQualifications();

  void setQualifications(String qualifications);

  PreciseDate getDateOfBirth();

  void setDateOfBirth(PreciseDate dateOfBirth);

  Gender getGender();

  void setGender(Gender gender);
  //TODO Validation Missing
}

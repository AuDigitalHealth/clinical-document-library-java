package au.gov.nehta.builder.common;

import au.gov.nehta.builder.util.Converter;
import au.gov.nehta.model.clinical.etp.common.participation.ServiceProvider;
import au.net.electronichealth.ns.ci.cda.extensions._3.EntityIdentifier;
import java.util.List;

/**
 * Class containing <code>public static</code> methods for {@link au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProvider}
 */
public class ParticipationServiceProviderHelper {

  public static List<EntityIdentifier> getEntityIdentifiers(ServiceProvider serviceProvider) {
    return Converter.getAsEntityIdentifier(serviceProvider.getEntityIdentifiers());
  }


}

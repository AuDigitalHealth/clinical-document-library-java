package au.gov.nehta.model.clinical.sr;

import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import java.util.List;

/**
 * <h3>Reuses existing {@link RequestedService} type and only following attributes are used:</h3>
 * <ul>
 *   <li><code>serviceCategory</code></li>
 *   <li><code>serviceDesc</code></li>
 *   <li><code>serviceBookingStatus</code></li>
 *   <li><code>serviceComment</code></li>
 *   <li><code>serviceProvider</code></li>
 *   <li><code>requestedServiceDateTime</code></li>
 * </ul>
 */
public class CurrentServices {
  private List<RequestedService> currentServices;
  private StrucDocText customNarrative;

  public List<RequestedService> getCurrentServices() {
    return currentServices;
  }

  public void setCurrentServices(
      List<RequestedService> currentServices) {
    this.currentServices = currentServices;
  }

  public StrucDocText getCustomNarrative() {
    return customNarrative;
  }

  public void setCustomNarrative(StrucDocText customNarrative) {
    this.customNarrative = customNarrative;
  }
}

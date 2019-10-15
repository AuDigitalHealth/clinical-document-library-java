package au.gov.nehta.model.clinical.sr;

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

  public List<RequestedService> getCurrentServices() {
    return currentServices;
  }

  public void setCurrentServices(
      List<RequestedService> currentServices) {
    this.currentServices = currentServices;
  }
}

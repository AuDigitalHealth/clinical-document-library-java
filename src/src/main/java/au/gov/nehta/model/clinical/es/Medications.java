package au.gov.nehta.model.clinical.es;

import java.util.List;

public interface Medications {

  List<KnownMedication> getKnownMedications();

  void setKnownMedications(
      List<KnownMedication> knownMedications);
}

package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.cda.common.code.Coded;
import java.util.List;

public interface TestSpecimenDetail {

  void setSpecimenTissueType(Coded specimenTissueType);

  void setCollectionProcedure(Coded collectionProcedure);

  void setAnatomicalSites(
      List<AnatomicalSite> anatomicalSites);

  void setPhysicalDetails(
      List<PhysicalDetails> physicalDetails);

  void setCollectionAndHandling(
      CollectionAndHandling collectionAndHandling);

  void setHandlingAndProcessing(
      HandlingAndProcessing handlingAndProcessing);

  void setIdentifiers(Identifiers identifiers);

  Coded getSpecimenTissueType();

  Coded getCollectionProcedure();

  List<AnatomicalSite> getAnatomicalSites();

  List<PhysicalDetails> getPhysicalDetails();

  CollectionAndHandling getCollectionAndHandling();

  HandlingAndProcessing getHandlingAndProcessing();

  Identifiers getIdentifiers();
}

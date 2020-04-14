package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.cda.common.code.Coded;
import java.util.List;

public class TestSpecimenDetailImpl implements TestSpecimenDetail {

  private Coded specimenTissueType;
  private Coded collectionProcedure;
  private List<AnatomicalSite> anatomicalSites;
  private List<PhysicalDetails> physicalDetails;
  private CollectionAndHandling collectionAndHandling;
  private HandlingAndProcessing handlingAndProcessing;
  private Identifiers identifiers;

  @Override
  public Coded getSpecimenTissueType() {
    return specimenTissueType;
  }

  @Override
  public void setSpecimenTissueType(Coded specimenTissueType) {
    this.specimenTissueType = specimenTissueType;
  }

  @Override
  public Coded getCollectionProcedure() {
    return collectionProcedure;
  }

  @Override
  public void setCollectionProcedure(Coded collectionProcedure) {
    this.collectionProcedure = collectionProcedure;
  }

  @Override
  public List<AnatomicalSite> getAnatomicalSites() {
    return anatomicalSites;
  }

  @Override
  public void setAnatomicalSites(
      List<AnatomicalSite> anatomicalSites) {
    this.anatomicalSites = anatomicalSites;
  }

  @Override
  public List<PhysicalDetails> getPhysicalDetails() {
    return physicalDetails;
  }

  @Override
  public void setPhysicalDetails(
      List<PhysicalDetails> physicalDetails) {
    this.physicalDetails = physicalDetails;
  }

  @Override
  public CollectionAndHandling getCollectionAndHandling() {
    return collectionAndHandling;
  }

  @Override
  public void setCollectionAndHandling(
      CollectionAndHandling collectionAndHandling) {
    this.collectionAndHandling = collectionAndHandling;
  }

  @Override
  public HandlingAndProcessing getHandlingAndProcessing() {
    return handlingAndProcessing;
  }

  @Override
  public void setHandlingAndProcessing(
      HandlingAndProcessing handlingAndProcessing) {
    this.handlingAndProcessing = handlingAndProcessing;
  }

  @Override
  public Identifiers getIdentifiers() {
    return identifiers;
  }

  @Override
  public void setIdentifiers(Identifiers identifiers) {
    this.identifiers = identifiers;
  }
}

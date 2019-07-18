package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;

import java.util.List;

public class TestRequestDetails {
  private List<Coded> testRequestedNames;
  private UniqueIdentifier laboratoryTestResultIdentifier;

  public List<Coded> getTestRequestedNames() {
    return testRequestedNames;
  }

  public void setTestRequestedNames(List<Coded> testRequestedNames) {
    this.testRequestedNames = testRequestedNames;
  }

  public UniqueIdentifier getLaboratoryTestResultIdentifier() {
    return laboratoryTestResultIdentifier;
  }

  public void setLaboratoryTestResultIdentifier(UniqueIdentifier laboratoryTestResultIdentifier) {
    this.laboratoryTestResultIdentifier = laboratoryTestResultIdentifier;
  }
}

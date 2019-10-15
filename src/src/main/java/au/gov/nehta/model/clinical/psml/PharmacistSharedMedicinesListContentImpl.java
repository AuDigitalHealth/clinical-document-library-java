package au.gov.nehta.model.clinical.psml;


public class PharmacistSharedMedicinesListContentImpl implements
    PharmacistSharedMedicinesListContent {

  private Section section;

  @Override
  public Section getSection() {
    return section;
  }

  @Override
  public void setSection(Section section) {
    this.section = section;
  }

}

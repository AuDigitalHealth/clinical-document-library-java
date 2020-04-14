package au.gov.nehta.builder.common.components;

import static au.gov.nehta.builder.sl.SpecialistLetterCodes.ADMINISTRATIVE_OBSERVATIONS_SECTION_TITLE;

import au.gov.nehta.builder.common.ClinicalModelConverter;
import au.gov.nehta.builder.common.EntryCreator;
import au.gov.nehta.builder.common.SectionEntryCodeSet;
import au.gov.nehta.builder.common.StructuredBodyUtil;
import au.gov.nehta.builder.util.CDATypeUtil;
import au.gov.nehta.model.clinical.common.DocumentAuthor;
import au.gov.nehta.model.clinical.common.ExtendedDemographicData;
import au.gov.nehta.model.clinical.common.SubjectOfCareDemographicData;
import au.gov.nehta.model.clinical.common.SubjectOfCareParticipant;
import au.gov.nehta.model.clinical.common.participation.DateAccuracy;
import au.gov.nehta.model.clinical.common.participation.DateOfDeath;
import au.gov.nehta.model.clinical.etp.common.participation.Entitlement;
import au.net.electronichealth.ns.cda._2_0.ObjectFactory;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Component3;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Entry;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Section;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import au.net.electronichealth.ns.ci.cda.extensions._3.Coverage2;
import java.util.List;

public class AdministrativeObservationsComponent {

  private ObjectFactory objectFactory = new ObjectFactory();

  public POCDMT000040Component3 getComponent(SubjectOfCareParticipant subjectOfCareParticipant,
      DocumentAuthor documentAuthor) {
    POCDMT000040Component3 administrativeObservationsSectionComponent =
        objectFactory.createPOCDMT000040Component3();
    SubjectOfCareDemographicData subjectOfCareDemographicData =
        subjectOfCareParticipant.getPerson().getDemographicData();
    POCDMT000040Section administrativeObservationsSection = objectFactory
        .createPOCDMT000040Section();
    administrativeObservationsSection.setCode(SectionEntryCodeSet.ADMINISTRATIVE_OBSERVATIONS);
    administrativeObservationsSection.setTitle(
        CDATypeUtil.getST(ADMINISTRATIVE_OBSERVATIONS_SECTION_TITLE));
    List<Entitlement> subjectOfCareEntitlement = subjectOfCareParticipant
        .getEntitlements();
    if (subjectOfCareEntitlement != null) {
      List<Coverage2> subjectOfCareEntitlements =
          ClinicalModelConverter.getSubjectOfCareEntitlements(subjectOfCareParticipant);
      administrativeObservationsSection.getCoverage2().addAll(subjectOfCareEntitlements);
    }

    List<? extends au.gov.nehta.model.clinical.etp.common.participation.Entitlement> authorEntitlement = documentAuthor
        .getEntitlements();
    if (authorEntitlement != null) {
      List<Coverage2> authorEntitlements =
          ClinicalModelConverter
              .getParticpantEntitlements(authorEntitlement, documentAuthor.getID());
      administrativeObservationsSection.getCoverage2().addAll(authorEntitlements);
    }

    // Administrative Observations entries
    if (subjectOfCareDemographicData != null) {

      Boolean isSubjectOfCareDateOfBirthCalculatedFromAge =
          subjectOfCareDemographicData.getDateOfBirthDetail().getDateOfBirthIsCalculatedFromAge();
      if (isSubjectOfCareDateOfBirthCalculatedFromAge != null) {
        POCDMT000040Entry calcAgeEntry =
            EntryCreator.createSubjectOfCareCalcAgeEntry(
                isSubjectOfCareDateOfBirthCalculatedFromAge);
        administrativeObservationsSection.getEntry().add(calcAgeEntry);
      }

      DateAccuracy subjectOfCareDateOfBirthAccuracyIndicator =
          subjectOfCareDemographicData.getDateOfBirthDetail().getDateOfBirthAccuracyIndicator();
      if (subjectOfCareDateOfBirthAccuracyIndicator != null) {
        POCDMT000040Entry dateOfBirthAccuracyEntry =
            EntryCreator.createSubjectOfCareDateOfBirthAccuracyEntry(
                subjectOfCareDateOfBirthAccuracyIndicator);
        administrativeObservationsSection.getEntry().add(dateOfBirthAccuracyEntry);
      }

      if (subjectOfCareDemographicData instanceof ExtendedDemographicData) {
        ExtendedDemographicData ext = (ExtendedDemographicData) subjectOfCareDemographicData;
        DateOfDeath dateOfDeath = ext.getDateOfDeath();
        if (dateOfDeath != null) {
          if (dateOfDeath.getDateOfDeathAccuracyIndicator() != null) {
            POCDMT000040Entry dodAccuracyEntry =
                EntryCreator.createDeathDateAccuracyEntry(
                    dateOfDeath.getDateOfDeathAccuracyIndicator());
            administrativeObservationsSection.getEntry().add(dodAccuracyEntry);
          }

          if (dateOfDeath.getDeathNotificationSource() != null) {
            POCDMT000040Entry dodSource =
                EntryCreator.createDeathSourceCodeEntry(dateOfDeath.getDeathNotificationSource());
            administrativeObservationsSection.getEntry().add(dodSource);
          }
        }

        if (ext.getMothersOriginalFamilyName() != null) {
          POCDMT000040Entry dodSource =
              EntryCreator.createMothersMaidenNameEntry(ext.getMothersOriginalFamilyName());
          administrativeObservationsSection.getEntry().add(dodSource);
        }
      }

      POCDMT000040Entry ageEntry =
          EntryCreator.createSubjectOfCareAgeEntry(
              Integer.toString(subjectOfCareDemographicData.getAgeInYears()));
      administrativeObservationsSection.getEntry().add(ageEntry);

      if (subjectOfCareDemographicData.isAgeAccurate() != null) {
        POCDMT000040Entry ageAccuracyEntry =
            EntryCreator.createSubjectOfCareAgeAccuracyEntry(
                subjectOfCareDemographicData.isAgeAccurate());
        administrativeObservationsSection.getEntry().add(ageAccuracyEntry);
      }

      Integer subjectOfCareBirthPlurality = subjectOfCareDemographicData.getBirthPlurality();
      if (subjectOfCareBirthPlurality != null) {
        POCDMT000040Entry birthPluralityEntry =
            EntryCreator.createSubjectOfCareBirthPluralityEntry(subjectOfCareBirthPlurality);
        administrativeObservationsSection.getEntry().add(birthPluralityEntry);
      }

      // Administrative Observations narrative block
      StrucDocText administrativeObservationsSectionNarrativeBlock;
      if (subjectOfCareDemographicData instanceof ExtendedDemographicData) {
        administrativeObservationsSectionNarrativeBlock =
            StructuredBodyUtil.getAdministrativeObservationsNarrativeBlock(
                (ExtendedDemographicData) subjectOfCareDemographicData);
      } else {
        administrativeObservationsSectionNarrativeBlock =
            StructuredBodyUtil.getAdministrativeObservationsNarrativeBlock(
                subjectOfCareDemographicData);
      }

      administrativeObservationsSection.setText(administrativeObservationsSectionNarrativeBlock);
      administrativeObservationsSectionComponent.setSection(administrativeObservationsSection);
    }

    return administrativeObservationsSectionComponent;
  }
}

package au.gov.nehta.builder.common;

import au.gov.nehta.builder.util.Converter;
import au.gov.nehta.builder.util.narrative.NarrativeUtil;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.clinical.common.ExtendedDemographicData;
import au.gov.nehta.model.clinical.common.SubjectOfCareDemographicData;
import au.gov.nehta.model.clinical.common.participation.DateAccuracy;
import au.gov.nehta.model.clinical.common.participation.DateOfBirthDetail;
import au.gov.nehta.model.clinical.common.participation.DateOfDeath;
import au.net.electronichealth.ns.cda._2_0.*;

import javax.xml.bind.JAXBElement;
import java.time.ZonedDateTime;
import java.util.Arrays;
import java.util.List;

public class StructuredBodyUtil {

    public static POCDMT000040Author getSectionAuthor(POCDMT000040Author clinicalDocumentAuthor,
                                                      ZonedDateTime prescriptionCreationDate) {

        POCDMT000040Author sectionAuthor = new POCDMT000040Author();
        // TS sectionAuthorTime = clinicalDocumentAuthor.getTime();
        List<II> assignedAuthorId = clinicalDocumentAuthor.getAssignedAuthor().getId();

        // sectionAuthor.setTime( CDATypeUtil.getTS( prescriptionCreationDate ) );
        POCDMT000040AssignedAuthor sectionAssignedAuthor = new POCDMT000040AssignedAuthor();
        sectionAssignedAuthor.getId().addAll(assignedAuthorId);
        sectionAuthor.setAssignedAuthor(sectionAssignedAuthor);
        sectionAuthor.setTime(Converter.getTS(prescriptionCreationDate));

        return sectionAuthor;
    }

    public static StrucDocText getAdministrativeObservationsNarrativeBlock(
            SubjectOfCareDemographicData demoData) {

        StrucDocText narrativeBlock = new StrucDocText();

        StrucDocTable administrativeObservationsTable = new StrucDocTable();
        StrucDocThead administrativeObservationsTableHead = new StrucDocThead();
        StrucDocCaption caption = new StrucDocCaption();
        caption.getContent().add("Demographic Data");
        administrativeObservationsTable.setCaption(caption);

        administrativeObservationsTableHead.getTr()
                .add(NarrativeUtil.getTableHeaderRow(Arrays.asList("Name", "Value")));
        administrativeObservationsTable.setThead(administrativeObservationsTableHead);
        StrucDocTbody observationsTableBody = new StrucDocTbody();

        DateOfBirthDetail dobDetail = demoData.getDateOfBirthDetail();

        if (dobDetail != null) {
            if (dobDetail.getDateOfBirthIsCalculatedFromAge() != null) {
                observationsTableBody.getTr().add(
                        NarrativeUtil.createTableBodyRowWithCellValues(
                                Arrays.asList("Date Of Birth is Calculated from Age",
                                        NarrativeUtil.booleanToYesNo(dobDetail.getDateOfBirthIsCalculatedFromAge()))));
            }

            if (dobDetail.getDateOfBirthAccuracyIndicator() != null) {
                observationsTableBody.getTr().add(
                        NarrativeUtil.createTableBodyRowWithCellValues(Arrays
                                .asList("Date of Birth Accuracy Indicator",
                                        dobDetail.getDateOfBirthAccuracyIndicator().toString())));
            }

        }

        if (demoData.getBirthPlurality() != null) {
            Integer birthPlurality = demoData.getBirthPlurality();
            observationsTableBody.getTr().add(NarrativeUtil.createTableBodyRowWithCellValues(
                    Arrays.asList("Birth Plurality", birthPlurality.toString())));
        }

        if (demoData.isAgeAccurate() != null) {
            observationsTableBody.getTr()
                    .add(NarrativeUtil.createTableBodyRowWithCellValues(Arrays
                            .asList("Age Accuracy Indicator",
                                    NarrativeUtil.booleanToYesNo(demoData.isAgeAccurate()))));
        }

        observationsTableBody.getTr().add(NarrativeUtil.createTableBodyRowWithCellValues(
                Arrays.asList("Age", Integer.toString(demoData.getAgeInYears()))));

        administrativeObservationsTable.getTbody().add(observationsTableBody);
        JAXBElement<StrucDocTable> administrativeObservationsTableJaxbElement = new ObjectFactory()
                .createStrucDocTextTable(administrativeObservationsTable);
        narrativeBlock.getContent().add(administrativeObservationsTableJaxbElement);

        return narrativeBlock;
    }

    public static StrucDocText getAdministrativeObservationsNarrativeBlock(
            ExtendedDemographicData demoData) {

        StrucDocText narrativeBlock = new StrucDocText();

        StrucDocTable administrativeObservationsTable = new StrucDocTable();
        StrucDocThead administrativeObservationsTableHead = new StrucDocThead();
        StrucDocCaption caption = new StrucDocCaption();
        caption.getContent().add("Demographic Data");
        administrativeObservationsTable.setCaption(caption);

        administrativeObservationsTableHead.getTr()
                .add(NarrativeUtil.getTableHeaderRow(Arrays.asList("Name", "Value")));
        administrativeObservationsTable.setThead(administrativeObservationsTableHead);
        StrucDocTbody observationsTableBody = new StrucDocTbody();

        DateOfBirthDetail dobDetail = demoData.getDateOfBirthDetail();

        if (dobDetail != null) {
            if (dobDetail.getDateOfBirthIsCalculatedFromAge() != null) {
                observationsTableBody.getTr().add(
                        NarrativeUtil.createTableBodyRowWithCellValues(
                                Arrays.asList("Date Of Birth is Calculated from Age",
                                        NarrativeUtil.booleanToYesNo(dobDetail.getDateOfBirthIsCalculatedFromAge()))));
            }

            if (dobDetail.getDateOfBirthAccuracyIndicator() != null) {
                observationsTableBody.getTr().add(
                        NarrativeUtil.createTableBodyRowWithCellValues(Arrays
                                .asList("Date of Birth Accuracy Indicator",
                                        dobDetail.getDateOfBirthAccuracyIndicator().toString())));
            }

        }

        if (demoData.getBirthPlurality() != null) {
            Integer birthPlurality = demoData.getBirthPlurality();
            observationsTableBody.getTr().add(NarrativeUtil.createTableBodyRowWithCellValues(
                    Arrays.asList("Birth Plurality", birthPlurality.toString())));
        }

        if (demoData.isAgeAccurate() != null) {
            observationsTableBody.getTr()
                    .add(NarrativeUtil.createTableBodyRowWithCellValues(Arrays
                            .asList("Age Accuracy Indicator",
                                    NarrativeUtil.booleanToYesNo(demoData.isAgeAccurate()))));
        }

        DateOfDeath dateOfDeath = demoData.getDateOfDeath();
        if (dateOfDeath != null) {
            DateAccuracy accuracy = dateOfDeath.getDateOfDeathAccuracyIndicator();

            if (accuracy != null) {
                observationsTableBody.getTr()
                        .add(NarrativeUtil.createTableBodyRowWithCellValues(
                                Arrays.asList("Date of Death Accuracy Indicator", accuracy.toString())));
            }

            Coded source = dateOfDeath.getDeathNotificationSource();
            if (source != null) {
                observationsTableBody.getTr()
                        .add(NarrativeUtil.createTableBodyRowWithCellValues(
                                Arrays.asList("Source Of Death Notification", source.getDisplayName())));

            }

        }

        if (demoData.getMothersOriginalFamilyName() != null) {
            observationsTableBody.getTr()
                    .add(NarrativeUtil.createTableBodyRowWithCellValues(Arrays
                            .asList("Mothers Original Family Name", demoData.getMothersOriginalFamilyName())));
        }

        observationsTableBody.getTr().add(NarrativeUtil.createTableBodyRowWithCellValues(
                Arrays.asList("Age", Integer.toString(demoData.getAgeInYears()))));

        administrativeObservationsTable.getTbody().add(observationsTableBody);
        JAXBElement<StrucDocTable> administrativeObservationsTableJaxbElement = new ObjectFactory()
                .createStrucDocTextTable(administrativeObservationsTable);
        narrativeBlock.getContent().add(administrativeObservationsTableJaxbElement);

        return narrativeBlock;
    }
}

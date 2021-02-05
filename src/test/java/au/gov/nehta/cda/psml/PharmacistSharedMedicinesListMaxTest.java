package au.gov.nehta.cda.psml;

import au.gov.nehta.builder.psml.PharmacistSharedMedicinesListCreator;
import au.gov.nehta.builder.util.CDATypeUtil;
import au.gov.nehta.cda.test.Base;
import au.gov.nehta.cda.test.TestHelper;
import au.gov.nehta.model.cda.common.code.CodeImpl;
import au.gov.nehta.model.cda.common.code.DocumentStatusCode;
import au.gov.nehta.model.cda.common.document.ClinicalDocument;
import au.gov.nehta.model.cda.common.document.ClinicalDocumentFactory;
import au.gov.nehta.model.cda.common.id.TemplateIdImpl;
import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.cda.common.time.Precision;
import au.gov.nehta.model.cda.common.time.PrecisionDate;
import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;
import au.gov.nehta.model.cda.psml.PharmacistSharedMedicinesListCDAModel;
import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProvider;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProviderImpl;
import au.gov.nehta.model.clinical.psml.*;
import au.gov.nehta.model.schematron.SchematronValidationException;
import org.junit.Assert;
import org.junit.Test;
import org.w3c.dom.Document;

import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;
import java.io.File;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.ArrayList;
import java.util.List;

import static au.gov.nehta.cda.test.TestHelper.*;
import static au.gov.nehta.model.schematron.SchematronResource.SchematronResources.PSML_3A;

public class PharmacistSharedMedicinesListMaxTest extends Base {

    private static final String DOCUMENT_FILE_NAME = "src/test/resources/generated_xml/psml/psml-max-java.xml";
    private static final String SCHEMATRON = PSML_3A.resource().getSchematron();
    private static final String SCHEMATRON_TEMPLATE_PATH = "src/test/resources/PharmacistSharedMedicines";

    @Test
    public void test_MAX_Pharmacist_Shared_Medicines_List_Creation() {
        try {
            generateMax();
//            SchematronCheckResult check =
//                    Schematron.check(SCHEMATRON_TEMPLATE_PATH, SCHEMATRON, DOCUMENT_FILE_NAME);
//            show(check);
//            assertEquals(0, check.schemaErrors.size());
//            assertEquals(0, check.schematronErrors.size());
            File f = new File(DOCUMENT_FILE_NAME);
            Assert.assertTrue(f.exists());
            Assert.assertTrue(f.length() > 0L);
        } catch (SchematronValidationException | ParserConfigurationException | JAXBException e) {
            e.printStackTrace();
        }
    }

    private void generateMax()
            throws SchematronValidationException, JAXBException, ParserConfigurationException {
        ZonedDateTime now = ZonedDateTime.now();

        PharmacistSharedMedicinesList pharmacistSharedMedicinesList = new PharmacistSharedMedicinesListImpl();
        // Context
        PreciseDate dateTimeAuthored = new PrecisionDate(Precision.DAY, now.minusDays(1));
        PreciseDate dateTimeAttested = new PrecisionDate(Precision.DAY, now.minusHours(6));

        ParticipationServiceProvider participant = new ParticipationServiceProviderImpl();
        participant.setParticipant(getServiceProviderIndividual());
        // participant.setParticipant(getServiceProviderOrganization());
        participant.setRole(
                new CodeImpl("8601", "1.2.36.1.2001.1005.47", "ANSZIC 2006",
                        "Aged Care Residential Services"));

        ParticipationServiceProvider facility = new ParticipationServiceProviderImpl();
        RestrictedTimeInterval encounterPeriod =
                RestrictedTimeInterval.getLowHighInstance(
                        new PrecisionDate(Precision.DAY, LocalDate.of(2019, 7, 11).atStartOfDay(ZoneId.systemDefault())),
                        new PrecisionDate(Precision.DAY, LocalDate.of(2019, 8, 12).atStartOfDay(ZoneId.systemDefault())));
        facility.setParticipationPeriod(encounterPeriod);
        facility.setParticipant(getServiceProviderOrganization());
        facility.setRole(
                new CodeImpl("HOSP", "2.16.840.1.113883.1.11.17660", "HL7 ServiceDeliveryLocationRoleType",
                        "Hospital"));

        PharmacistSharedMedicinesListContext context = new PharmacistSharedMedicinesListContextImpl(
                getSubjectOfCareParticipant(),
                getDocumentAuthor(now),
                dateTimeAuthored,
                dateTimeAttested,
                participant, facility);
        pharmacistSharedMedicinesList.setContext(context);

        // Content
        PharmacistSharedMedicinesListContent content = new PharmacistSharedMedicinesListContentImpl();
        List<AttachedMedia> mediaList = new ArrayList<>();
        AttachedMedia file = TestHelper.getAttachedMediaPDF("Prototype Medicines List.pdf");
        file.setTemplateId(TemplateIdImpl.getInstance("", "1.2.36.1.2001.1001.101.102.16883"));
        mediaList.add(file);
        content.setSection(new SectionImpl() {{
            setEncapsulatedDataItems(mediaList);
            setTemplateId((TemplateIdImpl.getInstance("", "1.2.36.1.2001.1001.101.101.16886")));
        }});

        pharmacistSharedMedicinesList.setContent(content);

        ClinicalDocument cdaClinicalDocument = ClinicalDocumentFactory
                .getPharmacistSharedMedicinesList();
        cdaClinicalDocument.setClinicalDocumentId(CDATypeUtil.getUUID());
        cdaClinicalDocument.setVersionNumber(1);
        cdaClinicalDocument.setLanguageCode("en-AU");
        cdaClinicalDocument.setCompletionCode(DocumentStatusCode.FINAL);

        PharmacistSharedMedicinesListCDAModel pharmacistSharedMedicinesListCDAModel =
                new PharmacistSharedMedicinesListCDAModel(cdaClinicalDocument, getInformationRecipients(),
                        getCustodian(), participant, now);
        pharmacistSharedMedicinesListCDAModel.setLegalAuthenticator(getLegalAuthenticator(now));
        PharmacistSharedMedicinesListCreator creator = new PharmacistSharedMedicinesListCreator(
                pharmacistSharedMedicinesListCDAModel, pharmacistSharedMedicinesList);
        Document clinicalDocument = creator.create();
        String cdaString = TestHelper.documentToXML(clinicalDocument);
        TestHelper.printToFile(cdaString, DOCUMENT_FILE_NAME);
    }
}

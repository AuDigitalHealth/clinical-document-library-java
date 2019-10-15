package au.gov.nehta.cda.psml;

import static au.gov.nehta.cda.test.TestHelper.getCustodian;
import static au.gov.nehta.cda.test.TestHelper.getDocumentAuthor;
import static au.gov.nehta.cda.test.TestHelper.getInformationRecipients;
import static au.gov.nehta.cda.test.TestHelper.getLegalAuthenticator;
import static au.gov.nehta.cda.test.TestHelper.getServiceProviderIndividual;
import static au.gov.nehta.cda.test.TestHelper.getServiceProviderOrganization;
import static au.gov.nehta.cda.test.TestHelper.getSubjectOfCareParticipant;

import au.gov.nehta.builder.psml.PharmacistSharedMedicinesListCreator;
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
import au.gov.nehta.model.clinical.psml.PharmacistSharedMedicinesList;
import au.gov.nehta.model.clinical.psml.PharmacistSharedMedicinesListContent;
import au.gov.nehta.model.clinical.psml.PharmacistSharedMedicinesListContentImpl;
import au.gov.nehta.model.clinical.psml.PharmacistSharedMedicinesListContext;
import au.gov.nehta.model.clinical.psml.PharmacistSharedMedicinesListContextImpl;
import au.gov.nehta.model.clinical.psml.PharmacistSharedMedicinesListImpl;
import au.gov.nehta.model.clinical.psml.SectionImpl;
import au.gov.nehta.model.schematron.SchematronValidationException;
import java.io.File;
import java.util.ArrayList;
import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;
import org.joda.time.DateTime;
import org.junit.Test;
import org.w3c.dom.Document;

public class PharmacistSharedMedicinesListMaxTest extends Base {

  private static final String DOCUMENT_FILE_NAME =
      "src/" + TEST_GENERATION + "/psml/psml-max-java.xml";

  @Test
  public void test_MAX_Specialist_Letter_Creation() {
    try {
      generateMax();
    } catch (SchematronValidationException | ParserConfigurationException | JAXBException e) {
      e.printStackTrace();
    }
  }

  private void generateMax()
      throws SchematronValidationException, JAXBException, ParserConfigurationException {
    DateTime now = new DateTime();

    PharmacistSharedMedicinesList pharmacistSharedMedicinesList = new PharmacistSharedMedicinesListImpl();
    //Context
    PreciseDate dateTimeAuthored = new PrecisionDate(Precision.DAY, now.minusDays(1));
    PreciseDate dateTimeAttested = new PrecisionDate(Precision.DAY, now.minusHours(6));

    ParticipationServiceProvider participant = new ParticipationServiceProviderImpl();
    participant.setParticipant(getServiceProviderIndividual());
    //participant.setParticipant(getServiceProviderOrganization());
    participant.setRole(
        new CodeImpl("8601", "1.2.36.1.2001.1005.47", "ANSZIC 2006",
            "Aged Care Residential Services"));

    ParticipationServiceProvider facility = new ParticipationServiceProviderImpl();
    RestrictedTimeInterval encounterPeriod =
        RestrictedTimeInterval.getLowHighInstance(
            new PrecisionDate(Precision.DAY, new DateTime("2019-07-11")),
            new PrecisionDate(Precision.DAY, new DateTime("2019-08-12")));
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

    //Content
    PharmacistSharedMedicinesListContent content = new PharmacistSharedMedicinesListContentImpl();

    ArrayList<AttachedMedia> mediaList = new ArrayList();
    AttachedMedia file = new AttachedMedia(
        new File(ATTACHMENTS_DIR + "Prototype Medicines List.pdf"),
        TemplateIdImpl.getInstance("", "1.2.36.1.2001.1001.101.102.16883"));
    mediaList.add(file);
    content.setSection(new SectionImpl() {{
      setEncapsulatedDataItems(mediaList);
      setTemplateId((TemplateIdImpl.getInstance("", "1.2.36.1.2001.1001.101.101.16886")));
    }});

    pharmacistSharedMedicinesList.setContent(content);

    ClinicalDocument cdaClinicalDocument = ClinicalDocumentFactory
        .getPharmacistSharedMedicinesList();
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
    System.out.println(cdaString);

  }


}

package au.gov.nehta.cda.ds;

import static au.gov.nehta.builder.DocumentCreatorUtil.HL7_TEXT_MEDIA_TYPE;
import static au.gov.nehta.cda.test.TestHelper.getCustodian;
import static au.gov.nehta.cda.test.TestHelper.getDocumentAuthor;
import static au.gov.nehta.cda.test.TestHelper.getInformationRecipients;
import static au.gov.nehta.cda.test.TestHelper.getLegalAuthenticator;
import static au.gov.nehta.cda.test.TestHelper.getSubjectOfCareParticipant;

import au.gov.nehta.builder.ds.DischargeSummaryCreator;
import au.gov.nehta.builder.util.UUIDTool;
import au.gov.nehta.cda.test.Base;
import au.gov.nehta.cda.test.TestHelper;
import au.gov.nehta.model.cda.common.code.CodeImpl;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.code.DocumentStatusCode;
import au.gov.nehta.model.cda.common.document.ClinicalDocument;
import au.gov.nehta.model.cda.common.document.ClinicalDocumentFactory;
import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.cda.common.time.Precision;
import au.gov.nehta.model.cda.common.time.PrecisionDate;
import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;
import au.gov.nehta.model.cda.ds.DischargeSummaryCDAModel;
import au.gov.nehta.model.clinical.common.DocumentAuthor;
import au.gov.nehta.model.clinical.ds.DischargeSummary;
import au.gov.nehta.model.clinical.ds.DischargeSummaryContent;
import au.gov.nehta.model.clinical.ds.DischargeSummaryContentImpl;
import au.gov.nehta.model.clinical.ds.DischargeSummaryContext;
import au.gov.nehta.model.clinical.ds.DischargeSummaryContextImpl;
import au.gov.nehta.model.clinical.ds.DischargeSummaryImpl;
import au.gov.nehta.model.clinical.ds.Encounter;
import au.gov.nehta.model.clinical.ds.EncounterImpl;
import au.gov.nehta.model.clinical.ds.Event;
import au.gov.nehta.model.clinical.ds.EventImpl;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProvider;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProviderImpl;
import au.gov.nehta.model.schematron.SchematronValidationException;
import au.net.electronichealth.ns.cda._2_0.ObjectFactory;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import java.util.ArrayList;
import java.util.UUID;
import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;
import org.joda.time.DateTime;
import org.junit.Test;
import org.w3c.dom.Document;

public class DischargeSummary1BTest extends Base {

  private static final String DOCUMENT_FILE_NAME =
      TEST_GENERATION + "/ds/DischargeSummary_1B_format.xml";
  private static ObjectFactory objectFactory = new ObjectFactory();

  @Test
  public void test_Discharge_Summary__Format_1B_Creation() {
    DateTime now = new DateTime();
    DocumentAuthor documentAuthor = getDocumentAuthor(now);

    ParticipationServiceProvider facility = new ParticipationServiceProviderImpl();
    PreciseDate dateTimeAttested = new PrecisionDate(Precision.DAY, now.minusHours(6));
    RestrictedTimeInterval encounterPeriod =
        RestrictedTimeInterval.getLowHighInstance(
            new PrecisionDate(Precision.DAY, new DateTime("2019-03-1")),
            new PrecisionDate(Precision.DAY, new DateTime("2019-04-1")));
    facility.setParticipationPeriod(encounterPeriod);
    //facility.setParticipant(getServiceProviderOrganization()); TODO Move to TestHelper (common)
    facility.setRole(new CodeImpl("HOSP", "2.16.840.1.113883.1.11.17660",
        "HL7 ServiceDeliveryLocationRoleType", "Hospital"));

    //Context
    DischargeSummaryContext dischargeSummaryContext = new DischargeSummaryContextImpl(
        documentAuthor,
        getSubjectOfCareParticipant(), facility, encounterPeriod, dateTimeAttested,
        "Some care setting");

    StrucDocText narrativeSdt = objectFactory.createStrucDocText();
    narrativeSdt.getContent().add("Custom Narrative");
    narrativeSdt.setMediaType(HL7_TEXT_MEDIA_TYPE);

    //Content
    DischargeSummaryContent dischargeSummaryContent =
        new DischargeSummaryContentImpl("Custom Title", narrativeSdt);
    Event event = new EventImpl();
    event.setEncounter(getEncounter());
    dischargeSummaryContent.setEvent(event);

    DischargeSummary dischargeSummary = new DischargeSummaryImpl();
    dischargeSummary.setContext(dischargeSummaryContext);
    dischargeSummary.setContent(dischargeSummaryContent);

    DischargeSummaryCDAModel dischargeSummaryCDAModel = new DischargeSummaryCDAModel(
        getCDAClinicalDocument(), getInformationRecipients(), getCustodian(),
        getLegalAuthenticator(now), now);

    dischargeSummaryCDAModel.setLegalAuthenticator(getLegalAuthenticator(now));
    DischargeSummaryCreator dischargeSummaryCreator = new DischargeSummaryCreator(
        dischargeSummaryCDAModel,
        dischargeSummary);

    try {
      Document clinicalDocument = dischargeSummaryCreator.create1BFormatCDADocument();
      String cdaString = TestHelper.documentToXML(clinicalDocument);
      TestHelper.printToFile(cdaString, DOCUMENT_FILE_NAME);
      System.out.println(cdaString);
    } catch (SchematronValidationException | ParserConfigurationException | JAXBException e) {
      e.printStackTrace();
    }
  }


  private ClinicalDocument getCDAClinicalDocument() {
    ClinicalDocument cdaClinicalDocument = ClinicalDocumentFactory.getDischargeSummary();
    cdaClinicalDocument.setClinicalDocumentId(UUIDTool.uuidToOid(UUID.randomUUID().toString()));
    cdaClinicalDocument.setLanguageCode("en-AU");
    cdaClinicalDocument.setVersionNumber(1);
    cdaClinicalDocument.setCompletionCode(DocumentStatusCode.FINAL);
    return cdaClinicalDocument;
  }

  private Encounter getEncounter() {
    Encounter encounter = new EncounterImpl();
    RestrictedTimeInterval encounterPeriod =
        RestrictedTimeInterval.getLowHighInstance(
            new PrecisionDate(Precision.DAY, new DateTime("2019-03-1")),
            new PrecisionDate(Precision.DAY, new DateTime("2019-04-1")));
    encounter.setEncounterPeriod(encounterPeriod);
    encounter.setSeparationMode(new CodeImpl("8", "2.16.840.1.113883.13.65",
        "Episode of admitted patient care-separation mode",
        "Other (includes discharge to usual residence, own accommodation/welfare institution includes prisons, hostels and group homes providing primarily welfare services)) Allergic reaction"));
    encounter.setSpecialtyList(
        new ArrayList<Coded>() {{
          add(new CodeImpl("103.16028", "1.2.36.1.2001.1001.101", "NCTIS Data Components",
              "Specialty"));
        }});
    return encounter;
  }
}

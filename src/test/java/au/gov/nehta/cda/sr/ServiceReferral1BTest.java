package au.gov.nehta.cda.sr;


import au.gov.nehta.builder.sr.ServiceReferralCreator;
import au.gov.nehta.builder.util.UUIDTool;
import au.gov.nehta.cda.test.Base;
import au.gov.nehta.cda.test.TestHelper;
import au.gov.nehta.model.cda.common.code.DocumentStatusCode;
import au.gov.nehta.model.cda.common.document.ClinicalDocument;
import au.gov.nehta.model.cda.common.document.ClinicalDocumentFactory;
import au.gov.nehta.model.cda.common.time.Precision;
import au.gov.nehta.model.cda.common.time.PrecisionDate;
import au.gov.nehta.model.cda.sr.ServiceReferralCDAModel;
import au.gov.nehta.model.clinical.sr.*;
import au.gov.nehta.model.schematron.SchematronValidationException;
import au.net.electronichealth.ns.cda._2_0.ObjectFactory;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import org.junit.Assert;
import org.junit.Test;
import org.w3c.dom.Document;

import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;
import java.io.File;
import java.time.ZonedDateTime;
import java.util.UUID;

import static au.gov.nehta.builder.DocumentCreatorUtil.HL7_TEXT_MEDIA_TYPE;
import static au.gov.nehta.cda.test.TestHelper.*;
import static au.gov.nehta.model.schematron.SchematronResource.SchematronResources.SERVICE_REFERRAL_1B;

public class ServiceReferral1BTest extends Base {

    private static final String SCHEMATRON = SERVICE_REFERRAL_1B.resource().getSchematron();
    private static String SCHEMATRON_TEMPLATE_PATH = "src/test/resources/ServiceReferral";
    private static final String DOCUMENT_FILE_NAME = "src/test/resources/generated_xml/service_referral/ServiceReferral_format_1B.xml";

    private static final ObjectFactory objectFactory = new ObjectFactory();
    private final ZonedDateTime now = ZonedDateTime.now();

    @Test
    public void test_1B_Service_Referral_Creation() {
        generate1B();
//        SchematronCheckResult check =
//                Schematron.check(SCHEMATRON_TEMPLATE_PATH, SCHEMATRON, DOCUMENT_FILE_NAME);
//        show(check);
//        assertEquals(0, check.schemaErrors.size());
//        assertEquals(0, check.schematronErrors.size());
        File f = new File(DOCUMENT_FILE_NAME);
        Assert.assertTrue(f.exists());
        Assert.assertTrue(f.length() > 0L);
    }

    public void generate1B() {
        ServiceReferralContext serviceReferralContext =
                new ServiceReferralContextImpl();
        serviceReferralContext
                .setDateTimeAttested(new PrecisionDate(Precision.DAY, now.minusDays(1)));
        serviceReferralContext.setDocumentAuthor(getDocumentAuthor(now));
        serviceReferralContext.setSubjectOfCare(getSubjectOfCareParticipant());
        StrucDocText narrativeSdt = objectFactory.createStrucDocText();
        narrativeSdt.getContent().add("Custom Narrative");
        narrativeSdt.setMediaType(HL7_TEXT_MEDIA_TYPE);
        ServiceReferralContent ServiceReferralContent = new ServiceReferralContentImpl("Custom Title",
                narrativeSdt);
        ServiceReferral serviceReferral = new ServiceReferralImpl();
        serviceReferral.setContext(serviceReferralContext);
        serviceReferral.setContent(ServiceReferralContent);
        ServiceReferralCDAModel serviceReferralCDAModel = new ServiceReferralCDAModel(
                getCDAClinicalDocument(), now);
        serviceReferralCDAModel.setCustodian(getCustodian());
        serviceReferralCDAModel.setInformationRecipients(getInformationRecipients());
        serviceReferralCDAModel.setLegalAuthenticator(getLegalAuthenticator(now));
        ServiceReferralCreator serviceReferralCreator = new ServiceReferralCreator(
                serviceReferralCDAModel, serviceReferral);
        try {
            Document clinicalDocument = serviceReferralCreator.create1BFormatCDADocument();
            String cdaString = TestHelper.documentToXML(clinicalDocument);
            TestHelper.printToFile(cdaString, DOCUMENT_FILE_NAME);

        } catch (SchematronValidationException | ParserConfigurationException | JAXBException e) {
            e.printStackTrace();
        }
    }


    private ClinicalDocument getCDAClinicalDocument() {
        ClinicalDocument cdaClinicalDocument = ClinicalDocumentFactory.getServiceReferral();
        cdaClinicalDocument.setClinicalDocumentId(UUIDTool.uuidToOid(UUID.randomUUID().toString()));
        cdaClinicalDocument.setLanguageCode("en-AU");
        cdaClinicalDocument.setVersionNumber(1);
        cdaClinicalDocument.setCompletionCode(DocumentStatusCode.FINAL);
        return cdaClinicalDocument;
    }

}

package au.gov.nehta.cda.ereferral;

import au.gov.nehta.builder.ereferral.EReferral3ACreator;
import au.gov.nehta.builder.util.UUIDTool;
import au.gov.nehta.cda.test.Base;
import au.gov.nehta.cda.test.TestHelper;
import au.gov.nehta.model.cda.common.code.DocumentStatusCode;
import au.gov.nehta.model.cda.common.document.ClinicalDocument;
import au.gov.nehta.model.cda.common.document.ClinicalDocumentFactory;
import au.gov.nehta.model.cda.common.time.Precision;
import au.gov.nehta.model.cda.common.time.PrecisionDate;
import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;
import au.gov.nehta.model.cda.ereferral.EReferralCDAModel;
import au.gov.nehta.model.clinical.common.participation.ANZSCO_1ED_2006;
import au.gov.nehta.model.clinical.ereferral.*;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProvider;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProviderImpl;
import au.gov.nehta.model.schematron.SchematronValidationException;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import org.junit.Assert;
import org.junit.Test;
import org.w3c.dom.Document;

import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;
import java.io.File;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.UUID;

import static au.gov.nehta.cda.test.TestHelper.*;
import static au.gov.nehta.model.schematron.SchematronResource.SchematronResources.SERVICE_REFERRAL_1B;

public class EReferral1BTest extends Base {

    private static final String SCHEMATRON = SERVICE_REFERRAL_1B.resource().getSchematron();
    private static final String SCHEMATRON_TEMPLATE_PATH = "src/test/resources/e-Referral";
    private static final String DOCUMENT_FILE_NAME = "src/test/resources/generated_xml/eReferral/eReferral-1B.xml";

    @Test
    public void test_E_REFERRAL_1B_Creation()
            throws ParserConfigurationException, JAXBException, SchematronValidationException {
        generate1B();
//        SchematronCheckResult check = Schematron
//                .check(SCHEMATRON_TEMPLATE_PATH, SCHEMATRON, DOCUMENT_FILE_NAME);
//        show(check);
//        assertEquals(0, check.schemaErrors.size());
//        assertEquals(0, check.schematronErrors.size());
        File f = new File(DOCUMENT_FILE_NAME);
        Assert.assertTrue(f.exists());
        Assert.assertTrue(f.length() > 0L);
    }

    private void generate1B()
            throws ParserConfigurationException, JAXBException, SchematronValidationException {
        EReferral eReferral = new EReferralImpl();
        EReferralContext context = new EReferralContextImpl();
        ZonedDateTime now = ZonedDateTime.now();
        context.setDateTimeAuthored(new PrecisionDate(Precision.DAY, now));
        context.setDateTimeAttested(new PrecisionDate(Precision.DAY, now.minusHours(4)));
        context.setDocumentAuthor(getDocumentAuthor(now));
        context.setSubjectOfCare(getSubjectOfCareParticipant());
        eReferral.setContext(context);
        EReferralContent content = new EReferralContentImpl();
        content.setCustomNarrativeTitle("Title for Narrative");
        content.setReferralDetail(getReferralDetail());
        content.setCustomNarrative(new StrucDocText() {{
            getContent().add("************************* Custom Narrative ************************\n");
        }});
        eReferral.setContent(content);
        EReferralCDAModel eReferralCDAModel = new EReferralCDAModel(getCDAClinicalDocument(),
                getInformationRecipients(), now);
        eReferralCDAModel.setCustodian(getCustodian());
        EReferral3ACreator eReferralCreator = new EReferral3ACreator(eReferralCDAModel, eReferral);
        Document clinicalDocument = eReferralCreator.create1BFormatCDADocument();
        String cdaString = TestHelper.documentToXML(clinicalDocument);
        TestHelper.printToFile(cdaString, DOCUMENT_FILE_NAME);
    }

    private ReferralDetail getReferralDetail() {
        ReferralDetail referralDetail = new ReferralDetail();
        referralDetail.setReferee(getReferee());
        referralDetail.setReferralDateTime(new PrecisionDate(Precision.DAY,
                LocalDate.of(2018, 1, 12).atStartOfDay(ZoneId.systemDefault())));
        referralDetail.setReferralReason("Referral Reason Here...");
        referralDetail.setUsualGP(getUsualGP());
        referralDetail.setReferralValidityDuration(RestrictedTimeInterval.getLowHighInstance(
                new PrecisionDate(Precision.DAY, LocalDate.of(2018, 1, 12).atStartOfDay(ZoneId.systemDefault())),
                new PrecisionDate(Precision.DAY, LocalDate.of(2019, 8, 22).atStartOfDay(ZoneId.systemDefault()))));
        return referralDetail;
    }

    private ParticipationServiceProvider getUsualGP() {
        ParticipationServiceProvider usualGP = new ParticipationServiceProviderImpl();
        usualGP.setRole(ANZSCO_1ED_2006.GENERAL_MEDICAL_PRACTITIONER);
        usualGP.setParticipant(getServiceProviderIndividual());
        return usualGP;
    }

    private ParticipationServiceProvider getReferee() {
        ParticipationServiceProvider referee = new ParticipationServiceProviderImpl();
        referee.setRole(ANZSCO_1ED_2006.SPECIALIST_PHYSICIANS_NEC);
        referee.setParticipant(getServiceProviderIndividual());
        return referee;
    }

    private ClinicalDocument getCDAClinicalDocument() {
        ClinicalDocument cdaClinicalDocument = ClinicalDocumentFactory.getEReferral();
        cdaClinicalDocument.setClinicalDocumentId(UUIDTool.uuidToOid(UUID.randomUUID().toString()));
        cdaClinicalDocument.setLanguageCode("en-AU");
        cdaClinicalDocument.setVersionNumber(1);
        cdaClinicalDocument.setCompletionCode(DocumentStatusCode.FINAL);
        return cdaClinicalDocument;
    }
}

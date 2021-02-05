package au.gov.nehta.builder.diagnostic.pathology;

import au.gov.nehta.builder.DocumentCreatorUtil;
import au.gov.nehta.model.clinical.common.participation.PersonName;
import au.gov.nehta.model.clinical.diagnostic.pathology.DocumentParticipant;
import au.gov.nehta.model.clinical.diagnostic.pathology.PathologyResult;
import au.gov.nehta.model.clinical.diagnostic.pathology.ReportDocument;
import au.gov.nehta.model.clinical.etp.common.participation.Entitlement;
import au.net.electronichealth.ns.cda._2_0.*;

import javax.xml.bind.JAXBElement;
import java.io.Serializable;
import java.util.List;

import static au.gov.nehta.builder.util.narrative.NarrativeUtil.*;

public class PathologyReportCreatorUtil extends DocumentCreatorUtil {

    public static StrucDocText getTestResultNarrativeBlock(PathologyResult pathologyResult) {

        StrucDocTable table = new StrucDocTable();

        StrucDocTbody body = addBody(table);
        addCaption(table, "Pathology Test Result");
        addHeader(table, "Collection Date", "Observation Date", "Test Result Name", "Diagnostic Service", "Status");

        String collectionTime = pathologyResult.getSpecimenDetail().getCollectionTime().format(NARRATIVE_DATE_TIME_FORMATTER);
        add(body,
                collectionTime,
                print(pathologyResult.getTestTime()),
                print(pathologyResult.getPathologyTestResultName()),
                print(pathologyResult.getDiagnosticService()),
                print(pathologyResult.getResultStatus())
        );

        return textWithTable(table);
    }

    public static StrucDocText getDocument(DocumentParticipant author, ReportDocument document) {
        StrucDocTable table = new StrucDocTable();
        StrucDocTbody body = addBody(table);

        // addCaption(table, "Related Document" );
        addHeader(table, "Report Date", "Report", "Identifier", "Reporting Pathologist", "Status");

        Serializable result;
        if (document.getTestResultsRepresentation() != null) {
            result = link(document.getTestResultsRepresentation().getFileName(), document.getReportTitle());
        } else {
            result = document.getReportTitle();
        }

        StrucDocTd name = printAuthorOrg(author);

        add(body,
                cell(print(document.getReportDate())),
                cell(result),
                cell(document.getDocumentID().getExtension()),
                name,
                cell(print(document.getReportStatus()))
        );

        return textWithTable(table);
    }

    protected static JAXBElement<StrucDocTable> getPathologist(DocumentParticipant author) {

        if (author.getParticipant() == null) return null;

        StrucDocTable table = new StrucDocTable();
        StrucDocTbody body = addBody(table);

        addCaption(table, "Reporting Pathologist");
        addHeader(table, "Field", "Value");

        PersonName name = author.getParticipant().getPerson().getPersonName();

        add(body, "Reporting Pathologist", render(name));

        String organisationName = author.getParticipant().getEmploymentOrganisation().getOrganisationName();
        if (organisationName != null) {
            add(body, "Organisation Name", organisationName);
        }

        List<Entitlement> entitlements = author.getParticipant().getEntitlement();
        if (entitlements != null) {
            for (Entitlement e : entitlements) {
                add(body, e.getEntitlementType().getDisplayName(), e.getEntitlementNumber().getExtension());
            }
        }

        if (author.getParticipant().getAddresses() != null) {
            body.getTr().add(
                    createTableBodyRowWithCells(getProviderAddressCells("Address", author.getParticipant().getAddresses())));
        }

        return new ObjectFactory().createStrucDocTextTable(table);
    }
}

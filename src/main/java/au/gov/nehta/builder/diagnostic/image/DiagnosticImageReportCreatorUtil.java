package au.gov.nehta.builder.diagnostic.image;

import au.gov.nehta.builder.DocumentCreatorUtil;
import au.gov.nehta.model.clinical.diagnostic.imaging.AnatomicalSite;
import au.gov.nehta.model.clinical.diagnostic.imaging.DiagnosticImageReportContent;
import au.gov.nehta.model.clinical.diagnostic.imaging.ImagingExaminationResult;
import au.gov.nehta.model.clinical.diagnostic.pathology.DocumentParticipant;
import au.gov.nehta.model.clinical.diagnostic.pathology.ReportDocument;
import au.net.electronichealth.ns.cda._2_0.StrucDocContent;
import au.net.electronichealth.ns.cda._2_0.StrucDocTable;
import au.net.electronichealth.ns.cda._2_0.StrucDocTbody;
import au.net.electronichealth.ns.cda._2_0.StrucDocTd;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;

import java.io.Serializable;
import java.util.List;
import javax.xml.bind.JAXBElement;

public class DiagnosticImageReportCreatorUtil extends DocumentCreatorUtil {

    public static StrucDocText getImageExaminationResultNarrativeBlock(
            ImagingExaminationResult imageResult) {

        StrucDocTable table = new StrucDocTable();

        StrucDocTbody body = addBody(table);
        addCaption(table, "Imaging Examination Result");
        addHeader(table,
                "Image Date",
                "Observation Date",
                "Result",
                "Modality",
                "Procedure",
                "Anatomical Region",
                "Status");

        Serializable result = null;
        if (imageResult.getRelatedImage() != null) {
            result = link(imageResult.getRelatedImage(), print(imageResult.getImagingResultName()));
        } else {
            result = print(imageResult.getImagingResultName());
        }

        //TODO: verify the difference between image date time and observation date time
        add(body,
                cell(print(imageResult.getImageDateTime())),
                cell(print(imageResult.getImageDateTime())),
                cell(result),
                cell(print(imageResult.getModality())),
                cell(imageResult.getExaminationProcedure()),
                null != imageResult.getAnatomicalRegion() ? cell(
                        safe(print(imageResult.getAnatomicalRegion().getRegionCode()))) : cell("NA"),
                cell(print(imageResult.getOverallResultStatusCode()))
        );

        StrucDocText text = textWithTable(table);
        List<AnatomicalSite> sites = imageResult.getSites();
        if (sites != null && sites.size() > 0) {
            addTable(text, getSiteNarrative(sites));
        }
        return text;
    }

    private static StrucDocTable getSiteNarrative(List<AnatomicalSite> sites) {

        StrucDocTable table = new StrucDocTable();

        StrucDocTbody body = addBody(table);
        addCaption(table, "Anatomical Site");
        addHeader(table, "Name of Location/Description", "Side");

        for (AnatomicalSite site : sites) {
            add(body, print(site.getSpecificLocationName()) + " " + safe(site.getDescription()),
                    print(site.getSpecificLocationSide()));
        }

        return table;
    }

    public static StrucDocText diagnosticImageSection(DiagnosticImageReportContent content) {

        StrucDocTable table = new StrucDocTable();

        StrucDocTbody body = addBody(table);
        addHeader(table, "Report Date", "Report", "Reporting Radiologist", "Status");

        ReportDocument rd = content.getRelatedDocument();
        JAXBElement<StrucDocContent> link = link(rd.getTestResultsRepresentation().getFileName(),
                rd.getReportTitle());
        DocumentParticipant reportingRadiologist = content.getReportingRadiologist();

        StrucDocTd name = printAuthorOrg(reportingRadiologist);

        add(body, cell(print(rd.getReportDate())), cell(link), name, cell(print(rd.getReportStatus())));

        return textWithTable(table);
    }
}

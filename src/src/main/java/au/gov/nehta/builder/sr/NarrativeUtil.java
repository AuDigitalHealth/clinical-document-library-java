package au.gov.nehta.builder.sr;

import static au.gov.nehta.builder.DocumentCreatorUtil.add;
import static au.gov.nehta.builder.DocumentCreatorUtil.addBody;
import static au.gov.nehta.builder.DocumentCreatorUtil.addCaption;
import static au.gov.nehta.builder.DocumentCreatorUtil.addHeader;
import static au.gov.nehta.builder.DocumentCreatorUtil.addTable;
import static au.gov.nehta.builder.DocumentCreatorUtil.getBoldTextTd;
import static au.gov.nehta.builder.DocumentCreatorUtil.getNormalTextTd;
import static au.gov.nehta.builder.DocumentCreatorUtil.link;
import static au.gov.nehta.builder.DocumentCreatorUtil.narrativeVersion;
import static au.gov.nehta.builder.DocumentCreatorUtil.print;
import static au.gov.nehta.builder.DocumentCreatorUtil.safe;

import au.gov.nehta.model.clinical.sr.CurrentServices;
import au.gov.nehta.model.clinical.sr.InterpreterRequiredAlert;
import au.gov.nehta.model.clinical.sr.OtherAlert;
import au.gov.nehta.model.clinical.sr.RelatedDocument;
import au.gov.nehta.model.clinical.sr.RequestedService;
import au.net.electronichealth.ns.cda._2_0.ObjectFactory;
import au.net.electronichealth.ns.cda._2_0.StrucDocCaption;
import au.net.electronichealth.ns.cda._2_0.StrucDocItem;
import au.net.electronichealth.ns.cda._2_0.StrucDocList;
import au.net.electronichealth.ns.cda._2_0.StrucDocParagraph;
import au.net.electronichealth.ns.cda._2_0.StrucDocTable;
import au.net.electronichealth.ns.cda._2_0.StrucDocTbody;
import au.net.electronichealth.ns.cda._2_0.StrucDocTd;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import java.util.LinkedList;
import java.util.List;
import java.util.Objects;

public class NarrativeUtil {

  private static final String HL7_TEXT_MEDIA_TYPE = "text/x-hl7-text+xml";
  private static ObjectFactory objectFactory = new ObjectFactory();

  static void getInterpreterRequiredAlert(StrucDocText narrative,
      InterpreterRequiredAlert interpreterRequiredAlert) {
    StrucDocTable interpreterReqAlertTable = objectFactory.createStrucDocTable();
    StrucDocTbody interpreterReqAlertTBody = addBody(interpreterReqAlertTable);
    addCaption(interpreterReqAlertTable, "Interpreter Required Alert");
    addHeader(interpreterReqAlertTable, "Field", "Value");
    add(interpreterReqAlertTBody,
        new LinkedList<StrucDocTd>() {{
          add(getBoldTextTd("Alert Description"));
          add(getNormalTextTd(safe(print(interpreterRequiredAlert.getAlertDescription()))));
        }}
    );
    if (null != interpreterRequiredAlert.getPreferredLanguages()) {
      StrucDocList langList = objectFactory.createStrucDocList();
      langList.setCaption(new StrucDocCaption() {{
        getContent().add("Preferred Languages");
      }});
      interpreterRequiredAlert.getPreferredLanguages().stream().filter(Objects::nonNull)
          .forEach(lang -> {
            StrucDocItem langItem = objectFactory.createStrucDocItem();
            langItem.getContent().add(print(lang));
            langList.getItem().add(langItem);
          });
      add(interpreterReqAlertTBody, new LinkedList<StrucDocTd>() {{
        add(getBoldTextTd("Preferred Languages"));
        add(new StrucDocTd() {{
          getContent().add(objectFactory.createStrucDocTdList(langList));
        }});
      }});
    }
    addTable(narrative, interpreterReqAlertTable);
  }

  public static StrucDocText getRelatedDocuments(List<RelatedDocument> relatedDocuments) {
    StrucDocText narrative = objectFactory.createStrucDocText();
    narrative.setMediaType(HL7_TEXT_MEDIA_TYPE);
    StrucDocTable relatedDocsTable = objectFactory.createStrucDocTable();
    StrucDocTbody relatedDocsTBody = addBody(relatedDocsTable);
    addCaption(relatedDocsTable, "Related Documents");
    addHeader(relatedDocsTable, "Title", "Type", "File Name", "Media Type");

    relatedDocuments.stream().filter(Objects::nonNull).forEach(relatedDocument -> {
          StrucDocTd docTargetTd = objectFactory.createStrucDocTd();
          //creating content > linkHtml
          docTargetTd.getContent().add(link(relatedDocument.getDocumentTarget().getFileName(),
              relatedDocument.getDocumentDetail().getDocumentTitle(),
              relatedDocument.getDocumentDetail().getDocumentIdentifier().getRoot()));
          StrucDocTd titleTd = objectFactory.createStrucDocTd();
          titleTd.getContent().add(safe(relatedDocument.getDocumentDetail().getDocumentTitle()));
          StrucDocTd docTypeTd = objectFactory.createStrucDocTd();
          docTypeTd.getContent()
              .add(safe(print(relatedDocument.getDocumentDetail().getDocumentType())));
          StrucDocTd mediaTypeTd = objectFactory.createStrucDocTd();
          mediaTypeTd.getContent().add(safe(relatedDocument.getDocumentTarget().getMediaType()));
          add(relatedDocsTBody, titleTd, docTypeTd, docTargetTd, mediaTypeTd);
        }
    );
    addTable(narrative, relatedDocsTable);
    return narrative;
  }

  static void getRequestedServices(StrucDocText narrative,
      List<RequestedService> requestedServices) {
    narrative.getContent().add(objectFactory.createStrucDocTextParagraph(new StrucDocParagraph() {{
      getStyleCode().add("Bold Underline");
      getContent().add("Requested Services");
    }}));
    requestedServices.stream().filter(Objects::nonNull).forEach(requestedService -> {
      StrucDocTable reqServicesTable = objectFactory.createStrucDocTable();
      StrucDocTbody reqServicesTBody = addBody(reqServicesTable);
      addHeader(reqServicesTable, "Field", "Value");
      add(reqServicesTBody, getBoldTextTd("Service Desc"),
          getNormalTextTd(safe(print(requestedService.getServiceDesc()))));
      add(reqServicesTBody, getBoldTextTd("Service Category"),
          getNormalTextTd(safe(print(requestedService.getServiceCategory()))));
      add(reqServicesTBody, getBoldTextTd("Reason for Service"),
          getNormalTextTd(safe(print(requestedService.getReasonForService()))));
      add(reqServicesTBody, getBoldTextTd("Reason for Service Desc"),
          getNormalTextTd(safe(requestedService.getReasonForServiceDesc())));
      add(reqServicesTBody, getBoldTextTd("Request Urgency"),
          getNormalTextTd(safe(print(requestedService.getRequestUrgency()))));
      add(reqServicesTBody, getBoldTextTd("Urgency Notes"),
          getNormalTextTd(safe(requestedService.getRequestUrgencyNotes())));
      add(reqServicesTBody, getBoldTextTd("Service Comment"),
          getNormalTextTd(safe(requestedService.getServiceComment())));
      add(reqServicesTBody, getBoldTextTd("Service Commencement Window"), getNormalTextTd(
          safe(narrativeVersion(requestedService.getServiceCommencementWindow()))));
      add(reqServicesTBody, getBoldTextTd("Request Service DateTime"), getNormalTextTd(
          safe(requestedService.getRequestedServiceDateTime().toNarrativeForm())));
      add(reqServicesTBody, getBoldTextTd("Booking Status"),
          getNormalTextTd(safe(requestedService.getServiceBookingStatus().getName())));
      add(reqServicesTBody, getBoldTextTd("Request Validity Period"),
          getNormalTextTd(narrativeVersion(requestedService.getRequestValidityPeriod())));
      StrucDocTd headerTd = objectFactory.createStrucDocTd();
      headerTd.setColspan("2");
      headerTd.getStyleCode().add("Bold");
      headerTd.getContent().add("Service Provider:");
      add(reqServicesTBody, headerTd);
      StrucDocTd serviceProviderTd = au.gov.nehta.builder.util.narrative.NarrativeUtil
          .getParticipationServiceProviderTdNarrative(requestedService.getServiceProvider());
      serviceProviderTd.setColspan("2");
      add(reqServicesTBody, serviceProviderTd);
      addTable(narrative, reqServicesTable);
    });
  }

  static void getOtherAlerts(StrucDocText narrative, List<OtherAlert> otherAlerts) {
    StrucDocTable otherAlertsTable = objectFactory.createStrucDocTable();
    StrucDocTbody otherAlertsTBody = addBody(otherAlertsTable);
    addCaption(otherAlertsTable, "Other Alerts");
    addHeader(otherAlertsTable, "Description", "Type");
    otherAlerts.stream().filter(Objects::nonNull).forEach(otherAlert ->
        add(otherAlertsTBody,
            safe(print(otherAlert.getAlertDesc())),
            safe(print(otherAlert.getAlertType()))
        ));
    addTable(narrative, otherAlertsTable);
  }

  static StrucDocText getCurrentServices(CurrentServices currentService) {
    StrucDocText narrative = objectFactory.createStrucDocText();
    StrucDocTable currentServicesTable = objectFactory.createStrucDocTable();
    StrucDocTbody currentServicesTBody = addBody(currentServicesTable);
    addCaption(currentServicesTable, "Current Services");
    addHeader(currentServicesTable, "Category", "Description", "Booking Status", "Service DateTime",
        "Service Comment");
    currentService.getCurrentServices().stream().filter(Objects::nonNull).forEach(service -> {
      List<StrucDocTd> columns = new LinkedList<StrucDocTd>() {{
        add(getNormalTextTd(safe(print(service.getServiceCategory()))));
        add(getNormalTextTd(safe(print(service.getServiceDesc()))));
        add(getNormalTextTd(safe(service.getServiceBookingStatus().getName())));
        add(getNormalTextTd(safe(service.getRequestedServiceDateTime().toNarrativeForm())));
        add(getNormalTextTd(safe(service.getServiceComment())));
      }};
      add(currentServicesTBody, columns);
      StrucDocTd headerTd = objectFactory.createStrucDocTd();
      headerTd.getStyleCode().add("Bold");
      headerTd.getContent().add("Service Provider:");
      headerTd.setColspan("5");
      add(currentServicesTBody, headerTd);
      StrucDocTd serviceProviderTd = au.gov.nehta.builder.util.narrative.NarrativeUtil
          .getParticipationServiceProviderTdNarrative(service.getServiceProvider());
      serviceProviderTd.setColspan("5");
      add(currentServicesTBody, serviceProviderTd);
    });
    addTable(narrative, currentServicesTable);
    return narrative;
  }
}

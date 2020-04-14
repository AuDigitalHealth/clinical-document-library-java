package au.gov.nehta.builder.sl;

import static au.gov.nehta.builder.DocumentCreatorUtil.HL7_TEXT_MEDIA_TYPE;
import static au.gov.nehta.builder.DocumentCreatorUtil.add;
import static au.gov.nehta.builder.DocumentCreatorUtil.addBody;
import static au.gov.nehta.builder.DocumentCreatorUtil.addCaption;
import static au.gov.nehta.builder.DocumentCreatorUtil.addHeader;
import static au.gov.nehta.builder.DocumentCreatorUtil.addTable;
import static au.gov.nehta.builder.DocumentCreatorUtil.getNormalTextTd;
import static au.gov.nehta.builder.DocumentCreatorUtil.narrativeVersion;
import static au.gov.nehta.builder.DocumentCreatorUtil.print;
import static au.gov.nehta.builder.DocumentCreatorUtil.safe;

import au.gov.nehta.builder.util.narrative.NarrativeUtil;
import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProvider;
import au.gov.nehta.model.clinical.sl.Recommendations;
import au.gov.nehta.model.clinical.sl.ResponseDetails;
import au.net.electronichealth.ns.cda._2_0.ObjectFactory;
import au.net.electronichealth.ns.cda._2_0.StrucDocCaption;
import au.net.electronichealth.ns.cda._2_0.StrucDocRenderMultiMedia;
import au.net.electronichealth.ns.cda._2_0.StrucDocTable;
import au.net.electronichealth.ns.cda._2_0.StrucDocTbody;
import au.net.electronichealth.ns.cda._2_0.StrucDocTd;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import java.util.LinkedList;
import java.util.List;
import java.util.Objects;
import javax.xml.bind.JAXBElement;

public class SpecialistLetterNarrativeUtil {

  private static ObjectFactory objectFactory = new ObjectFactory();

  static StrucDocText getNarrativeForRecommendations(Recommendations recommendations) {
    if (null != recommendations.getCustomNarrative()) {
      return recommendations.getCustomNarrative();
    }
    StrucDocText narrative = objectFactory.createStrucDocText();
    narrative.setMediaType(HL7_TEXT_MEDIA_TYPE);
    if (null != recommendations.getRecommendationList()
        && !recommendations.getRecommendationList().isEmpty()) {
      StrucDocTable recommendationTable = objectFactory.createStrucDocTable();
      StrucDocTbody recommendationTBody = addBody(recommendationTable);
      addCaption(recommendationTable, "Recommendations");
      addHeader(recommendationTable, "Recommendation", "Addressee", "Time Frame");
      recommendations.getRecommendationList().stream().filter(Objects::nonNull).forEach(
          recommendation -> {
            //Recommendation
            ParticipationServiceProvider participationServiceProvider = recommendation
                .getAddressee();
            StrucDocTd addresseeTd = NarrativeUtil.getParticipationServiceProviderTdNarrative(
                participationServiceProvider);
            List<StrucDocTd> recommendationCols = new LinkedList<>();
            recommendationCols.add(getNormalTextTd(recommendation.getRecommendationNarrative()));
            recommendationCols.add(addresseeTd);
            recommendationCols
                .add(getNormalTextTd(null != recommendation.getTimeFrame()
                    ? narrativeVersion(recommendation.getTimeFrame()) : "NA"));
            add(recommendationTBody, recommendationCols);
          });
      if (null != recommendations.getRecommendationsExclusion()) {
        add(recommendationTBody, new LinkedList<StrucDocTd>() {{
          add(new StrucDocTd() {{
            getStyleCode().add("Underline Bold");
            getContent().add("Exclusion Statement:");
          }});
          add(new StrucDocTd() {{
            getContent().add(recommendations.getRecommendationsExclusion().getGeneralStatement());
            setColspan("2");
          }});
        }});
      }
      addTable(narrative, recommendationTable);
    }
    return narrative;
  }

  static StrucDocText getResponseDetailsNarrative(ResponseDetails responseDetails) {
    if (null != responseDetails.getCustomNarrative()) {
      return responseDetails.getCustomNarrative();
    }
    StrucDocText narrative = objectFactory.createStrucDocText();
    narrative.setMediaType(HL7_TEXT_MEDIA_TYPE);
    StrucDocTable responseDetailsTable = objectFactory.createStrucDocTable();
    StrucDocTbody responseDetailsTBody = addBody(responseDetailsTable);
    addCaption(responseDetailsTable, "Response Details >> Response Narrative");
    addHeader(responseDetailsTable, "Response Narrative");
    add(responseDetailsTBody, safe(responseDetails.getResponseNarrative().getNarrative()));
    addTable(narrative, responseDetailsTable);
    if (null != responseDetails.getDiagnoses() && !responseDetails.getDiagnoses().isEmpty()) {
      StrucDocTable diagnosesTable = objectFactory.createStrucDocTable();
      StrucDocTbody diagnosesTBody = addBody(diagnosesTable);
      addCaption(diagnosesTable, "ResponseDetails >> Diagnoses");
      addHeader(diagnosesTable, "Diagnoses");
      responseDetails.getDiagnoses().stream().filter(Objects::nonNull)
          .forEach(diagnosis -> add(diagnosesTBody, safe(print(diagnosis.getDiagnosisName()))));
      addTable(narrative, diagnosesTable);
    }
    if (null != responseDetails.getOtherDiagnosisProcedureEntries()
        && !responseDetails.getOtherDiagnosisProcedureEntries().isEmpty()) {
      StrucDocTable otherDiagnosesTable = objectFactory.createStrucDocTable();
      StrucDocTbody otherDiagnosesTBody = addBody(otherDiagnosesTable);
      addCaption(otherDiagnosesTable, "ResponseDetails >> Other Diagnoses Procedure Entries");
      addHeader(otherDiagnosesTable, "Other Diagnoses Procedure Entry");
      responseDetails.getOtherDiagnosisProcedureEntries().stream().filter(Objects::nonNull).forEach(
          otherDiagnosisProcedureEntry -> add(otherDiagnosesTBody,
              safe(otherDiagnosisProcedureEntry.getOtherDiagnosisOrProcedureName()))
      );
      addTable(narrative, otherDiagnosesTable);
    }
    if (null != responseDetails.getProcedures() && !responseDetails.getProcedures().isEmpty()) {
      StrucDocTable proceduresTable = objectFactory.createStrucDocTable();
      StrucDocTbody proceduresTBody = addBody(proceduresTable);
      addCaption(proceduresTable, "ResponseDetails >> Procedures");
      addHeader(proceduresTable, "Procedure");
      responseDetails.getProcedures().stream().filter(Objects::nonNull)
          .forEach(procedure -> add(proceduresTBody, print(procedure.getProcedureName())));
      addTable(narrative, proceduresTable);
    }
    return narrative;
  }

  public static JAXBElement<StrucDocRenderMultiMedia> getMultimediaFromAttachedMedia(
      AttachedMedia attachedMedia, String s) {
    StrucDocRenderMultiMedia multiMedia = new StrucDocRenderMultiMedia();
    StrucDocCaption caption = new StrucDocCaption();
    caption.getContent()
        .add(String.format(s, null != attachedMedia && null != attachedMedia.getFileName()
            ? attachedMedia.getFileName() : ""));
    multiMedia.setCaption(caption);
    //multiMedia.setID(attachedMedia.getObservationMediaReference().getIDAttribute());
    if (null != attachedMedia) {
      multiMedia.getReferencedObject().add(attachedMedia.getObservationMediaReference());
    }
    return objectFactory.createStrucDocTextRenderMultiMedia(multiMedia);
  }

}
package au.gov.nehta.builder.common.components;

import au.gov.nehta.builder.util.CDATypeUtil;
import au.gov.nehta.builder.util.Converter;
import au.gov.nehta.model.cda.common.code.Coded;
import au.net.electronichealth.ns.cda._2_0.ActClassObservation;
import au.net.electronichealth.ns.cda._2_0.CD;
import au.net.electronichealth.ns.cda._2_0.ObjectFactory;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Entry;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Observation;
import au.net.electronichealth.ns.cda._2_0.XActMoodDocumentObservation;
import java.util.UUID;

public class ExclusionStatementComponent {

  private static ObjectFactory objectFactory = new ObjectFactory();

  public POCDMT000040Entry createExclusionStatement(CD globalStatementCD, Coded value,
      ActClassObservation classCode, XActMoodDocumentObservation moodCode) {
    POCDMT000040Entry entry = objectFactory.createPOCDMT000040Entry();
    POCDMT000040Observation observation = objectFactory.createPOCDMT000040Observation();
    observation.setClassCode(classCode);
    observation.setMoodCode(moodCode);
    observation.setCode(globalStatementCD);
    observation.getValue().add(Converter.convertToCDCode(value));
    observation.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    entry.setObservation(observation);
    return entry;
  }

}

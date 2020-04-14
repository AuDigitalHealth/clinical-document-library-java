package au.gov.nehta.model.cda.common.code;

import java.util.Collections;
import java.util.List;


public enum PatientCategory  implements Coded{
    CONTINUED_DISPENSING_PATIENT("D", "continued dispensing patient"),
    PAPERLESS_PRIVATE_HOSPITAL_PATIENT("H","paperless private hospital patient"),
    PUBLIC_HOSPITAL_PATIENT("B","public hospital patient"),
    NURSING_HOME_PATIENT("N","nursing home patient"),
    PAPERLESS_PUBLIC_HOSPITAL_PATIENT("C","paperless public hospital patient"),
    COMMUNITY_PATIENT("0","community patient"),
    HOSPITAL_NOT_IDENTIFIED("1","hospital patient not identified by any of the above(R)"),
    RESIDENTIAL_AGED_CARE_PATIENT_PAPERLESS("1","residential aged care facility patient (paperless)");
    ;

    
    public final String CODE_SYSTEM = "1.2.36.1.5001.1.1.3.2.5";
    public final String CODE_SYSTEM_NAME = "Patient Category";
    private final String descriptor;
    private String code;
    
    private PatientCategory(String code, String displayName) {
     this.descriptor=displayName;
     this.code=code;
    }
    @Override
    public String getCodeSystem() {
        return CODE_SYSTEM;
    }

    @Override
    public String getCodeSystemName() {
        return CODE_SYSTEM_NAME;
    }
    
    @Override
    public String getCodeSystemVersion() {
        return null;
    }

    @Override
    public String getDisplayName() {
        return descriptor;
    }

    @Override
    public String getOriginalText() {
        return null;
    }

    @Override
    public boolean isCoded() {
        return null != code;
    }
    
    @Override
    public String getCode() {
        return code;
    }
    @Override
    public List<Code> getTranslations() {
        return Collections.emptyList();
    }
    
  
}

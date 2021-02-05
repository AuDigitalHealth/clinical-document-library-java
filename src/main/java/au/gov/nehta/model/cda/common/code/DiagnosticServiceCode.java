package au.gov.nehta.model.cda.common.code;

public class DiagnosticServiceCode extends CodeImpl implements Code {

    /*
     * 10.5 AS 5017-2006:
     */

    public static final String CODE_SYSTEM_NAME = "HL7 Diagnostic service section ID";
    public static final String CODE_SYSTEM = "2.16.840.1.113883.12.74";

    public static final DiagnosticServiceCode AUDIOLOGY = new DiagnosticServiceCode(DiagnosticService.AUDIOLOGY);
    public static final DiagnosticServiceCode BEDSIDE_ICU_MONITORING = new DiagnosticServiceCode(DiagnosticService.BEDSIDE_ICU_MONITORING);
    public static final DiagnosticServiceCode BLOOD_BANK = new DiagnosticServiceCode(DiagnosticService.BLOOD_BANK);
    public static final DiagnosticServiceCode BLOOD_GASES = new DiagnosticServiceCode(DiagnosticService.BLOOD_GASES);
    public static final DiagnosticServiceCode CARDIAC_CATHETERIZATION = new DiagnosticServiceCode(DiagnosticService.CARDIAC_CATHETERIZATION);
    public static final DiagnosticServiceCode CARDIAC_ULTRASOUND = new DiagnosticServiceCode(DiagnosticService.CARDIAC_ULTRASOUND);
    public static final DiagnosticServiceCode CAT_SCAN = new DiagnosticServiceCode(DiagnosticService.CAT_SCAN);
    public static final DiagnosticServiceCode CHEMISTRY = new DiagnosticServiceCode(DiagnosticService.CHEMISTRY);
    public static final DiagnosticServiceCode CINERADIOGRAPH = new DiagnosticServiceCode(DiagnosticService.CINERADIOGRAPH);
    public static final DiagnosticServiceCode CYTOPATHOLOGY = new DiagnosticServiceCode(DiagnosticService.CYTOPATHOLOGY);
    public static final DiagnosticServiceCode ELECTROCARDIAC = new DiagnosticServiceCode(DiagnosticService.ELECTROCARDIAC);
    public static final DiagnosticServiceCode ELECTRONEURO = new DiagnosticServiceCode(DiagnosticService.ELECTRONEURO);
    public static final DiagnosticServiceCode HEMATOLOGY = new DiagnosticServiceCode(DiagnosticService.HEMATOLOGY);
    public static final DiagnosticServiceCode IMMUNOLOGY = new DiagnosticServiceCode(DiagnosticService.IMMUNOLOGY);
    public static final DiagnosticServiceCode LABORATORY = new DiagnosticServiceCode(DiagnosticService.LABORATORY);
    public static final DiagnosticServiceCode MICROBIOLOGY = new DiagnosticServiceCode(DiagnosticService.MICROBIOLOGY);
    public static final DiagnosticServiceCode MYCOBACTERIOLOGY = new DiagnosticServiceCode(DiagnosticService.MYCOBACTERIOLOGY);
    public static final DiagnosticServiceCode MYCOLOGY = new DiagnosticServiceCode(DiagnosticService.MYCOLOGY);
    public static final DiagnosticServiceCode NUCLEAR_MAGNETIC_RESONANCE = new DiagnosticServiceCode(DiagnosticService.NUCLEAR_MAGNETIC_RESONANCE);
    public static final DiagnosticServiceCode NUCLEAR_MEDICINE_SCAN = new DiagnosticServiceCode(DiagnosticService.NUCLEAR_MEDICINE_SCAN);
    public static final DiagnosticServiceCode NURSING_SERVICE_MEASURES = new DiagnosticServiceCode(DiagnosticService.NURSING_SERVICE_MEASURES);
    public static final DiagnosticServiceCode OB_ULTRASOUND = new DiagnosticServiceCode(DiagnosticService.OB_ULTRASOUND);
    public static final DiagnosticServiceCode OCCUPATIONAL_THERAPY = new DiagnosticServiceCode(DiagnosticService.OCCUPATIONAL_THERAPY);
    public static final DiagnosticServiceCode OTHER = new DiagnosticServiceCode(DiagnosticService.OTHER);
    public static final DiagnosticServiceCode OUTSIDE_LAB = new DiagnosticServiceCode(DiagnosticService.OUTSIDE_LAB);
    public static final DiagnosticServiceCode PHARMACY = new DiagnosticServiceCode(DiagnosticService.PHARMACY);
    public static final DiagnosticServiceCode PHYSICAL_THERAPY = new DiagnosticServiceCode(DiagnosticService.PHYSICAL_THERAPY);
    public static final DiagnosticServiceCode PHYSICIAN = new DiagnosticServiceCode(DiagnosticService.PHYSICIAN);
    public static final DiagnosticServiceCode PULMONARY_FUNCTION = new DiagnosticServiceCode(DiagnosticService.PULMONARY_FUNCTION);
    public static final DiagnosticServiceCode RADIATION_THERAPY = new DiagnosticServiceCode(DiagnosticService.RADIATION_THERAPY);
    public static final DiagnosticServiceCode RADIOGRAPH = new DiagnosticServiceCode(DiagnosticService.RADIOGRAPH);
    public static final DiagnosticServiceCode RADIOLOGY = new DiagnosticServiceCode(DiagnosticService.RADIOLOGY);
    public static final DiagnosticServiceCode RADIOLOGY_ULTRASOUND = new DiagnosticServiceCode(DiagnosticService.RADIOLOGY_ULTRASOUND);
    public static final DiagnosticServiceCode RESPIRATORY_CARE_THERAPY = new DiagnosticServiceCode(DiagnosticService.RESPIRATORY_CARE_THERAPY);
    public static final DiagnosticServiceCode SEROLOGY = new DiagnosticServiceCode(DiagnosticService.SEROLOGY);
    public static final DiagnosticServiceCode SURGICAL_PATHOLOGY = new DiagnosticServiceCode(DiagnosticService.SURGICAL_PATHOLOGY);
    public static final DiagnosticServiceCode TOXICOLOGY = new DiagnosticServiceCode(DiagnosticService.TOXICOLOGY);
    public static final DiagnosticServiceCode VASCULAR_ULTRASOUND = new DiagnosticServiceCode(DiagnosticService.VASCULAR_ULTRASOUND);
    public static final DiagnosticServiceCode VIROLOGY = new DiagnosticServiceCode(DiagnosticService.VIROLOGY);

    public DiagnosticServiceCode(DiagnosticService code) {
        setCodeSystem(CODE_SYSTEM);
        setCodeSystemName(CODE_SYSTEM_NAME);
        setCode(code.getCode());
        setDisplayName(code.getDisplayName());
    }

    public DiagnosticServiceCode(String code, String displayName) {
        setCodeSystem(CODE_SYSTEM);
        setCodeSystemName(CODE_SYSTEM_NAME);
        setCode(code);
        setDisplayName(displayName);
    }

    /**
     * The enum of diagnosticSourceCode provides an iterable list for resolving codes to enum
     */
    public enum DiagnosticService {

        AUDIOLOGY("Audiology", "AU"),
        BEDSIDE_ICU_MONITORING("Bedside ICU Monitoring", "ICU"),
        BLOOD_BANK("Blood Bank", "BLB"),
        BLOOD_GASES("Blood Gases", "BG"),
        CARDIAC_CATHETERIZATION("Cardiac Catheterization", "CTH"),
        CARDIAC_ULTRASOUND("Cardiac Ultrasound", "CUS"),
        CAT_SCAN("CAT Scan", "CT"),
        CHEMISTRY("Chemistry", "CH"),
        CINERADIOGRAPH("Cineradiograph", "XRC"),
        CYTOPATHOLOGY("Cytopathology", "CP"),
        ELECTROCARDIAC("Electrocardiac (e.g., EKG, EEC, Holter)", "EC"),
        ELECTRONEURO("Electroneuro, (EEG, EMG,EP,PSG)", "EN"),
        HEMATOLOGY("Hematology", "HM"),
        IMMUNOLOGY("Immunology", "IMM"),
        LABORATORY("Laboratory", "LAB"),
        MICROBIOLOGY("Microbiology", "MB"),
        MYCOBACTERIOLOGY("Mycobacteriology", "MCB"),
        MYCOLOGY("Mycology", "MYC"),
        NUCLEAR_MAGNETIC_RESONANCE("Nuclear Magnetic Resonance", "NMR"),
        NUCLEAR_MEDICINE_SCAN("Nuclear Medicine Scan", "NMS"),
        NURSING_SERVICE_MEASURES("Nursing Service Measures", "NRS"),
        OB_ULTRASOUND("OB Ultrasound", "OUS"),
        OCCUPATIONAL_THERAPY("Occupational Therapy", "OT"),
        OTHER("Other", "OTH"),
        OUTSIDE_LAB("Outside Lab", "OSL"),
        PHARMACY("Pharmacy", "PHR"),
        PHYSICAL_THERAPY("Physical Therapy", "PT"),
        PHYSICIAN("Physician (Hx. Dx, admission note,etc.)", "PHY"),
        PULMONARY_FUNCTION("Pulmonary Function", "PF"),
        RADIATION_THERAPY("Radiation Therapy", "RT"),
        RADIOGRAPH("Radiograph", "RX"),
        RADIOLOGY("Radiology", "RAD"),
        RADIOLOGY_ULTRASOUND("Radiology Ultrasound", "RUS"),
        RESPIRATORY_CARE_THERAPY("Respiratory Care (therapy)", "RC"),
        SEROLOGY("Serology", "SR"),
        SURGICAL_PATHOLOGY("Surgical Pathology", "SP"),
        TOXICOLOGY("Toxicology", "TX"),
        VASCULAR_ULTRASOUND("Vascular Ultrasound", "VUS"),
        VIROLOGY("Virology", "VR");

        String displayName;
        String code;

        DiagnosticService(String displayName, String code) {
            this.displayName = displayName;
            this.code = code;
        }

        /**
         * @return the displayName
         */
        public String getDisplayName() {
            return displayName;
        }

        /**
         * @return the code
         */
        public String getCode() {
            return code;
        }
    }
}

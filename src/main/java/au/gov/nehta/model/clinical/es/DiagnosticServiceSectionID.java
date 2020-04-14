package au.gov.nehta.model.clinical.es;

public enum DiagnosticServiceSectionID {

    // Undefined, this is the default value if the enum is left unset.
    Undefined(null, null),

    /// Audiology

    Audiology("AU", "Audiology"),

    /// Bedside ICU Monitoring

    BedsideICUMonitoring("ICU", "Bedside ICU Monitoring"),

    /// Blood Bank

    BloodBank("BLB", "Blood Bank"),

    /// Blood Gases

    BloodGases("BG", "Blood Gases"),

    /// Cardiac Catheterization

    CardiacCatheterization("CTH", "Cardiac Catheterization"),

    /// Cardiac Ultrasound

    CardiacUltrasound("CUS", "Cardiac Ultrasound"),

    /// CAT Scan

    CATScan("CT", "CAT Scan"),

    /// Chemistry

    Chemistry("CH", "Chemistry"),

    /// Cineradiograph

    Cineradiograph("XRC", "Cineradiograph"),

    /// Cytogenetics

    Cytogenetics("CG", "Cytogenetics"),

    /// Cytopathology

    Cytopathology("CP", "Cytopathology"),

    /// Electrocardiac (e.g., EKG, EEC, Holter)

    Electrocardiac("EC", "Electrocardiac (e.g., EKG, EEC, Holter)"),

    /// Electroneuro (EEG, EMG,EP,PSG)

    Electroneuro("EN", "Electroneuro (EEG, EMG,EP,PSG)"),

    /// Genetics

    Genetics("GE", "Genetics"),

    /// Hematology

    Hematology("HM", "Hematology"),

    /// Diagnostic Imaging
    DiagnosticImaging("IMG", "Diagnostic Imaging"),

    /// Immunology

    Immunology("IMM", "Immunology"),

    /// Laboratory

    Laboratory("LAB", "Laboratory"),

    /// Microbiology

    Microbiology("MB", "Microbiology"),

    /// Mycobacteriology

    Mycobacteriology("MCB", "Mycobacteriology"),

    /// Mycology

    Mycology("MYC", "Mycology"),

    /// Nuclear Magnetic Resonance

    NuclearMagneticResonance("NMR", "Nuclear Magnetic Resonance"),

    /// Nuclear Medicine Scan

    NuclearMedicineScan("NMS", "Nuclear Medicine Scan"),

    /// Nursing Service Measures

    NursingServiceMeasures("NRS", "Nursing Service Measures"),

    /// OB Ultrasound

    OBUltrasound("OUS", "OB Ultrasound"),

    /// Occupational Therapy

    OccupationalTherapy("OT", "Occupational Therapy"),

    /// Other

    Other("OTH", "Other"),

    /// Outside Lab

    OutsideLab("OSL", "Outside Lab"),

    /// Parasitology

    Parasitology("PAR", "Parasitology"),

    /// Pathology (gross & histopath, not surgical)

    Pathology("PAT", "Pathology (gross & histopath, not surgical)"),

    /// Pharmacy

    Pharmacy("PHR", "Pharmacy"),

    /// Physical Therapy

    PhysicalTherapy("PT", "Physical Therapy"),

    /// Physician (Hx. Dx, admission note, etc.)

    Physician("PHY", "Physician (Hx. Dx, admission note, etc.)"),

    /// Pulmonary Function

    PulmonaryFunction("PF", "Pulmonary Function"),

    /// Radiation Therapy

    RadiationTherapy("RT", "Radiation Therapy"),

    /// Radiograph

    Radiograph("RX", "Radiograph"),

    /// Radiology

    Radiology("RAD", "Radiology"),

    /// Radiology Ultrasound

    RadiologyUltrasound("RUS", "Radiology Ultrasound"),

    /// Radiology Ultrasound

    RespiratoryCare("RC", "Respiratory Care (therapy)"),

    /// Serology

    Serology("SR", "Serology"),

    /// Surgical Pathology

    SurgicalPathology("SP", "Surgical Pathology"),

    /// Toxicology

    Toxicology("TX", "Toxicology"),

    /// Urinalysis

    Urinalysis("URN", "Urinalysis"),

    /// Vascular Ultrasound

    VascularUltrasound("VUS", "Vascular Ultrasound"),

    /// Virology

    Virology("VR", "Virology");

    private String code;
    private String name;
    private String codeSystemName = "HL7 Diagnostic service section ID";
    private String codeSystem = "2.16.840.1.113883.12.74";

    DiagnosticServiceSectionID(String code, String name) {
        this.name = name;
        this.code = code;
    }

    public String getCode() {
        return code;
    }

    public String getName() {
        return name;
    }

    public String getCodeSystemName() {
        return codeSystemName;
    }

    public String getCodeSystem() {
        return codeSystem;
    }
}

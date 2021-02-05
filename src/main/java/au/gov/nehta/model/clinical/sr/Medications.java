package au.gov.nehta.model.clinical.sr;

import au.gov.nehta.model.clinical.shs.ExclusionStatement;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import java.util.List;

public interface Medications {

    /* Used with SpecialistLetter. */
    ExclusionStatement getExclusionStatement();

    /* Used with SpecialistLetter. */
    void setExclusionStatement(ExclusionStatement exclusionStatement);

    List<KnownMedication> getKnownMedications();

    StrucDocText getCustomNarrative();

    void setCustomNarrative(StrucDocText customNarrative);

    void setKnownMedications(List<KnownMedication> knownMedications);
}

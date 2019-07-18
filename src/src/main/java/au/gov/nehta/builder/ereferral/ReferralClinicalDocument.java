package au.gov.nehta.builder.ereferral;

import au.gov.nehta.model.cda.common.code.DocumentStatusCode;
import au.gov.nehta.model.cda.common.document.BaseClinicalDocument;

public interface ReferralClinicalDocument extends BaseClinicalDocument{

    /**
     * @return the code
     */
    public abstract DocumentStatusCode getCompletionCode();

}
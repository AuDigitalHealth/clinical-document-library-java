package au.gov.nehta.model.common;

import au.gov.nehta.model.cda.common.custodian.Custodian;
import au.gov.nehta.model.cda.common.document.BaseClinicalDocument;
import au.gov.nehta.model.cda.common.id.LegalAuthenticator;

public interface CDAModel {

	public abstract BaseClinicalDocument getBaseClinicalDocument();

	public abstract LegalAuthenticator getLegalAuthenticator();

	public abstract Custodian getCustodian();

}
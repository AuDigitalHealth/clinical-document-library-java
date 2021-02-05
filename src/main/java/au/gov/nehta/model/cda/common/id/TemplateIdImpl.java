package au.gov.nehta.model.cda.common.id;

import au.gov.nehta.model.clinical.common.types.UniqueIdentifierImpl;

public class TemplateIdImpl extends UniqueIdentifierImpl implements TemplateId {

    private TemplateIdImpl(String extension, String root) {
        this.extension = extension;
        this.root = root;
    }

    public static TemplateId getInstance(String extension, String root) {
        return new TemplateIdImpl(extension, root);
    }
}

package au.gov.nehta.model.clinical.etp.common.item;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.cda.common.id.TemplateId;

/**
 * @author philip.wilford
 * Date: 18/06/2021
 * Time: 11:38 am
 */
public class PdfMedia extends AttachedMedia {
    private static final String MEDIA_TYPE_PDF = "application/pdf";

    public PdfMedia(String filename, byte[] content, TemplateId templateId) {
        super(filename,
             MEDIA_TYPE_PDF,
             IntegerityCheckType.SHA_1.check(content),
             IntegerityCheckType.SHA_1,
             null,
             null,
             templateId);
        ArgumentUtils.checkNotNull(filename, "PdfMedia filename");
        ArgumentUtils.checkNotNull(content, "PdfMedia content");
        ArgumentUtils.checkNotNull(templateId, "PdfMedia templateId");
    }
}

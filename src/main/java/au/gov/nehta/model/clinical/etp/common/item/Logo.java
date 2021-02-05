package au.gov.nehta.model.clinical.etp.common.item;

import java.io.File;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

public class Logo extends AttachedMedia {

    public final Set<String> ALLOWED_MIME_TYPES =
            new HashSet<>(Arrays.asList("image/jpeg", "image/png", "image/gif"));

    public Logo(File file) {
        super(file);

        if (!ALLOWED_MIME_TYPES.contains(getMediaType()))
            throw new IllegalArgumentException("Invalid logo media type. Only png, gif, jpg allowed");
    }

    public Logo(File logo, IntegerityCheckType checkType) {
        super(logo, checkType);
        if (!ALLOWED_MIME_TYPES.contains(getMediaType()))
            throw new IllegalArgumentException("Invalid logo media type. Only png, gif, jpg allowed");
    }
}

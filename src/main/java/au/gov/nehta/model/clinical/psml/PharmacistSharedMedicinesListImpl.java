package au.gov.nehta.model.clinical.psml;

public class PharmacistSharedMedicinesListImpl implements PharmacistSharedMedicinesList {

    PharmacistSharedMedicinesListContext context;
    PharmacistSharedMedicinesListContent content;

    @Override
    public PharmacistSharedMedicinesListContext getContext() {
        return context;
    }

    @Override
    public PharmacistSharedMedicinesListContent getContent() {
        return content;
    }

    @Override
    public void setContext(PharmacistSharedMedicinesListContext context) {
        this.context = context;
    }

    @Override
    public void setContent(PharmacistSharedMedicinesListContent content) {
        this.content = content;
    }
}

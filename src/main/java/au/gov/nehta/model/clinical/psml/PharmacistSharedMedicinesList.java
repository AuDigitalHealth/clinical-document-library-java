package au.gov.nehta.model.clinical.psml;

public interface PharmacistSharedMedicinesList {

    PharmacistSharedMedicinesListContext getContext();

    PharmacistSharedMedicinesListContent getContent();

    void setContext(PharmacistSharedMedicinesListContext pharmacistSharedMedicinesListContext);

    void setContent(PharmacistSharedMedicinesListContent pharmacistSharedMedicinesListContent);
}

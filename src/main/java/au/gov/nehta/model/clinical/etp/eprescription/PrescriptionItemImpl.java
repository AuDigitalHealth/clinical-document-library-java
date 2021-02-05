/*
 * Copyright 2011 NEHTA
 *
 * Licensed under the NEHTA Open Source (Apache) License; you may not use this
 * file except in compliance with the License. A copy of the License is in the
 * 'license.txt' file, which should be provided with this work.
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations
 * under the License.
 */

package au.gov.nehta.model.clinical.etp.eprescription;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.cda.common.code.Code;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.code.PBSPrescriptionTypeCode;
import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.cda.common.time.SetComponentTime;
import au.gov.nehta.model.cda.common.time.SimplifiedPeriodicIntervalTime;
import au.gov.nehta.model.cda.common.time.TimeQuantity;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.etp.common.item.*;

import java.time.ZonedDateTime;
import java.util.ArrayList;
import java.util.List;

public class PrescriptionItemImpl implements PrescriptionItem {

    private ZonedDateTime written;
    private ZonedDateTime expires;
    private PrescriptionItemIdentifier prescriptionItemIdentifier;

    private String formula;
    private Dosage dosage;
    private String instructionsForUse;
    private QuantityUnitDescription dispenseQuantity;
    private Boolean brandSubstituteAllowed;
    private Integer maximumNumberOfRepeats;
    private SimplifiedPeriodicIntervalTime minimumIntervalBetweenRepeats;

    private PBSPrescriptionTypeCode pbsType;
    private MedicalBenefitCategoryType medicalBenefitCategoryType;

    private String reasonForTherapeuticGood;
    private String additionalComments;
    private String timingDescription;
    private List<SetComponentTime> structuredTime = new ArrayList<>();
    private Boolean prn;
    private PreciseDate startCriterion;
    private PreciseDate stopCriterion;
    private Boolean longTerm;

    private Code methodCode;
    private Code routeCode;
    private Code approachSiteCode;

    private UniqueIdentifier ctgBenefitID;
    private UniqueIdentifier pbsAan;
    private UniqueIdentifier pbsRpbsManufacturerCode;
    private Coded pbsRpbsItemCode;

    private UniqueIdentifier pbsAuthorityPrescriptionNumber;
    private GroundsForConcurrentSupply groundsForConcurrentSupply;
    private UniqueIdentifier streamlinedAuthorityApprovalNumber;
    private UniqueIdentifier stateAuthorityNumber;

    private List<Ingredient> extempoIngredients = new ArrayList<>();
    private UniqueIdentifier dispensItemIdentifier;
    private UniqueIdentifier medInstructionId;
    private boolean isRequestItem; // is it used for a PrescriptionRequest 

    // Protected constructor.
    // Instantiation must be via the PrescriptionItemBuilder
    protected PrescriptionItemImpl() {
    }

    @Override
    public ZonedDateTime getDateTimePrescriptionWritten() {
        return written;
    }

    @Override
    public ZonedDateTime getDateTimePrescriptionExpires() {
        return expires;
    }

    @Override
    public PrescriptionItemIdentifier getPrescriptionItemIdentifier() {
        return prescriptionItemIdentifier;
    }

    @Override
    public Coded getPbsRpbsItemCode() {
        return pbsRpbsItemCode;
    }

    @Override
    public String getFormula() {
        return this.formula;
    }

    @Override
    public Dosage getDosage() {
        return this.dosage;
    }

    @Override
    public String getDirections() {
        return this.instructionsForUse;
    }

    @Override
    public QuantityUnitDescription getDispenseQuantity() {
        return dispenseQuantity;
    }

    @Override
    public Boolean getBrandSubstituteAllowed() {
        return brandSubstituteAllowed;
    }

    @Override
    public Integer getMaximumNumberOfRepeats() {
        return maximumNumberOfRepeats;
    }

    @Override
    public SimplifiedPeriodicIntervalTime getMinimumIntervalBetweenRepeats() {
        return this.minimumIntervalBetweenRepeats;
    }

    @Override
    public MedicalBenefitCategoryType getMedicalBenefitCategoryType() {
        return medicalBenefitCategoryType;
    }

    @Override
    public GroundsForConcurrentSupply getGroundsForConcurrentSupply() {
        return groundsForConcurrentSupply;
    }

    @Override
    public UniqueIdentifier getStateAuthorityNumber() {
        return this.stateAuthorityNumber;
    }

    @Override
    public String getReasonForTherapeuticGood() {
        return this.reasonForTherapeuticGood;
    }

    @Override
    public PreciseDate getStartCriterion() {
        return startCriterion;
    }

    @Override
    public PreciseDate getStopCriterion() {
        return stopCriterion;
    }

    @Override
    public String getAdditionalComments() {
        return this.additionalComments;
    }

    @Override
    public String getTimingDescription() {
        return timingDescription;
    }

    @Override
    public List<SetComponentTime> getStructuredTime() {
        return structuredTime;
    }

    @Override
    public Boolean isLongTerm() {
        return longTerm;
    }

    @Override
    public Code getMethodCode() {
        return methodCode;
    }

    @Override
    public Code getRouteCode() {
        return routeCode;
    }

    @Override
    public Code getApproachSiteCode() {
        return approachSiteCode;
    }

    @Override
    public Boolean getPRN() {
        return prn;
    }

    @Override
    public UniqueIdentifier getCloseTheGapBenifitId() {
        return ctgBenefitID;
    }

    @Override
    public UniqueIdentifier getPbsAuthorityApprovalNumber() {
        return pbsAan;
    }

    public UniqueIdentifier getPbsRpbsManufacturerCode() {
        return pbsRpbsManufacturerCode;
    }

    /**
     * @return the extempoIngredients
     */
    @Override
    public List<Ingredient> getExtemporaneousIngredients() {
        return extempoIngredients;
    }

    public void addExtemporaneousIngredient(Ingredient extemporaneousIngredient) {
        extempoIngredients.add(extemporaneousIngredient);
    }

    @Override
    public UniqueIdentifier getStreamlinedAuthorityApprovalNumber() {
        return streamlinedAuthorityApprovalNumber;
    }

    @Override
    public UniqueIdentifier getPbsAuthorityPrescriptionNumber() {
        return pbsAuthorityPrescriptionNumber;
    }

    @Override
    public PBSPrescriptionTypeCode getPbsType() {
        return pbsType;
    }

    @Override
    public UniqueIdentifier getDispensItemIdentifier() {
        return dispensItemIdentifier;
    }

    @Override
    public UniqueIdentifier getMedicationInstructionIdentifier() {
        return medInstructionId;
    }

    /*
     * Accessed via the builder to ensure
     * mandatory field combinations are present.
     *
     */
    public void setPrescriptionItemIdentifier(PrescriptionItemIdentifier id) {
        this.prescriptionItemIdentifier = id;
    }

    public void setBrandSubstituteAllowed(Boolean isSubstitute) {
        this.brandSubstituteAllowed = isSubstitute;
    }

    public void setMaximumNumberOfRepeats(Integer repeats) {
        this.maximumNumberOfRepeats = repeats;
    }

    public void setMedicalBenefitCategoryType(MedicalBenefitCategoryType type) {
        this.medicalBenefitCategoryType = type;
    }

    public void setGroundsForConcurrentSupply(GroundsForConcurrentSupply grounds) {
        this.groundsForConcurrentSupply = grounds;
    }

    public void setPBSRPBSItemCode(Coded itemAsATranslatedCode) {
        this.pbsRpbsItemCode = itemAsATranslatedCode;
    }

    public void setCloseTheGapBenefitId(UniqueIdentifier ctgBenefitID) {
        this.ctgBenefitID = ctgBenefitID;
    }

    /**
     * @param prn - An indicator that states the timing of the use or
     *            administration of the medicine, vaccine or other therapeutic
     *            good is dependent, within limits, on the conditions or
     *            symptoms of the subject of care.
     */
    public void setPRN(Boolean prn) {
        this.prn = prn;
    }

    public void setLongTerm(Boolean longTerm) {
        this.longTerm = longTerm;
    }

    public void setMethodCode(Code methodCode) {
        this.methodCode = methodCode;
    }

    public void setRouteCode(Code routeCode) {
        this.routeCode = routeCode;
    }

    public void setApproachSiteCode(Code approachSiteCode) {
        this.approachSiteCode = approachSiteCode;
    }

    public void setDateTimePrescriptionWritten(ZonedDateTime dateTimePrescriptionWritten) {
        this.written = dateTimePrescriptionWritten;
    }

    public void setDateTimePrescriptionExpires(ZonedDateTime expiry) {
        this.expires = expiry;
    }

    public void setFormula(String formula) {
        ArgumentUtils.checkNotNull(formula, "formula");
        this.formula = formula;
    }

    public void setDosage(Dosage dosage) {
        ArgumentUtils.checkNotNull(dosage, "dosage");
        this.dosage = dosage;
    }

    public void setDispenseQuantity(QuantityUnitDescription dispenseQuantity) {
        this.dispenseQuantity = dispenseQuantity;
    }

    public void setDirections(String instructionsForUse) {
        this.instructionsForUse = instructionsForUse;
    }

    public void setMinimumIntervalBetweenRepeats(TimeQuantity timeInterval) {
        this.minimumIntervalBetweenRepeats = new SimplifiedPeriodicIntervalTime(timeInterval);
    }

    public void setMinimumIntervalBetweenRepeats(SimplifiedPeriodicIntervalTime periodicTime) {
        this.minimumIntervalBetweenRepeats = periodicTime;
    }

    public void setStateAuthorityNumber(UniqueIdentifier stateAuthorityNumber) {
        this.stateAuthorityNumber = stateAuthorityNumber;
    }

    public void setReasonForTherapeuticGood(String reasonForTherapeuticGood) {
        this.reasonForTherapeuticGood = reasonForTherapeuticGood;
    }

    public void setAdditionalComments(String additionalComments) {
        this.additionalComments = additionalComments;
    }

    public void setTimingDescription(String timingDescription) {
        this.timingDescription = timingDescription;
    }

    public void setStartCriterion(PreciseDate startCriterion) {
        this.startCriterion = startCriterion;
    }

    public void setStopCriterion(PreciseDate stopCriterion) {
        this.stopCriterion = stopCriterion;
    }

    public void setStreamlinedAuthorityApprovalNumber(UniqueIdentifier streamlinedAuthorityApprovalNumber) {
        this.streamlinedAuthorityApprovalNumber = streamlinedAuthorityApprovalNumber;
    }

    public void setPbsAuthorityPrescriptionNumber(UniqueIdentifier pbsAuthorityPrescriptionNumber) {
        this.pbsAuthorityPrescriptionNumber = pbsAuthorityPrescriptionNumber;
    }

    public void setPbsAuthorityApprovalNumber(UniqueIdentifier pbsAan) {
        this.pbsAan = pbsAan;
    }

    public void setPbsRpbsManufacturerCode(UniqueIdentifier pbsRpbsManufacturerCode) {
        this.pbsRpbsManufacturerCode = pbsRpbsManufacturerCode;
    }

    public void setPbsType(PBSPrescriptionTypeCode type) {
        pbsType = type;
    }

    public void setMedicationInstructionIdentifier(UniqueIdentifier id) {
        this.medInstructionId = id;
    }

    public void setDispensItemIdentifier(UniqueIdentifier dispensItemIdentifier) {
        this.dispensItemIdentifier = dispensItemIdentifier;
    }

    public boolean isRequestItem() {
        return isRequestItem;
    }

    public void setRequestItem(boolean isRequestItem) {
        this.isRequestItem = isRequestItem;
    }
}

package au.gov.nehta.model.clinical.diagnostic.imaging;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifierImpl;
import java.util.List;

/**
 * ImagingExaminationResult
 * 
 * Findings and interpretation of an imaging examination, or series of
 * examinations.
 */
public class ImagingExaminationResultImpl implements ImagingExaminationResult {
    protected UniqueIdentifier id = UniqueIdentifierImpl.random();
    protected UniqueIdentifier nameId = UniqueIdentifierImpl.random();
    protected UniqueIdentifier examinationProcedureID = UniqueIdentifierImpl.random();
    protected UniqueIdentifier overallResultID = UniqueIdentifierImpl.random();
    private UniqueIdentifier relatedImageID  = UniqueIdentifierImpl.random();
    
    protected Coded overallResult;
    
    protected Coded imagingResultName;
    protected Coded modality;
    protected List<AnatomicalSite> sites;
    protected String examinationProcedure;
    protected PreciseDate imageDateTime;
	protected String relatedImage;
	private AnatomicalRegion anatomicalRegion;
    
    
    /**
	 * @param overallResult
	 * @param imagingResultName
	 * @param modality
	 * @param sites
	 * @param examinationProcedure
	 * @param imageDateTime
	 * @param relatedImage
	 */
	public ImagingExaminationResultImpl(
			Coded overallResult,
			Coded imagingResultName,
			Coded modality,
			List<AnatomicalSite> sites,
			AnatomicalRegion anatomicalRegion,
			String examinationProcedure,
			PreciseDate imageDateTime,
			String relatedImage) {
		
		ArgumentUtils.checkNotNull( overallResult, "overallResult" );
	    ArgumentUtils.checkNotNull( imagingResultName, "imagingResultName" );
        ArgumentUtils.checkNotNull( modality, "modality" );
//        ArgumentUtils.checkNotNull( anatomicalRegion, "anatomicalRegion" );
        ArgumentUtils.checkNotNull( imageDateTime, "imageDateTime" );
        ArgumentUtils.checkNotNullNorBlank( examinationProcedure, "examinationProcedure" );
	
		
		
		this.overallResult = overallResult;
		this.imagingResultName = imagingResultName;
		this.modality = modality;
		this.sites = sites;
		this.examinationProcedure = examinationProcedure;
		this.anatomicalRegion=anatomicalRegion;
		this.imageDateTime = imageDateTime;
		this.relatedImage = relatedImage;
	}


	
    
    
    /**
     * Construct an empty  ImagingExaminationResult.
     * You're responsible for correctly filling this one out. 
     * 
     * alternately use the static constructors eg: ImagingExaminationResultImpl.withSites(..)
     */
    public ImagingExaminationResultImpl(){
    	
    }
    
    
    /**
   	 * Construct an image examination result with only the mandatory fields
   	 * 
   	 * @param imagingResultName
   	 *            Identification of the imaging examination or procedure
   	 *            performed, typically including modality and anatomical
   	 *            location (including laterality).
   	 * @param modality
   	 *            The imaging method used to perform the examination.
   	 * @param overallResult
   	 *            The status of the examination result as a whole.
   	 * @param imageDateTime
   	 *            Date, and optionally time, when an observation is clinically
   	 *            significant to the condition of the subject of the
   	 *            observation.
   	 * 
   	 * @param examinationProcedure
   	 *            Additional details of imaging examination methodology
   	 *            followed.
   	 *            
	 * @param anatomicalRegion
	 *            Region of body (e.g. head, lower limb) that includes the
	 *            anatomical locations of interest (e.g. jaw, foot).
	 * 
	 *            The value of this element SHALL subsume all of the anatomical
	 *            locations identified in Anatomical Site (ANATOMICAL LOCATION)
	 *            (targetSiteCode and targetSiteCode/ original-
	 *            Text)   	 *            
   	 */
    public static ImagingExaminationResultImpl base(
            Coded imagingResultName,
            Coded modality,
            Coded overallResult,
            PreciseDate imageDateTime,
            String examinationProcedure,
            AnatomicalRegion anatomicalRegion
            ){
        ArgumentUtils.checkNotNull( imagingResultName, "imagingResultName" );
        ArgumentUtils.checkNotNull( modality, "modality" );
        ArgumentUtils.checkNotNull( overallResult, "overallResult" );
        ArgumentUtils.checkNotNull( imageDateTime, "imageDateTime" );
        ArgumentUtils.checkNotNullNorBlank( examinationProcedure, "examinationProcedure" );
        /*ArgumentUtils.checkNotNull( anatomicalRegion, "anatomicalRegion" );*/
        
        ImagingExaminationResultImpl result = new ImagingExaminationResultImpl();
        
        result.imagingResultName = imagingResultName;
        result.modality=modality;
        result.imageDateTime=imageDateTime;
        result.overallResult=overallResult;
        result.examinationProcedure=examinationProcedure;
        result.anatomicalRegion=anatomicalRegion;
        return result;
    }
    
    
    /**
	 * Construct an image examination result with optional sites.
	 * 
	 * @param imagingResultName
	 *            Identification of the imaging examination or procedure
	 *            performed, typically including modality and anatomical
	 *            location (including laterality).
	 * @param modality
	 *            The imaging method used to perform the examination.
	 * @param overallResult
	 *            The status of the examination result as a whole.
	 * @param sites
	 *            anatomical sites
	 * @param imageDateTime
	 *            Date, and optionally time, when an observation is clinically
	 *            significant to the condition of the subject of the
	 *            observation.
	 * 
	 * @param examinationProcedure
	 *            Additional details of imaging examination methodology
	 *            followed.
	 * @param anatomicalRegion
	 *            Region of body (e.g. head, lower limb) that includes the
	 *            anatomical locations of interest (e.g. jaw, foot).
	 * 
	 *            The value of this element SHALL subsume all of the anatomical
	 *            locations identified in Anatomical Site (ANATOMICAL LOCATION)
	 *            (targetSiteCode and targetSiteCode/ original-
	 *            Text)   	 *            
   	 */
    public static ImagingExaminationResultImpl withSites(
            Coded imagingResultName,
            Coded modality,
            Coded overallResult,
            PreciseDate imageDateTime,
            String examinationProcedure,
            AnatomicalRegion anatomicalRegion,
            List<AnatomicalSite> sites
            ){ 
    	
    	ImagingExaminationResultImpl result = base(imagingResultName,modality,overallResult,imageDateTime,examinationProcedure,anatomicalRegion );
        ArgumentUtils.checkNotNullNorEmpty( sites, "sites" );
        result.sites = sites;
        return result;
    }
    

    /**
	 * Construct an image examination result with optional sites.
	 * 
	 * @param imagingResultName
	 *            Identification of the imaging examination or procedure
	 *            performed, typically including modality and anatomical
	 *            location (including laterality).
	 * @param modality
	 *            The imaging method used to perform the examination.
	 * @param overallResult
	 *            The status of the examination result as a whole.
	 * @param relatedImage
	 *         A link to, or identifier of, information of interest
	 * @param imageDateTime
	 *            Date, and optionally time, when an observation is clinically
	 *            significant to the condition of the subject of the
	 *            observation.
	 * 
	 * @param examinationProcedure
	 *            Additional details of imaging examination methodology
	 *            followed.
	 * @param anatomicalRegion
	 *            Region of body (e.g. head, lower limb) that includes the
	 *            anatomical locations of interest (e.g. jaw, foot).
	 * 
	 *            The value of this element SHALL subsume all of the anatomical
	 *            locations identified in Anatomical Site (ANATOMICAL LOCATION)
	 *            (targetSiteCode and targetSiteCode/ original-
	 *            Text)   	            
   	 */            
    public static ImagingExaminationResultImpl withRelatedImage(
            Coded imagingResultName,
            Coded modality,
            Coded overallResult,
            PreciseDate imageDateTime,
            String examinationProcedure,
            AnatomicalRegion anatomicalRegion,
            String relatedImage
            ){ 
    	
    	ImagingExaminationResultImpl result = base(imagingResultName,modality,overallResult,imageDateTime,examinationProcedure,anatomicalRegion );
		ArgumentUtils.checkNotNullNorBlank(relatedImage, "relatedImage");
		result.relatedImage = relatedImage;
        return result;
    }
    
    
    /**
	 * Construct an image examination result with optional sites and a relatedImage.
	 * 
	 * @param imagingResultName
	 *            Identification of the imaging examination or procedure
	 *            performed, typically including modality and anatomical
	 *            location (including laterality).
	 * @param modality
	 *            The imaging method used to perform the examination.
	 * @param overallResult
	 *            The status of the examination result as a whole.
	 * @param sites
	 *            anatomical sites
	 * @param imageDateTime
	 *            Date, and optionally time, when an observation is clinically
	 *            significant to the condition of the subject of the
	 *            observation.
	 * @param relatedImage
	 *         A link to, or identifier of, information of interest
	 * 
	 * @param examinationProcedure
	 *            Additional details of imaging examination methodology
	 *            followed.
	  * @param anatomicalRegion
	 *            Region of body (e.g. head, lower limb) that includes the
	 *            anatomical locations of interest (e.g. jaw, foot).
	 * 
	 *            The value of this element SHALL subsume all of the anatomical
	 *            locations identified in Anatomical Site (ANATOMICAL LOCATION)
	 *            (targetSiteCode and targetSiteCode/ original-
	 *            Text)   	            
   	 */      
     public static ImagingExaminationResultImpl withSitesAndRelatedImage(
             Coded imagingResultName,
             Coded modality,
             Coded overallResult,
             PreciseDate imageDateTime,
             String examinationProcedure,
             AnatomicalRegion anatomicalRegion,
             List<AnatomicalSite> sites,
             String relatedImage
             ){ 
     	
     	ImagingExaminationResultImpl result = withSites(imagingResultName,modality,overallResult,imageDateTime,examinationProcedure,anatomicalRegion,sites );
        ArgumentUtils.checkNotNullNorEmpty( sites, "sites" );
        result.setAnatomicalSites(sites);
        
        ArgumentUtils.checkNotNullNorBlank( relatedImage, "relatedImage" );
        result.setRelatedImage(relatedImage);
        return result;
     }
    
    
    public void addAnatomicalSite(AnatomicalSite site){
        this.sites.add(site);
    }
    
    public void addAllAnatomicalSites(List<AnatomicalSite> sites){
        this.sites.addAll(sites);
    }
    
    public void setAnatomicalSites(List<AnatomicalSite> sites){
        this.sites = sites;
    }
    
    
    @Override
    public Coded getImagingResultName() {
        return imagingResultName;
    }
    
    @Override
    public Coded getModality() {
        return modality;
    }

    @Override
    public String getExaminationProcedure() {
        return examinationProcedure;
    }
    
       
    @Override
    public PreciseDate getImageDateTime() {
        return imageDateTime;
    }
    
    
    /**
     * A UniqueIdentifier for the test result, random guid if not explicitly defined
     */
    @Override
    public UniqueIdentifier getId() {
        return id;
    }
    
    public void setId(UniqueIdentifier id){
        this.id=id;
    }
    
    /**
     * A UniqueIdentifier for the test result name, random guid if not explicitly defined
     */
    @Override
    public UniqueIdentifier getImagingResultNameId() {
        return nameId;
    }
    
    public void setImagingResultNameId(UniqueIdentifier nameId){
        this.nameId=nameId;
    }
    
    /**
     * A UniqueIdentifier for the Examination Procedure, random guid if not explicitly defined
     */
    @Override
    public UniqueIdentifier getExaminationProcedureId() {
        return examinationProcedureID;
    }
    
    public void setExaminationProcedureId(UniqueIdentifier id) {
        this.examinationProcedureID=id;
    }
   

    @Override
    public List<AnatomicalSite> getSites() {
        return sites;
    }

	@Override
	public Coded getOverallResultStatusCode() {
		return overallResult;
	}

	@Override
	public UniqueIdentifier getOverallResultStatusId() {
		return overallResultID;
	}
	
	public void setOverallResultStatusId(UniqueIdentifier overallResultId) {
		this.overallResultID = overallResultId;
	}


	@Override
	public String getRelatedImage() {
		return relatedImage;
	}
	
	public void setRelatedImage(String image) {
		this.relatedImage=image;
	}


	@Override
	public UniqueIdentifier getRelatedImageId() {
		return relatedImageID;
	}
	
	public void setRelatedImageId(UniqueIdentifier id) {
		this.relatedImageID=id;
	}


	/*
	 * Region of body (e.g. head, lower limb) that includes the anatomical
	 * locations of interest (e.g. jaw, foot).
	 * 
	 *  Anatomical Region The value of this element SHALL
	 * subsume all of the anatomical locations identified in Anatomical Site
	 * (ANATOMICAL LOCATION) (targetSiteCode and targetSiteCode/ original-
	 * Text).(non-Javadoc)
	 * 
	 * @see au.gov.nehta.model.clinical.diagnostic.imaging.ImagingExaminationResult#getAnatomicalRegion()
	 */
	@Override
	public AnatomicalRegion getAnatomicalRegion() {
		return anatomicalRegion;
	}

    

}

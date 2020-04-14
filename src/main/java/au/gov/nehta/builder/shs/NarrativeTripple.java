package au.gov.nehta.builder.shs;

import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;
import au.gov.nehta.model.clinical.common.ProblemDiagnosis;
import au.gov.nehta.model.clinical.common.Procedure;
import au.gov.nehta.model.clinical.shs.UncatagorisedMedicalHistoryItem;
import org.joda.time.DateTime;

import static au.gov.nehta.builder.DocumentCreatorUtil.*;

public class NarrativeTripple{
	//"Item", "Date" ,"Comment"
	public final String item;
	public final String date;
	public final String comment;
	public final DateTime sortDate;
	
	
	/**
	 * @param item
	 * @param date
	 * @param comment
	 * @param sortDate
	 */
	public NarrativeTripple(String item,  String comment, String date, DateTime sortDate) {
		
		this.item = safe(item);
		this.date =  safe(date);
		this.comment =  safe(comment);
		
		//if there is no date, add the max (enough) value so no date
		//objects bubble to the top.
		if(sortDate == null){
			this.sortDate = new DateTime(Long.MAX_VALUE);
		}else{
			this.sortDate = sortDate;
		}
	}

	public NarrativeTripple(Procedure p){
		this( print(p.getName()),
				 safe(p.getComment()),
				print(p.getDateTimeStarted()),
				time( p.getDateTimeStarted()) );
	}
	
	public NarrativeTripple(ProblemDiagnosis p){
		
		this(   print(p.getIdentification()),
				safe(p.getComment()) ,
				display(p.getDateOfOnset(),p.getDateOfRemission()),
				time( p.getDateOfOnset(),p.getDateOfRemission() )
				);
	}

	
	public NarrativeTripple(UncatagorisedMedicalHistoryItem ohi){
    	
		this( ohi.getDescription(),
				 safe(ohi.getComment()) ,
				 narrativeVersion(ohi.getTimeInterval()),
				 compareTime(ohi.getTimeInterval())
				);
	}
	

	


	//find the correct datetime for medical history narrative comparison for
	//the other medical history item time interval
	private static DateTime compareTime(RestrictedTimeInterval timeInterval) {
		if(timeInterval == null) return null;
		
		if(timeInterval.getHigh() != null) return  time(timeInterval.getHigh());
		
		if(timeInterval.getLow() != null) return  time(timeInterval.getLow());
		
		if(timeInterval.getCenter() != null) return  time(timeInterval.getCenter());
				
		return null;
	}
	
}
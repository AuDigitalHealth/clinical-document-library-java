package au.gov.nehta.builder.util.narrative;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.JAXBElement;

import au.gov.nehta.builder.DocumentCreatorUtil;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.cda.common.telecom.Telecom;
import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;
import au.gov.nehta.model.clinical.common.participation.AddressPurpose;
import au.gov.nehta.model.clinical.common.participation.AustralianAddress;
import au.gov.nehta.model.clinical.common.participation.Organisation;
import au.gov.nehta.model.clinical.common.participation.PersonName;
import au.gov.nehta.model.clinical.common.types.HPII;
import au.gov.nehta.model.clinical.common.types.HPIO;
import au.gov.nehta.model.clinical.etp.common.participation.Entitlement;
import au.gov.nehta.model.clinical.etp.common.participation.ProviderAddress;
import au.gov.nehta.model.clinical.etp.common.participation.ProviderIndividualDemographicData;
import au.net.electronichealth.ns.cda._2_0.ObjectFactory;
import au.net.electronichealth.ns.cda._2_0.StrucDocTd;
import au.net.electronichealth.ns.cda._2_0.StrucDocTh;
import au.net.electronichealth.ns.cda._2_0.StrucDocTr;

public class NarrativeUtil {
	private final static String NARRATIVE_DATE_TIME_FORMAT = "d MMM yyyy HH:mm:ssZ";
	private final static String NARRATIVE_DATE_FORMAT = "d MMM yyyy";
	public final static DateTimeFormatter NARRATIVE_DATE_TIME_FORMATTER = DateTimeFormat.forPattern( NARRATIVE_DATE_TIME_FORMAT );
	public final static DateTimeFormatter NARRATIVE_DATE_FORMATTER = DateTimeFormat.forPattern( NARRATIVE_DATE_FORMAT );
	private final static ObjectFactory objectFactory = new ObjectFactory();

	public static StrucDocTr getTableHeaderRow( List<String> cellValues ) {
		StrucDocTr tableRow = new StrucDocTr();

		for (String cellValue : cellValues) {
			StrucDocTh cell = new StrucDocTh();
			cell.getContent().add( cellValue );
			tableRow.getThOrTd().add( cell );
		}

		return tableRow;
	}
	
	public static StrucDocTr getTableHeaderRow(String... cellValues ) {
		StrucDocTr tableRow = new StrucDocTr();

		for (String cellValue : cellValues) {
			StrucDocTh cell = new StrucDocTh();
			cell.getContent().add( cellValue );
			tableRow.getThOrTd().add( cell );
		}

		return tableRow;
	}
	

    public static String render( PersonName name ) {
        StringBuilder nameBuilder = new StringBuilder();
        if(name.getNameTitle() != null){
            for (String title : name.getNameTitle()) {
                nameBuilder.append( title ).append( " " );
            }
        }

        if(name.getGivenName() != null){
            for (String fname : name.getGivenName()) {
                char[] f_name=fname.toLowerCase().toCharArray();
                f_name[0]=Character.toTitleCase( f_name[0] );
                nameBuilder.append( f_name ).append( " " );
            }
        }
        
        if (name.getFamilyName() != null) {
            nameBuilder.append( name.getFamilyName().toUpperCase() ).append( " " );
        }

        if(name.getNameSuffix() != null){
            for (String suffix : name.getNameSuffix()) {
                nameBuilder.append( suffix  ).append( " " );
            }
        }
        String names = nameBuilder.toString();
        return names;
    }

	public static StrucDocTr createTableBodyRowWithCellValues( List<String> cellValues ) {
		StrucDocTr tableRow = new StrucDocTr();

		for (String cellValue : cellValues) {
			StrucDocTd cell = cell(cellValue);
			tableRow.getThOrTd().add( cell );
		}

		return tableRow;
	}

	public static StrucDocTd cell(Serializable cellValue) {
		StrucDocTd cell = new StrucDocTd();
		cell.getContent().add( cellValue );
		return cell;
	}

	public static StrucDocTr createTableBodyRowWithCells( List<StrucDocTd> cells ) {
		StrucDocTr tableRow = new StrucDocTr();

		for (StrucDocTd cell : cells) {
			tableRow.getThOrTd().add( cell );
		}

		return tableRow;
	}
	
	public static StrucDocTr createTableBodyRowWithCells( StrucDocTd... cells ) {
		StrucDocTr tableRow = new StrucDocTr();

		for (StrucDocTd cell : cells) {
			tableRow.getThOrTd().add( cell );
		}

		return tableRow;
	}

	public static StrucDocTr createTableBodyRowWithCellValuesAndColours( List<String> cellValues ) {
		StrucDocTr tableRow = new StrucDocTr();

		for (String cellValue : cellValues) {
			StrucDocTd cell = cell(cellValue);
			tableRow.getThOrTd().add( cell );
		}

		return tableRow;
	}

	public static StrucDocTr createTableBodyRowWithCellsAndColours( List<StrucDocTd> cells ) {
		StrucDocTr tableRow = new StrucDocTr();

		for (StrucDocTd cell : cells) {
			tableRow.getThOrTd().add( cell );
		}

		return tableRow;
	}

	public static String booleanToYesNo( Boolean value ) {
		ArgumentUtils.checkNotNull( value, "value" );
		if (value.booleanValue()) {
			return "Yes";
		} else {
			return "No";
		}
	}

	public static List<StrucDocTd> getProviderIndividualCells( String fieldName, HPII providerIndividualEntityIdentifier, PersonName providerIndividualName,
			ProviderIndividualDemographicData providerIndividualDemographicData, String qualifications ) {

		List<StrucDocTd> result = new ArrayList<StrucDocTd>();

		result.add( getTableBodyCell( fieldName ) );

		StrucDocTd fieldValueCell = new StrucDocTd();
		fieldValueCell.getContent().add( "HPI-I: " + providerIndividualEntityIdentifier.getNarrativeForm() );
		br( fieldValueCell );

		StringBuilder name = new StringBuilder();
		if (providerIndividualName.getNameTitle() != null) {
			for (String title : providerIndividualName.getNameTitle()) {
				name.append( title );
			}
		}

		if (providerIndividualName.getGivenName() != null) {
			for (String givenName : providerIndividualName.getGivenName()) {
				name.append( givenName );
			}
		}
		name.append( providerIndividualName.getFamilyName() );
		if (providerIndividualName.getNameSuffix() != null) {
			for (String suffix : providerIndividualName.getNameSuffix()) {
				name.append( suffix );
			}
		}
		fieldValueCell.getContent().add( "NAME: " + name.toString() );
		br( fieldValueCell );

		if(providerIndividualDemographicData != null){
    		String sex = providerIndividualDemographicData.getSex().getDisplayName();
    		fieldValueCell.getContent().add( "SEX: " + sex );
    		br( fieldValueCell );
    		
    		
    		String dateOfBirth = NARRATIVE_DATE_TIME_FORMATTER.print( providerIndividualDemographicData.getDateOfBirthDetail().getDateOfBirth() );
    		fieldValueCell.getContent().add( "DATE OF BIRTH: " + dateOfBirth );
    		br( fieldValueCell );
    
    		if (qualifications != null) {
    			fieldValueCell.getContent().add( "QUALIFICATIONS: " + qualifications );
    		}
    		
		}
		result.add( fieldValueCell );
		return result;
	}

	public static StrucDocTd getTableBodyCell( String value ) {
		StrucDocTd result = cell(value);

		return result;
	}

	public static List<StrucDocTd> getProviderAddressCells( String fieldName, ProviderAddress providerAddress ) {
		List<StrucDocTd> result = new ArrayList<StrucDocTd>();
		result.add( getTableBodyCell( fieldName ) );
		result.add( getProviderAddressCell( providerAddress ) );

		return result;
	}

	public static List<StrucDocTd> getElectronicCommunicationCells( String fieldName, List<Telecom> electronicCommunicationDetail ) {
		List<StrucDocTd> result = new ArrayList<StrucDocTd>();
		result.add( getTableBodyCell( fieldName ) );
		result.add( getElectronicCommunicationDetailCell( electronicCommunicationDetail ) );

		return result;
	}

	public static StrucDocTd getProviderAddressCell( ProviderAddress providerAddress ) {
		StrucDocTd result = new StrucDocTd();

		if (providerAddress.getNoFixedAddressIndicator()) {
			result.getContent().add( "No fixed address." );
		} else {
			if (providerAddress.getAddress() != null) {
				AustralianAddress providerAustralianAddress = providerAddress.getAddress();

				if (providerAustralianAddress.getUnstructuredAddressLines() != null) {
					for (String unstructuredAddressLine : providerAustralianAddress.getUnstructuredAddressLines()) {
						result.getContent().add( unstructuredAddressLine );
						br( result );
					}
				}


				if (providerAustralianAddress.getCity() != null) {
					String australianSuburbTownLocality = providerAustralianAddress.getCity();
					
					result.getContent().add( australianSuburbTownLocality );
					
					br( result );
				}

				if (providerAustralianAddress.getPostcode() != null) {
				    String australianPostcode = providerAustralianAddress.getPostcode();
					result.getContent().add( australianPostcode );
					br( result );
				}

				if (providerAustralianAddress.getDeliveryPointIdentifier() != null) {
					String australianDeliveryPointIdentifier = providerAustralianAddress.getDeliveryPointIdentifier();
					result.getContent().add( "DELIVERY POINT IDENTIFIER: " + australianDeliveryPointIdentifier );
					br( result );
				}

				if (providerAddress.getAddressPurpose() != null) {
					AddressPurpose postalAddressUse = providerAddress.getAddressPurpose();
					result.getContent().add( "ADDRESS TYPE: " + postalAddressUse.getDisplayName() );
					br( result );
				}
			}
		}

		return result;
	}

    public static void br( StrucDocTd result ) {
        result.getContent().add( createTdBr() );
    }

    private static JAXBElement<String> createTdBr() {
        return objectFactory.createStrucDocTdBr( "" );
    }

	public static StrucDocTd getElectronicCommunicationDetailCell( List<Telecom> electronicCommunicationDetail ) {
		StrucDocTd result = new StrucDocTd();

		for (Telecom electronicCommunicationDetailItem : electronicCommunicationDetail) {
			String usage = "";
			if (electronicCommunicationDetailItem.getTelecomUse() != null) {
				usage = " (" + electronicCommunicationDetailItem.getTelecomUse().getDisplayName() + ")";
			}

			result.getContent().add(
					electronicCommunicationDetailItem.getTelecomMedium().getDisplayName() + ":" + electronicCommunicationDetailItem.getTelecomValue() + usage );
			br( result );
		}

		return result;
	}

	public static List<StrucDocTd> getEntitlementCells( String fieldName, List<Entitlement> entitlement ) {
		List<StrucDocTd> result = new ArrayList<StrucDocTd>();
		result.add( getTableBodyCell( fieldName ) );
		result.add( getEntitlementCell( entitlement ) );

		return result;
	}

	public static List<StrucDocTd> getSubjectOfCareEntitlementCells( String fieldName, List<Entitlement> entitlement ) {
		List<StrucDocTd> result = new ArrayList<StrucDocTd>();
		result.add( getTableBodyCell( fieldName ) );
		result.add( getSubjectOfCareEntitlementCell( entitlement ) );

		return result;
	}

	public static StrucDocTd getEntitlementCell( List<Entitlement> entitlement ) {
		StrucDocTd result = new StrucDocTd();

		for (Entitlement entitlementItem : entitlement) {
			StringBuilder entitlementStringBuilder = new StringBuilder();

			entitlementStringBuilder.append( entitlementItem.getEntitlementNumber().getExtension() );
			entitlementStringBuilder.append( " (Type: " + entitlementItem.getEntitlementType().getDisplayName() + ")" );

			if (entitlementItem.getEntitlementValidityDuration() != null) {
				RestrictedTimeInterval validityDuration = entitlementItem.getEntitlementValidityDuration();
				entitlementStringBuilder.append( validityDuration.getNarrative() );
			}

			result.getContent().add( entitlementStringBuilder.toString() );
			br( result );
		}

		return result;
	}

	public static StrucDocTd getSubjectOfCareEntitlementCell( List<Entitlement> entitlement ) {
		StrucDocTd result = new StrucDocTd();

		for (Entitlement entitlementItem : entitlement) {
			StringBuilder entitlementStringBuilder = new StringBuilder();

			entitlementStringBuilder.append( entitlementItem.getEntitlementNumber().getExtension() );
			entitlementStringBuilder.append( " (Type: " + entitlementItem.getEntitlementType().getDisplayName() + ")" );

			if (entitlementItem.getEntitlementValidityDuration() != null) {

//				TimeInterval validityDuration = entitlementItem.getEntitlementValidityDuration();
//				entitlementStringBuilder.append( " (Validity: " + validityDuration.getStart() + " till " + validityDuration.getEnd() + " - " + validityDuration.getDuration() + ")" );

				String entitlementNarrative = DocumentCreatorUtil.narrativeVersion(entitlementItem.getEntitlementValidityDuration());
				entitlementStringBuilder.append(" (Duration: " + entitlementNarrative + ")");

//				RestrictedTimeInterval validityDuration = entitlementItem.getEntitlementValidityDuration();
//				if(validityDuration.getNarrative() != null){
//				    entitlementStringBuilder.append( validityDuration.getNarrative() );
//				}
			}

			result.getContent().add( entitlementStringBuilder.toString() );
			//br( result );
		}

		return result;
	}

	public static List<StrucDocTd> getProviderOrganisationCells( String fieldName, HPIO providerOrganisationEntityIdentifier, Organisation organisation ) {
		List<StrucDocTd> result = new ArrayList<StrucDocTd>();

		result.add( getTableBodyCell( fieldName ) );

		StrucDocTd fieldValueCell = new StrucDocTd();
		fieldValueCell.getContent().add( "HPI-O: " + providerOrganisationEntityIdentifier.getNarrativeForm() );
		br( fieldValueCell );

		fieldValueCell.getContent().add( "ORGANISATION NAME: " + organisation.getOrganisationName() );
		br( fieldValueCell );

		if (organisation.getDepartmentUnit() != null) {
			fieldValueCell.getContent().add( "DEPARTMENT/UNIT: " + organisation.getDepartmentUnit() );
			br( fieldValueCell );
		}

		result.add( fieldValueCell );

		return result;
	}
	
	 public static String nullToEmpty(String text) {
	        return text == null ? "" : text;
	 }
}

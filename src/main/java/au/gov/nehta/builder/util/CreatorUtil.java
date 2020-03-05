package au.gov.nehta.builder.util;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.JAXBException;
import javax.xml.namespace.QName;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;

import au.gov.nehta.common.utils.JaxbUtils;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040ClinicalDocument;

public class CreatorUtil {
	public static Document convertClinicalDocumentToDomDocument( POCDMT000040ClinicalDocument clinicalDocument ) throws JAXBException, ParserConfigurationException {
		QName qName = new QName( "urn:hl7-org:v3", "ClinicalDocument" );
		JAXBElement<POCDMT000040ClinicalDocument> clinicalDocumentJAXBElement = new JAXBElement<POCDMT000040ClinicalDocument>( qName, POCDMT000040ClinicalDocument.class, clinicalDocument );
		Document clinicalDocumentDomDocument = JaxbUtils.marshalToDom( clinicalDocumentJAXBElement );

		return clinicalDocumentDomDocument;
	}
}

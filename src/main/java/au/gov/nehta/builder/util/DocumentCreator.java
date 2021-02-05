package au.gov.nehta.builder.util;

import au.gov.nehta.model.schematron.SchematronValidationException;

import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;

public interface DocumentCreator {

    /**
     * <b>Supported CDA types:</b>
     * <ul>
     *   <li>Specialist Letter</li>
     *   <li>Service Referral</li>
     * </ul>
     *
     * @return CDA document in 1A format.
     */
    default Document create1AFormatCDADocument()
            throws JAXBException, ParserConfigurationException, SchematronValidationException {
        throw new RuntimeException("Method must be overridden specific to CDA type for 1A format");
    }

    /**
     * <b>Supported CDA types:</b>
     * <ul>
     *   <li>Specialist Letter</li>
     * </ul>
     *
     * @return CDA document in 1B format.
     */
    default Document create1BFormatCDADocument()
            throws JAXBException, ParserConfigurationException, SchematronValidationException {
        throw new RuntimeException("Method must be overridden specific to CDA type for 1B format");
    }

    /**
     * <b>Supported CDA types:</b>
     * <ul>
     *   <li>Specialist Letter</li>
     * </ul>
     *
     * @return CDA document in 2 format.
     */
    default Document createFormat2CDADocument()
            throws JAXBException, ParserConfigurationException, SchematronValidationException {
        throw new RuntimeException("Method must be overridden specific to CDA type for format 2");
    }
}

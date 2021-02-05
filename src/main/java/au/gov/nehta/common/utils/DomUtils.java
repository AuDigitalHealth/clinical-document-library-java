/*
 * Copyright 2009 - 2021 NEHTA
 *
 * Licensed under the NEHTA Open Source (Apache) License; you may not use this file except in compliance with the
 * License. A copy of the License is in the 'license.txt' file, which should be provided with this work.
 *
 * Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on
 * an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations under the License.
 */
package au.gov.nehta.common.utils;

import org.w3c.dom.*;
import org.xml.sax.ErrorHandler;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Utility class to manipulate DOM objects.
 */
public final class DomUtils {

    /*
     * Factory instances.
     */
    private static DocumentBuilderFactory DOCBUILDER_FACTORY;

    private static DocumentBuilder getDocumentBuilder()
            throws ParserConfigurationException {
        if (DOCBUILDER_FACTORY == null) {
            DOCBUILDER_FACTORY = DocumentBuilderFactory.newInstance();
            DOCBUILDER_FACTORY.setNamespaceAware(true);
        }
        return DOCBUILDER_FACTORY.newDocumentBuilder();
    }

    /**
     * Creates a new empty XML document.
     *
     * @return Empty XML document.
     * @throws ParserConfigurationException Exception if any parser problem.
     */
    public static Document newDocument() throws ParserConfigurationException {
        return getDocumentBuilder().newDocument();
    }

    /**
     * Creates a new XML document using the node as the root.
     *
     * @param rootNode Root node. Cannot be null.
     * @return Created XML document.
     * @throws ParserConfigurationException Exception if any parser problem.
     */
    public static Document newDocument(Node rootNode)
            throws ParserConfigurationException {
        assert (rootNode != null) : "'rootNode' is null.";

        Document doc = newDocument();
        Node nodeCopy = doc.importNode(rootNode, true);
        doc.appendChild(nodeCopy);
        return doc;
    }

    /**
     * Loads an XML document from file.
     *
     * @param file File path to the XML file. Cannot be null.
     * @return Loaded XML document.
     * @throws ParserConfigurationException Exception if any parser problem.
     * @throws IOException Exception if problems reading file.
     * @throws SAXException Exception if problems with SAX.
     */
    public static Document parse(File file) throws ParserConfigurationException,
            IOException, SAXException {
        assert (file != null) : "'file' is null.";

        return getDocumentBuilder().parse(file);
    }

    /**
     * Loads an XML document from a reader.
     *
     * @param reader Input character stream containing the XML content. Cannot be null.
     * @return Loaded XML document.
     * @throws ParserConfigurationException Exception if any parser problem.
     * @throws IOException Exception if problems reading file.
     * @throws SAXException Exception if problems with SAX.
     */
    public static Document parse(Reader reader)
            throws ParserConfigurationException, IOException, SAXException {
        assert (reader != null) : "'reader' is null.";

        return getDocumentBuilder().parse(new InputSource(reader));
    }

    /**
     * Loads an XML document from a reader.
     *
     * @param reader       Input character stream containing the XML content. Cannot be null.
     * @param errorHandler Callback handler for errors from parser. Optional.
     * @return Loaded XML document.
     * @throws ParserConfigurationException Exception if any parser problem.
     * @throws IOException Exception if problems reading file.
     * @throws SAXException Exception if problems with SAX.
     */
    public static Document parse(Reader reader, ErrorHandler errorHandler)
            throws ParserConfigurationException, SAXException, IOException {
        assert (reader != null) : "'reader' is null.";

        // Create parser
        DocumentBuilder parser = getDocumentBuilder();

        // Set error handler
        if (errorHandler != null) {
            parser.setErrorHandler(errorHandler);
        }

        // Call parse method
        return parser.parse(new InputSource(reader));
    }

    /**
     * Returns a serialised XML representation of the XML {@code Document}.
     *
     * @param xmlElem An XML {@code Element}. Cannot be null.
     * @return A serialised XML representation of the XML {@code Document}.
     * @throws TransformerException Exception if any transformation problems.
     * @throws IOException Exception if problems writing.
     */
    public static String serialiseToString(Element xmlElem)
            throws TransformerException, IOException {
        assert (xmlElem != null) : "'xmlElem' is null.";

        StringWriter writer = new StringWriter();
        serialiseNode(xmlElem, writer);
        return writer.toString();
    }

    /**
     * Returns a serialised XML representation of the XML {@code Document}.
     *
     * @param xmlDoc An XML {@code Document}. Cannot be null.
     * @return A serialised XML representation of the XML {@code Document}.
     * @throws TransformerException Exception if any transformation problems.
     * @throws IOException Exception if problems writing.
     */
    public static String serialiseToString(Document xmlDoc)
            throws TransformerException, IOException {
        assert (xmlDoc != null) : "'xmlDoc' is null.";

        StringWriter writer = new StringWriter();
        serialiseNode(xmlDoc, writer);
        return writer.toString();
    }

    /**
     * Serialises an XML {@code Document} to a file.
     *
     * @param xmlDoc An XML {@code Document}. Cannot be null.
     * @param file   The file to serialise the the XML Document to. Cannot be null.
     * @throws TransformerException Exception if any transformation problems.
     * @throws IOException Exception if problems writing.
     */
    public static void serialise(Document xmlDoc, File file)
            throws TransformerException, IOException {
        assert (xmlDoc != null) : "'xmlDoc' is null.";
        assert (file != null) : "'file' is null.";

        serialiseNode(xmlDoc, new FileWriter(file));
    }

    /**
     * Serialises an XML {@code Document} to a character stream.
     *
     * @param xmlDoc An XML {@code Document}. Cannot be null.
     * @param writer A character stream to which the XML Document is serialised. Cannot
     *               be null.
     * @throws TransformerException Exception if any transformation problems.
     * @throws IOException Exception if any problems writing.
     */
    public static void serialise(Document xmlDoc, Writer writer)
            throws TransformerException, IOException {
        assert (xmlDoc != null) : "'xmlDoc' is null.";
        assert (writer != null) : "'writer' is null.";

        serialiseNode(xmlDoc, writer);
    }

    /*
     * Serialises a DOM node to a character stream.
     */
    private static void serialiseNode(Node xmlNode, Writer writer)
            throws TransformerException, IOException {
        assert (xmlNode != null);
        assert (writer != null);

        TransformerFactory factory = TransformerFactory.newInstance();
        Transformer transformer = factory.newTransformer();
        transformer.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "yes");

        try {
            DOMSource source = new DOMSource(xmlNode);
            StreamResult result = new StreamResult(writer);
            transformer.transform(source, result);
            writer.flush();
        } finally {
            writer.close();
        }
    }

    /**
     * Returns the first element from a nodes child nodes.
     *
     * @param node Node that has child nodes. Cannot be null.
     * @return Returns the first element found else returns null.
     */
    public static Element getFirstChildElement(Node node) {
        assert (node != null) : "'node' is null.";

        NodeList childNodes = node.getChildNodes();

        if (childNodes.getLength() > 0) {
            // Iterate through each child node looking for an element
            for (int i = 0; i < childNodes.getLength(); i++) {
                Node currentNode = childNodes.item(i);
                if (currentNode instanceof Element) {
                    return (Element) currentNode;
                }
            }
        }

        return null;
    }

    /**
     * Extract all child DOM {@code Element}s from the DOM {@code Node}.
     *
     * @param node The DOM {@code Node}. Cannot be null.
     * @return A list of child {@code Element}s of the {@code Node}.
     */
    public static List<Element> getChildElements(Node node) {
        assert (node != null) : "'node' is null.";

        List<Element> childElems = new ArrayList<Element>();
        NodeList childNodes = node.getChildNodes();
        for (int i = 0; i < childNodes.getLength(); i++) {
            Node childNode = childNodes.item(i);
            if (childNode instanceof Element) {
                childElems.add((Element) childNode);
            }
        }
        return childElems;
    }

    /**
     * Get the child {@code Element} of the {@code Element} with the namespace and
     * tagName.
     *
     * @param element   The source {@code Element}. Cannot be null.
     * @param namespace The namespace of the child {@code Element}. Cannot be null nor
     *                  blank.
     * @param tagName   The tagName of the child {@code Element}. Cannot be null nor
     *                  blank.
     * @return The child {@code Element} with the given namespace and tagName.
     * @throws IllegalArgumentException If the element does not have exactly one child element with the
     *                                  required namespace and tagName.
     */
    public static Element getChildElement(Element element, String namespace,
                                          String tagName) {
        assert (element != null) : "'element' is null.";
        assert (namespace != null) : "'namespace' is null.";
        assert (namespace.trim().length() > 0) : "'namespace' is a blank string.";
        assert (tagName != null) : "'tagName' is null.";
        assert (tagName.trim().length() > 0) : "'tagName' is a blank string.";

        List<Element> childElems = getChildElements(element, namespace, tagName);
        if (childElems.size() == 0) {
            throw new IllegalArgumentException("No '{" + namespace + "}" + tagName
                    + "' element found.");
        } else if (childElems.size() > 1) {
            throw new IllegalArgumentException("More than one '{" + namespace + "}"
                    + tagName + "' elements found.");
        }
        return childElems.get(0);
    }

    /**
     * Get the child {@code Element}s of the {@code Element} with the namespace
     * and tagName.
     *
     * @param element   The source {@code Element}. Cannot be null.
     * @param namespace The namespace of the child {@code Element}s. Cannot be null nor
     *                  blank.
     * @param tagName   The tagName of the child {@code Element}s. Cannot be null nor
     *                  blank.
     * @return A list of child {@code Element}s with the given namespace and
     * tagName.
     * @throws IllegalArgumentException If the element does not have at least one child element with the
     *                                  required namespace and tagName.
     */
    public static List<Element> getChildElements(Element element,
                                                 String namespace, String tagName) {
        assert (element != null) : "'element' is null.";
        assert (namespace != null) : "'namespace' is null.";
        assert (namespace.trim().length() > 0) : "'namespace' is a blank string.";
        assert (tagName != null) : "'tagName' is null.";
        assert (tagName.trim().length() > 0) : "'tagName' is a blank string.";

        List<Element> childElems = new ArrayList<Element>();
        NodeList childNodes = element.getChildNodes();
        for (int i = 0; i < childNodes.getLength(); i++) {
            Node childNode = childNodes.item(i);
            if (childNode instanceof Element) {
                Element childElem = (Element) childNode;

                String currNamespace = childElem.getNamespaceURI();
                String currLocalName = childElem.getLocalName();

                if (namespace.equals(currNamespace) && tagName.equals(currLocalName)) {
                    childElems.add(childElem);
                }
            }
        }
        return childElems;
    }

    /**
     * Adds an attribute to the element.
     *
     * @param elem      Element to add the attribute to. Cannot be null.
     * @param attrName  Name of the attribute. Cannot be null nor blank.
     * @param attrValue Value of the attribute. Cannot be null nor blank.
     */
    public static void addAttribute(Element elem, String attrName,
                                    String attrValue) {
        assert (elem != null) : "'elem' is null.";
        assert (attrName != null) : "'attrName' is null.";
        assert (attrName.trim().length() > 0) : "'attrName' is a blank string.";
        assert (attrValue != null) : "'attrValue' is null.";
        assert (attrValue.trim().length() > 0) : "'attrValue' is a blank string.";

        Document ownerDoc = elem.getOwnerDocument();

        // Create the attribute and add it to the element
        Attr attr = ownerDoc.createAttributeNS(null, attrName);
        attr.setValue(attrValue);
        elem.setAttributeNodeNS(attr);
    }

    /**
     * Returns 'true' if the XML document contains no nodes, otherwise 'false'.
     *
     * @param xmlDoc XML document. Cannot be null.
     * @return 'true' if empty otherwise 'false'.
     */
    public static boolean isDocumentEmpty(Document xmlDoc) {
        assert (xmlDoc != null) : "'xmlDoc' is null.";

        if (xmlDoc.getDocumentElement() == null) {
            return true;
        }

        return false;
    }

    /**
     * Throws an exception if the document is null or contains no nodes.
     *
     * @param xmlDoc XML document to check.
     * @param name   Name of the instance. Cannot be null.
     */
    public static void checkNotNullOrEmpty(Document xmlDoc, String name) {
        assert (name != null) : "'name' is null.";

        if (xmlDoc == null || isDocumentEmpty(xmlDoc)) {
            throw new IllegalArgumentException("'" + name
                    + "' cannot be null or empty");
        }
    }

    /**
     * Returns true if the element matches the name and namespace.
     *
     * @param elem      Element. Cannot be null.
     * @param name      Name of the element. Cannot be null nor blank.
     * @param namespace Namespace of the element. Cannot be null nor blank.
     * @return True if the element matches the name and namespace otherwise false.
     */
    public static boolean checkElement(Element elem, String name, String namespace) {
        assert (elem != null) : "'elem' is null.";
        assert (name != null) : "'name' is null.";
        assert (name.trim().length() > 0) : "'name' is a blank string.";
        assert (namespace != null) : "'namespace' is null.";
        assert (namespace.trim().length() > 0) : "'namespace' is a blank string.";

        return (elem.getLocalName().equals(name) && elem.getNamespaceURI().equals(
                namespace));
    }

    /**
     * Removes the formatting whitespaces, namely removes whitespace between child
     * elements and removes leading and trailing whitespaces in elements with
     * textual content.
     *
     * @param xmlDoc The DOM document to format. The formatting whitespaces will be
     *               removed from this document. If the document is null, nothing
     *               happens.
     */
    public static void removeFormatting(Document xmlDoc) {
        if (xmlDoc != null) {
            removeFormatting(xmlDoc.getDocumentElement());
        }
    }

    /**
     * Removes the formatting whitespaces, namely removes whitespace between child
     * elements and removes leading and trailing whitespaces in elements with
     * textual content.
     *
     * @param xmlElem The DOM element to format. The formatting whitespaces will be
     *                removed from this element. If the element is null, nothing
     *                happens.
     */
    public static void removeFormatting(Element xmlElem) {
        if (xmlElem != null) {
            NodeList children = xmlElem.getChildNodes();

            // Loop through child nodes
            boolean hasChildElements = false;
            List<Node> nodesToRemove = new ArrayList<Node>();
            for (int idx = 0; idx < children.getLength(); idx++) {
                Node childNode = children.item(idx);
                if (childNode instanceof Element) {
                    Element elemChildNode = (Element) childNode;

                    // Mark that this element does have child elements
                    hasChildElements = true;

                    // Format child element by making recursive call
                    removeFormatting(elemChildNode);
                } else if (childNode instanceof Text) {
                    Text textChildNode = (Text) childNode;

                    // If the child text node is made up of whitespace only, mark it for
                    // removal
                    String childTextData = textChildNode.getData();
                    if (childTextData.trim().length() == 0) {
                        nodesToRemove.add(textChildNode);
                    }
                }
            }

            // Remove nodes marked for removal
            for (Node nodeToRemove : nodesToRemove) {
                xmlElem.removeChild(nodeToRemove);
            }

            // Remove leading and trailing whitespace if element is just text
            // content only
            if (!hasChildElements) {
                String textContent = xmlElem.getTextContent();
                if (!textContent.isEmpty()) {
                    xmlElem.setTextContent(textContent.trim());
                }
            }
        }
    }

    /*
     * Hide the constructor to prevent instantiation of the class.
     */
    private DomUtils() {
    }
}

package au.gov.nehta.builder;

import au.gov.nehta.builder.util.narrative.NarrativeUtil;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;
import au.gov.nehta.model.cda.common.time.TimeQuantity;
import au.gov.nehta.model.clinical.common.participation.PersonName;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.diagnostic.pathology.DocumentParticipant;
import au.net.electronichealth.ns.cda._2_0.ObjectFactory;
import au.net.electronichealth.ns.cda._2_0.StrucDocCaption;
import au.net.electronichealth.ns.cda._2_0.StrucDocContent;
import au.net.electronichealth.ns.cda._2_0.StrucDocLinkHtml;
import au.net.electronichealth.ns.cda._2_0.StrucDocParagraph;
import au.net.electronichealth.ns.cda._2_0.StrucDocTable;
import au.net.electronichealth.ns.cda._2_0.StrucDocTbody;
import au.net.electronichealth.ns.cda._2_0.StrucDocTd;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import au.net.electronichealth.ns.cda._2_0.StrucDocThead;
import org.joda.time.DateTime;

import javax.xml.bind.JAXBElement;
import java.io.Serializable;
import java.util.Arrays;
import java.util.List;

import static au.gov.nehta.builder.util.narrative.NarrativeUtil.NARRATIVE_DATE_TIME_FORMATTER;
import static au.gov.nehta.builder.util.narrative.NarrativeUtil.createTableBodyRowWithCellValues;
import static au.gov.nehta.builder.util.narrative.NarrativeUtil.createTableBodyRowWithCells;
import static au.gov.nehta.builder.util.narrative.NarrativeUtil.getTableHeaderRow;
import static au.gov.nehta.builder.util.narrative.NarrativeUtil.render;

public class DocumentCreatorUtil {

  public static final String HL7_TEXT_MEDIA_TYPE = "text/x-hl7-text+xml";

  public static void add(StrucDocTbody body, String name, String value) {
    body.getTr().add(
        createTableBodyRowWithCellValues(Arrays.asList(name, value)));
  }

  public static void add(StrucDocTbody body, String... strings) {
    body.getTr().add(
        createTableBodyRowWithCellValues(Arrays.asList(strings)));
  }

  public static void add(StrucDocTbody body, List<StrucDocTd> cells) {
    body.getTr().add(createTableBodyRowWithCells(cells));
  }

  public static void add(StrucDocTbody body, StrucDocTd... cells) {
    body.getTr().add(createTableBodyRowWithCells(cells));
  }

  public static String print(DateTime time) {
    return NARRATIVE_DATE_TIME_FORMATTER.print(time);
  }


  public static String print(PreciseDate date) {
    if (date == null) {
      return "";
    }
    return date.toNarrativeForm();
  }

  public static String safe(Integer z) {
    if (z == null) {
      return "";
    }
    return Integer.toString(z);
  }

  /**
   * Turn a code into a string representation. this impl ignores translations
   */
  public static String print(Coded code) {
    if (code == null) {
      return "";
    }
    //use the originalText if it exists
    if (code.getOriginalText() != null) {
      return code.getOriginalText();
    }

    //return the display name if we have it
    if (code.isCoded() && code.getDisplayName() != null) {
      return code.getDisplayName();
    }

    //else no orignal text and no display name, so use the code
    if (code.isCoded()) {
      return code.getCode();
    }

    //else no code, display name or original text - todo: is there a translation?
    return "";

  }

  public static String buildId(UniqueIdentifier sepcimenId) {
    StringBuilder b = new StringBuilder();
    sepcimenId.getRoot();
    b.append(safe(sepcimenId.getRoot()));
    b.append(" ");
    b.append(safe(sepcimenId.getExtension()));
    return b.toString();
  }

  //retrun an emtpy string instead of "null"
  public static String safe(String text) {
    return text == null ? "" : text;
  }

  public static void addHeader(StrucDocTable table, String... headings) {
    StrucDocThead header = new StrucDocThead();
    header.getTr().add(getTableHeaderRow(Arrays.asList(headings)));
    table.setThead(header);
  }

  public static StrucDocTbody addBody(StrucDocTable table) {
    StrucDocTbody body = new StrucDocTbody();
    table.getTbody().add(body);
    return body;
  }

  public static void addCaption(StrucDocTable table, String caption) {
    StrucDocCaption scaption = new StrucDocCaption();
    scaption.getContent().add(caption);
    table.setCaption(scaption);
  }

  /*
   * create a StructDocText with the supplied table
   **/
  public static StrucDocText textWithTable(StrucDocTable table) {
    StrucDocText text = new StrucDocText();
    addTable(text, table);
    return text;
  }

  //add a table to a StrucDocText
  public static void addTable(StrucDocText text, StrucDocTable table) {
    JAXBElement<StrucDocTable> element = new ObjectFactory().createStrucDocTextTable(table);
    text.getContent().add(element);
  }

  public static JAXBElement<StrucDocContent> link(String href, String title) {
    if (href == null) {
      return null;
    }
    StrucDocLinkHtml link = new StrucDocLinkHtml();
    link.setHref(href);
    link.getContent().add(title);
    JAXBElement<StrucDocLinkHtml> jaxbLinkHtml = new ObjectFactory()
        .createStrucDocContentLinkHtml(link);
    StrucDocContent content = new StrucDocContent();
    content.getContent().add(jaxbLinkHtml);
    return new ObjectFactory().createStrucDocTdContent(content);
  }

  public static StrucDocTd cell(Serializable s) {
    return NarrativeUtil.cell(s);
  }

  protected static StrucDocTd printAuthorOrg(DocumentParticipant author) {
    PersonName personName = author.getParticipant().getPerson().getPersonName();
    String organisationName = author.getParticipant().getEmploymentOrganisation()
        .getOrganisationName();
    StrucDocTd name = cell(render(personName));
    NarrativeUtil.br(name);
    name.getContent().add("(" + organisationName + ")");
    return name;
  }

  public static DateTime time(PreciseDate dateTimeStarted) {
    if (dateTimeStarted != null) {
      return dateTimeStarted.getDateTime();
    }
    return null;
  }

  public static DateTime time(PreciseDate start, PreciseDate end) {
    if (end != null) {
      return end.getDateTime();
    }
    if (start != null) {
      return start.getDateTime();
    }

    return null;
  }

  public static String print(TimeQuantity width) {
    return safe(width.getValue()) + " " + safe(width.getUnit());
  }

  public static String narrativeVersion(RestrictedTimeInterval i) {
    String timeInterval = "";
    if (i == null) {
      return timeInterval;
    }

    //use the narrative form if we have it
    if (i.getNarrative() != null) {
      return timeInterval = i.getNarrative();
    }

    //else build up the time

    //high low
    if (i.getHigh() != null && i.getLow() != null) {
      return print(i.getLow()) + " -> " + print(i.getHigh());
    }

    //center width
    if (i.getCenter() != null && i.getWidth() != null) {
      return print(i.getCenter()) + " (" + print(i.getWidth()) + ")";
    }

    //low only
    if (i.getLow() != null) {
      return print(i.getLow());
    }

    //PW: 9/5/16 Added High only option which was missing
    //high only
    if (i.getHigh() != null) {
      return print(i.getHigh());
    }

    //center only
    if (i.getCenter() != null) {
      return print(i.getCenter());
    }

    return timeInterval;
  }

  public static String display(PreciseDate start, PreciseDate end) {
    if (start == null && end == null) {
      return "";
    }

    if (start != null) {
      StringBuffer buff = new StringBuffer(print(start));

      if (end == null) {
        return buff.toString();
      }

      buff.append(" -> ");
      buff.append(print(end));

      return buff.toString();
    } else {
      return print(end);
    }
  }

  public static StrucDocParagraph getEmptyParagraphWithMessage(String message) {
    StrucDocParagraph paragraph = new StrucDocParagraph();
    paragraph.getContent().add(message);
    return paragraph;
  }
}

import java.io.File;
import java.util.Scanner;

import javax.xml.XMLConstants;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.validation.SchemaFactory;
import javax.xml.validation.Validator;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.xml.sax.ErrorHandler;
import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException;

/**
 * 
 * XMLParser.java
 * @author Trushank
 * Date Jan 10, 2013
 * Version 1.0
 * 
 */
/**
 * @author Trushank
 * 
 */
public class XMLParser {
    public static void main(String args[]) {
	
	Scanner src=new Scanner(System.in);
	System.out.println("Please enter name of XML file eg:test.xml");
	String filename=src.nextLine();
	System.out.println("Select option: 1) Check for well formedness\n2)Validate Against DTD\n3) Validate against XSD");
	int choice= src.nextInt();
	switch(choice){
	case 1:
	    wellFormed(filename);
	    break;
	case 2:
	    DTD(filename);
	    break;
	case 3:
	   
	    XSD(filename);
	    break;
	    default:
		System.out.println("Wrong Choice");
	    
	}
	
	

    }
    public static void DTD(String filename){
	try {
	    DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
	    dbf.setValidating(true);
	    DocumentBuilder db = dbf.newDocumentBuilder();
	    db.setErrorHandler(new ErrorHandler() {

		@Override
		public void warning(SAXParseException e) throws SAXException {
		    System.out.println(e.getMessage());

		}

		@Override
		public void fatalError(SAXParseException e) throws SAXException {
		    System.out.println(e.getMessage());

		}

		@Override
		public void error(SAXParseException e) throws SAXException {
		    System.out.println(e.getMessage());

		}
	    });
	db.parse(filename);

	} catch (Exception e) {
	    System.out.println(e.getMessage());
	}
    }
    public static void wellFormed(String filename){
	  try {
		 DocumentBuilderFactory dbf= DocumentBuilderFactory.newInstance();
		DocumentBuilder db=dbf.newDocumentBuilder();
		db.parse(filename);
		System.out.println("Well formed");
	    } catch (Exception e) {
		System.out.println(e.getMessage());
	    }
	    
    }
    public static void XSD(String filename){
	try {
	    Scanner s1=new Scanner(System.in);
	    System.out.println("Enter xsd filename eg test.xsd");
	    String xsd=s1.nextLine();
	   Validator val= SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI).newSchema(new File(xsd)).newValidator();
	   DocumentBuilderFactory dbf= DocumentBuilderFactory.newInstance();
		DocumentBuilder db=dbf.newDocumentBuilder();
		Document doc=	db.parse(filename);
	   DOMSource ds=new DOMSource(doc);
	   val.validate(ds);
		  
	   //val.va
	} catch (Exception e) {
	    // TODO Auto-generated catch block
	    System.out.println(e.getMessage());
	}
    }
}

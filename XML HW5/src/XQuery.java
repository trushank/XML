import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Properties;
import java.util.Scanner;

import javax.xml.transform.OutputKeys;
import javax.xml.transform.sax.SAXSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.xquery.XQException;

import net.sf.saxon.Configuration;
import net.sf.saxon.om.DocumentInfo;
import net.sf.saxon.query.DynamicQueryContext;
import net.sf.saxon.query.StaticQueryContext;
import net.sf.saxon.query.XQueryExpression;

import org.xml.sax.InputSource;

/**
 * 
 * XQuery.java
 * @author Trushank
 * Date Feb 2, 2013
 * Version 1.0
 *
 */
/**
 * @author Trushank
 * 
 */

public class XQuery {
    public static void main(String[] args) throws XQException {

	generate("movie.xml", "a.txt", "movie");
	generate("movie.xml", "b.txt", "performer");
	generate("movie.xml", "c.txt", "DirectedBy");
	generate("movie.xml", "d.txt", "ActedIn");
    }

    public static void generate(String xmlfile, String xq, String type) {
	try {
	    File XML = new File(xmlfile); // XML file

	    Configuration C = new Configuration(); // Configuration
	    StaticQueryContext sq = new StaticQueryContext(C);
	    DynamicQueryContext DQC = new DynamicQueryContext(C);

	    Properties props = new Properties();
	    props.setProperty(OutputKeys.METHOD, "text"); // Setting output to
							  // text

	    InputStream is = new FileInputStream(xq); // Input stream to read
						      // xquery
	    sq.setBaseURI(new File(xq).toURI().toString());
	    XQueryExpression xqe = sq.compileQuery(is, null); // compiling query
	    InputSource XMLSource = new InputSource(XML.toURI().toString());
	    SAXSource SAXs = new SAXSource(XMLSource);
	    DocumentInfo DI = sq.buildDocument(SAXs);
	    DQC.setContextNode(DI);

	    xqe.run(DQC, new StreamResult(new FileOutputStream(new File(
		    "temp.txt"))), props); // Running the
	    // query and
	    // displaying on
	    // console
	    Scanner s1 = new Scanner(new File("temp.txt"));
	    s1.useDelimiter("#");
	    while (s1.hasNext()) {
		System.out.print("insert into " + type + " values('");
		while (true) {
		    String x = s1.next();
		    boolean check = false;
		    if (x.contains("$")) {
			x = x.substring(0, x.length() - 2);
			check = true;
		    }

		    x = x.replace("\n", "");
		    x = x.replace("     ", "");
		    x = x.replace("    ", ";");
		    x = x.replace("   ", "");
		    if (x.length() > 0) {
			if (x.indexOf(' ') == 0)
			    x = x.substring(1);
			if (x.length() > 0
				&& x.lastIndexOf(' ') == x.length() - 1)
			    x = x.substring(0, x.length() - 1);
		    }
		    System.out.print(x);
		    if (check)
			break;
		    if (s1.hasNext())
			System.out.print("', '");

		}
		System.out.print("');\n");
	    }
	} catch (Exception e) {
	    System.err.println(e.getMessage());
	}
    }
}

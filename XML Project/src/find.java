/**
* 
* find.java
* @author Trushank
* Date Feb 9, 2013
* Version 1.0
* 
 */
/**
 * @author Trushank
 *
 */
import java.io.File;
import java.io.FileOutputStream;
import javax.xml.parsers.*;
import javax.xml.transform.*;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.xpath.*;
import org.w3c.dom.*;

public class find {

    public static void main(String[] args) throws Exception {
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        Document document = dbf.newDocumentBuilder().parse(new File("user.xml"));

        XPathFactory xpf = XPathFactory.newInstance();
        XPath xpath = xpf.newXPath();
        XPathExpression expression = xpath.compile("//users/user[vehicle/vehicle_no/text()=123456]/vehicle/@type");

        Node b13Node = (Node) expression.evaluate(document, XPathConstants.NODE);
       System.out.println(b13Node.getNodeValue());
       /* b13Node.getParentNode().removeChild(b13Node);

        TransformerFactory tf = TransformerFactory.newInstance();
        Transformer t = tf.newTransformer();
        File file = new File("User.xml");
       	FileOutputStream fos=new FileOutputStream(file,false);
        t.transform(new DOMSource(document), new StreamResult(fos));
       fos.close();
	*/
	

    }

}
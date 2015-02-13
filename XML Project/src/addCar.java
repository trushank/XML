/**
* 
* findEmpty.java
* @author Trushank
* Date Feb 9, 2013
* Version 1.0
 * 
 */
/**
 * @author Trushank
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

public class addCar {

    public static void main(String[] args) throws Exception {
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        Document document = dbf.newDocumentBuilder().parse(new File("lot.xml"));

        XPathFactory xpf = XPathFactory.newInstance();
        XPath xpath = xpf.newXPath();
        XPathExpression expression = xpath.compile("//lot/wing/floor/slot/number[vehicle='tyuio']/@value");
        Node slotnumber = (Node) expression.evaluate(document, XPathConstants.NODE);
       expression = xpath.compile("//lot/wing/floor/slot[number/vehicle='tyuio']");
        Node parkingslot = (Node) expression.evaluate(document, XPathConstants.NODE);
        org.w3c.dom.Element slot = ((org.w3c.dom.Document) document).createElement("slot");
        slot.setAttribute("type", "Car");
        slot.setAttribute("vacant", "Yes");
        org.w3c.dom.Element number = ((org.w3c.dom.Document) document).createElement("number");
        number.setAttribute("value", slotnumber.getNodeValue());
        slot.appendChild(number);
        parkingslot.getParentNode().appendChild(slot);
        parkingslot.getParentNode().removeChild(parkingslot);
        /*org.w3c.dom.Element model1 = ((org.w3c.dom.Document) doc)
		.createElement("model");
	((Node) child3).appendChild((Node) model1);

	org.w3c.dom.Text model2 = ((org.w3c.dom.Document) doc)
		.createTextNode(model);
	((Node) model1).appendChild(model2);*/
       System.out.println(slotnumber.getNodeValue());
       /* b13Node.getParentNode().removeChild(b13Node);
*/
        TransformerFactory tf = TransformerFactory.newInstance();
        Transformer t = tf.newTransformer();
        File file = new File("Lot.xml");
       	FileOutputStream fos=new FileOutputStream(file,false);
        t.transform(new DOMSource(document), new StreamResult(fos));
       fos.close();
	
	

    }

}
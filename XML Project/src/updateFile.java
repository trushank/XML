import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.StringWriter;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Node;

public class updateFile {

    public static void main(String args[]) {

	String name = "Shahrukh Khan";
	String dob = "09/23/1990";
	String contact = "5857123242";
	String email = "raghuveermadhala@gmail.com";
	String vehicle = "123456";
	String make = "Ferrari";
	String model = "Supra";
	String type = "Car";
	try {
	    System.out.println(name);
	    DocumentBuilderFactory builderFactory = DocumentBuilderFactory
		    .newInstance();
	    DocumentBuilder docBuilder = builderFactory.newDocumentBuilder();
	    org.w3c.dom.Document doc = docBuilder.parse(new File("User.xml"));
	    // System.out.println("After items retrieval");
	    createXmlTree(doc, name, dob, contact, email, vehicle, make, model,
		    type);
	    // System.out.println("<b>Xml File Created Successfully</b>");
	} catch (Exception e) {
	    e.printStackTrace();
	}

    }

    public static void createXmlTree(org.w3c.dom.Document doc, String name,
	    String dob, String contact, String email, String vehicle,
	    String make, String model, String type) throws Exception {
	// System.out.println(name);
	// System.out.println(doc);
	org.w3c.dom.Element root1 = doc.getDocumentElement();
	org.w3c.dom.Element root = ((org.w3c.dom.Document) doc)
		.createElement("user");
	System.out.println((Node) root);
	((Node) root1).appendChild((Node) root);

	org.w3c.dom.Element child1 = ((org.w3c.dom.Document) doc)
		.createElement("name");
	((Node) root).appendChild(child1);

	org.w3c.dom.Text text1 = ((org.w3c.dom.Document) doc)
		.createTextNode(name);
	child1.appendChild(text1);

	org.w3c.dom.Element dob1 = ((org.w3c.dom.Document) doc)
		.createElement("dob");
	((Node) root).appendChild(dob1);

	org.w3c.dom.Text dob2 = ((org.w3c.dom.Document) doc)
		.createTextNode(dob);
	dob1.appendChild(dob2);

	org.w3c.dom.Element child2 = ((org.w3c.dom.Document) doc)
		.createElement("contact");
	((Node) root).appendChild((Node) child2);

	org.w3c.dom.Text text2 = ((org.w3c.dom.Document) doc)
		.createTextNode(contact);
	((Node) child2).appendChild(text2);

	org.w3c.dom.Element child4 = ((org.w3c.dom.Document) doc)
		.createElement("email");
	((Node) root).appendChild((Node) child4);

	org.w3c.dom.Text text4 = ((org.w3c.dom.Document) doc)
		.createTextNode(email);
	((Node) child4).appendChild(text4);

	org.w3c.dom.Element child3 = ((org.w3c.dom.Document) doc)
		.createElement("vehicle");
	child3.setAttribute("type", type);
	((Node) root).appendChild((Node) child3);

	org.w3c.dom.Element vehicle_no = ((org.w3c.dom.Document) doc)
		.createElement("vehicle_no");
	((Node) child3).appendChild((Node) vehicle_no);
	org.w3c.dom.Text vehicle_no1 = ((org.w3c.dom.Document) doc)
		.createTextNode(vehicle);
	((Node) vehicle_no).appendChild(vehicle_no1);

	org.w3c.dom.Element make1 = ((org.w3c.dom.Document) doc)
		.createElement("make");
	((Node) child3).appendChild((Node) make1);

	org.w3c.dom.Text make2 = ((org.w3c.dom.Document) doc)
		.createTextNode(make);
	((Node) make1).appendChild(make2);

	org.w3c.dom.Element model1 = ((org.w3c.dom.Document) doc)
		.createElement("model");
	((Node) child3).appendChild((Node) model1);

	org.w3c.dom.Text model2 = ((org.w3c.dom.Document) doc)
		.createTextNode(model);
	((Node) model1).appendChild(model2);

	TransformerFactory factory = TransformerFactory.newInstance();
	Transformer transformer = factory.newTransformer();

	transformer.setOutputProperty(OutputKeys.INDENT, "yes");

	StringWriter sw = new StringWriter();

	StreamResult result = new StreamResult(sw);
	DOMSource source = new DOMSource((Node) doc);
	transformer.transform(source, result);
	String xmlString = sw.toString();
	// System.out.println("String is : "+xmlString);
	File file = new File("User.xml");
	FileWriter fw = new FileWriter(file, false);
	BufferedWriter bw = new BufferedWriter(fw);
	bw.write(xmlString);
	bw.flush();
	bw.close();
    }

}
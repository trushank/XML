<%@page import="java.nio.file.Files"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="style.css" media="screen" />
<title>Register</title>
</head>
<body>
<%@ page import="java.io.BufferedWriter,java.io.File,java.io.FileWriter,java.io.StringWriter,javax.xml.parsers.DocumentBuilder,javax.xml.parsers.DocumentBuilderFactory" %>
<%@ page import="javax.xml.transform.*,org.w3c.dom.Node,javax.xml.transform.stream.StreamResult,javax.xml.transform.dom.DOMSource,static java.nio.file.StandardCopyOption.*" %>
<%@ page import="java.io.File,
java.io.FileOutputStream,
javax.xml.parsers.*,
javax.xml.transform.*,
javax.xml.transform.dom.DOMSource,
javax.xml.transform.stream.StreamResult,
javax.xml.xpath.*,
javax.xml.validation.Validator,
javax.xml.validation.SchemaFactory,
javax.xml.XMLConstants,
org.w3c.dom.*;" %>
<%


String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String dob=request.getParameter("dd")+"/"+request.getParameter("mm")+"/"+request.getParameter("yy");
String contact =request.getParameter("cell_no");
String email=request.getParameter("email");
String vehicle = request.getParameter("plate");
String make=request.getParameter("make");
String model=request.getParameter("model");
String type=request.getParameter("type");
String name = fname+" "+lname;

try {
    //System.out.println(name);
    DocumentBuilderFactory builderFactory = DocumentBuilderFactory
	    .newInstance();
    DocumentBuilder docBuilder = builderFactory.newDocumentBuilder();
    org.w3c.dom.Document doc = docBuilder.parse(new File("User.xml"));
    // System.out.println("After items retrieval");
   org.w3c.dom.Element root1 = doc.getDocumentElement();
	org.w3c.dom.Element root = ((org.w3c.dom.Document) doc)
		.createElement("user");
	//System.out.println((Node) root);
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
	//System.out.println(file.getAbsolutePath());
	FileWriter fw = new FileWriter(file,false);
	BufferedWriter bw = new BufferedWriter(fw);
	bw.write(xmlString);
	bw.flush();
	bw.close();
	 try{
	       Validator val = SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI)
	       .newSchema(new File("lot.xsd")).newValidator();
	       DocumentBuilderFactory dbf1 = DocumentBuilderFactory.newInstance();
	       DocumentBuilder db = dbf1.newDocumentBuilder();
	       Document doc1 = db.parse("Lot.xml");
	       DOMSource ds = new DOMSource(doc1);
	       val.validate(ds);
	       }
	       catch(Exception e3){
		   System. out.println("Invalid Document");
	           out.println("Invalid Document");
	           return;
	       }
    // System.out.println("<b>Xml File Created Successfully</b>");
} catch (Exception e) {
    e.printStackTrace();
}
//out.println(fname+"<br/>"+lname+"<br/>"+dob+"<br/>"+cell+"<br/>"+email+"<br/>"+plate+"<br/>"+make+"<br/>"+model+"<br/>"+type);
response.sendRedirect("enter.jsp");
%>
</body>
</html>
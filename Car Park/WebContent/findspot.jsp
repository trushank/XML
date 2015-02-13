<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="style.css" media="screen" />
<title>Insert title here</title>
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
try{
    DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
    Document document = dbf.newDocumentBuilder().parse(new File("Lot.xml"));
    XPathFactory xpf = XPathFactory.newInstance();
    XPath xpath = xpf.newXPath();
    XPathExpression expression = xpath.compile("//lot/wing/floor/slot/number[vehicle='"+request.getParameter("plate")+"']/@value");
    Node slotnumber = (Node) expression.evaluate(document, XPathConstants.NODE);
   expression = xpath.compile("//lot/wing/floor/slot[number/vehicle='"+request.getParameter("plate")+"']");
    Node parkingslot = (Node) expression.evaluate(document, XPathConstants.NODE);
    expression = xpath.compile("//lot/wing/floor/slot[number/vehicle='"+request.getParameter("plate")+"']/@type");
    Node type = (Node) expression.evaluate(document, XPathConstants.NODE);
    expression = xpath.compile("//lot/wing/floor/slot[number/vehicle='"+request.getParameter("plate")+"']/number/vehicle/@time");
    Node time = (Node) expression.evaluate(document, XPathConstants.NODE);
    long oldTime=Long.parseLong((String)time.getNodeValue());
    long diff=System.currentTimeMillis()-oldTime;
    org.w3c.dom.Element slot = ((org.w3c.dom.Document) document).createElement("slot");
    slot.setAttribute("type",type.getNodeValue());
    slot.setAttribute("vacant", "Yes");
    org.w3c.dom.Element number = ((org.w3c.dom.Document) document).createElement("number");
    number.setAttribute("value", slotnumber.getNodeValue());
    slot.appendChild(number);
    parkingslot.getParentNode().appendChild(slot);
    parkingslot.getParentNode().removeChild(parkingslot);
    TransformerFactory tf = TransformerFactory.newInstance();
    Transformer t = tf.newTransformer();
    File file = new File("Lot.xml");
   	FileOutputStream fos=new FileOutputStream(file,false);
    t.transform(new DOMSource(document), new StreamResult(fos));
   fos.close();
   try{
       Validator val = SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI)
       .newSchema(new File("lot.xsd")).newValidator();
       DocumentBuilderFactory dbf1 = DocumentBuilderFactory.newInstance();
       DocumentBuilder db = dbf1.newDocumentBuilder();
       Document doc = db.parse("Lot.xml");
       DOMSource ds = new DOMSource(doc);
       val.validate(ds);
       }
       catch(Exception e3){
           out.println("Invalid Document");
       }
   String abcd="1ABCD";
   String spt=slotnumber.getNodeValue();
   char w=abcd.charAt(Integer.parseInt(spt.substring(0,1)));
   out.println("<h1>Thank you for choosing XML Parking Lot</h1>");
   out.println("<h2>Please collect your "+type.getNodeValue()+" from the marked slot</h2>");
	   out.println("Charge: $"+diff/1000+"</br>Wing: <b>"+w+"</b> Floor: <b>"+spt.substring(1,2)+"</b> Spot no: <b>"+spt.substring(2)+"</b><br/><br/>");
   out.println("<img src=slots//"+slotnumber.getNodeValue().substring(2)+".jpg width=700 height=450/>");
}
catch(Exception e){
    System.out.println(e);
try{
DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
Document document = dbf.newDocumentBuilder().parse(new File("User.xml"));

XPathFactory xpf = XPathFactory.newInstance();
XPath xpath = xpf.newXPath();
XPathExpression expression = xpath.compile("//users/user[vehicle/vehicle_no/text()="+request.getParameter("plate")+"]/vehicle/@type");

Node b13Node = (Node) expression.evaluate(document, XPathConstants.NODE);


dbf = DocumentBuilderFactory.newInstance();
document = dbf.newDocumentBuilder().parse(new File("Lot.xml"));

xpf = XPathFactory.newInstance();
xpath = xpf.newXPath();
expression = xpath.compile("//lot/wing[string(@name)=\""+request.getParameter("wing")+"\"]/floor/slot[@type=\""+b13Node.getNodeValue()+"\" and string(@vacant)=\"Yes\"]/number/@value");
Node slotnumber = (Node) expression.evaluate(document, XPathConstants.NODE);
expression = xpath.compile("//lot/wing[string(@name)=\""+request.getParameter("wing")+"\"]/floor/slot[@type=\""+b13Node.getNodeValue()+"\" and string(@vacant)=\"Yes\"]");
Node parkingslot = (Node) expression.evaluate(document, XPathConstants.NODE);
org.w3c.dom.Element slot = ((org.w3c.dom.Document) document).createElement("slot");
slot.setAttribute("type", b13Node.getNodeValue());
slot.setAttribute("vacant", "No");
org.w3c.dom.Element number = ((org.w3c.dom.Document) document).createElement("number");
number.setAttribute("value", slotnumber.getNodeValue());
org.w3c.dom.Element vehicle = ((org.w3c.dom.Document) document).createElement("vehicle");
vehicle.setAttribute("time", Long.toString(System.currentTimeMillis()));
org.w3c.dom.Text model2 = ((org.w3c.dom.Document) document)
	.createTextNode(request.getParameter("plate"));
vehicle.appendChild(model2);
number.appendChild(vehicle);
slot.appendChild(number);
parkingslot.getParentNode().appendChild(slot);
parkingslot.getParentNode().removeChild(parkingslot);
TransformerFactory tf = TransformerFactory.newInstance();
Transformer t = tf.newTransformer();
File file = new File("Lot.xml");
	FileOutputStream fos=new FileOutputStream(file,false);
t.transform(new DOMSource(document), new StreamResult(fos));
fos.close();
try{
Validator val = SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI)
.newSchema(new File("lot.xsd")).newValidator();
DocumentBuilderFactory dbf1 = DocumentBuilderFactory.newInstance();
DocumentBuilder db = dbf1.newDocumentBuilder();
Document doc = db.parse("Lot.xml");
DOMSource ds = new DOMSource(doc);
val.validate(ds);
}
catch(Exception e3){
    out.println("Invalid Document");
}
String abcd="1ABCD";
String spt=slotnumber.getNodeValue();
char w=abcd.charAt(Integer.parseInt(spt.substring(0,1)));
out.println("<h2>Please park your "+b13Node.getNodeValue()+" in the marked slot</h2>");
	   out.println("Wing: <b>"+w+"</b> Floor: <b>"+spt.substring(1,2)+"</b> Spot no: <b>"+spt.substring(2)+"</b><br/><br/>");

out.println("<img src=slots//"+slotnumber.getNodeValue().substring(2)+".jpg width=700 height=450/>");  


}
catch(Exception e1){
    try{
   String path;
   int origin;
    String A[]={"1234","2314","3421","4321"};
    if(((String)request.getParameter("path")).contains("new")){
	path=Integer.toString(Integer.parseInt(request.getParameter("wing")));
	origin=Integer.parseInt(request.getParameter("wing"))-1;
    }
    else{
     path=request.getParameter("path");
    origin=Integer.parseInt(request.getParameter("origin"));
    }
    char wingno=A[origin].charAt(path.length());
    path=path+A[origin].charAt(path.length());
    response.sendRedirect("findspot.jsp?wing="+wingno+"&plate="+request.getParameter("plate")+"&path="+path+"&origin="+origin);
}
catch(Exception e2){
    out.println("<h1>Sorry no vacant spots found</h1>");
    }
}
}
%>

<form action="enter.jsp" method="get">
<input type="submit" value="OK">
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="style.css" media="screen" />
<title>Please enter registration number</title>
</head>
<body>

<h1>Welcome to XML Car lot</h1>
<form action="findspot.jsp" method="get">
Wing: 
<select name=wing>
  <option value="1">A</option>
  <option value="2">B</option>
  <option value="3">C</option>
  <option value="4">D</option>
</select>
<br/>
<input type=hidden name=origin value=new/>
<input type=hidden name=path value=new/>
Vehicle registration number:<input type=text name=plate><br/>
<a href="Car Park.html"><input type="button" value="Register"></a>
<input type="submit" value="Login">
</form>

</body>
</html>
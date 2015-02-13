<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/opml/body">
<html>
<head>
<META http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Books in my Office</title>
</head>
<body>
	<table width="100%" cellspacing="0">
		<colgroup>
			<col width="37%">
			<col width="32%">
			<col width="16%">
			<col width="10%">
			<col width="5%">
		</colgroup>
		<tr bgcolor="Yellow">
			<th class="cell"><span> Text </span></th>
			<th class="cell"><span> Title </span></th>
			<th class="cell"><span>Author </span></th>
			<th class="cell">Publisher</th>
			<th class="cell">ISBN</th>
			<th class="right">Year</th>
		</tr>
 <xsl:for-each select="outline">
<xsl:for-each select="outline">
        <tr>
          <td><xsl:value-of select="@title"/></td>
          <td><xsl:value-of select="@text"/></td>
        </tr>
      </xsl:for-each>
      
      </xsl:for-each>
</table>
</body>
</html>
</xsl:stylesheet>
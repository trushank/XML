<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" indent="yes"/>
<xsl:strip-space elements = "*" />

<xsl:variable name="markerNormal">&#9658;</xsl:variable>
<xsl:variable name="markerComment">&#8810;</xsl:variable>
<xsl:variable name="markerLink">&#9788;</xsl:variable>

<xsl:template match = "/opml" >

<list>
 <xsl:for-each select="body/outline">
<books>
  
<xsl:attribute name="text">
   <xsl:value-of select="@text"/>
  </xsl:attribute>

<xsl:for-each select="./outline">
<book>
<text><xsl:value-of select="@text"/></text>
<title><xsl:value-of select="@title"/></title>
<author>          <xsl:value-of select="@author"/></author>
 <publisher>         <xsl:value-of select="@publisher"/> </publisher>
<isbn>          <xsl:value-of select="@isbn"/></isbn>
 <year>         <xsl:value-of select="@year"/></year>
</book>
      </xsl:for-each>
        
      </books>
      
      </xsl:for-each>
</list>
</xsl:template>
</xsl:stylesheet>
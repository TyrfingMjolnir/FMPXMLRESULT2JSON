<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fmp="http://www.filemaker.com/fmpxmlresult" version="1.0">
<xsl:output method="text" version="1.0" encoding="UTF-8" indent="no"/>
<xsl:template match="fmp:FMPXMLRESULT">
<xsl:text>{"</xsl:text><xsl:value-of select="$schemaTableName" /><xsl:text>": [ {</xsl:text>
<xsl:for-each select="fmp:RESULTSET/fmp:ROW">
  <xsl:for-each select="fmp:COL">
    <xsl:variable name="i"><xsl:value-of select="position()"/></xsl:variable>
    <xsl:choose>
      <xsl:when test="position()=last()">
        <xsl:text>"</xsl:text><xsl:value-of select="//fmp:FIELD[position()=$i]/@NAME"/><xsl:text>":"</xsl:text>
        <xsl:value-of select="fmp:DATA"/><xsl:text>"</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>"</xsl:text><xsl:value-of select="//fmp:FIELD[position()=$i]/@NAME"/><xsl:text>":"</xsl:text>
        <xsl:value-of select="fmp:DATA"/><xsl:text>"</xsl:text><xsl:value-of select="$delimiter"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:for-each>
  <xsl:choose>
    <xsl:when test="position()=last()">
      <xsl:text>} ] }</xsl:text>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$newrecord"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:for-each>
</xsl:template>
<xsl:variable name="delimiter">
  <xsl:text>,</xsl:text>
</xsl:variable>
<xsl:variable name="newrecord">
  <xsl:text>}, {</xsl:text>
</xsl:variable>
<xsl:variable name="schemaTableName">
  <xsl:value-of select="fmp:FMPXMLRESULT/fmp:DATABASE/@NAME" /><xsl:text>.</xsl:text><xsl:value-of select="fmp:FMPXMLRESULT/fmp:DATABASE/@LAYOUT" />
</xsl:variable>
<xsl:template name="string-replace-all">
  <xsl:param name="text" />
  <xsl:param name="replace" />
  <xsl:param name="by" />
  <xsl:choose>
    <xsl:when test="contains($text, $replace)">
      <xsl:value-of select="substring-before($text,$replace)" />
      <xsl:value-of select="$by" />
      <xsl:call-template name="string-replace-all">
        <xsl:with-param name="text"    select="substring-after($text,$replace)" />
        <xsl:with-param name="replace" select="$replace" />
        <xsl:with-param name="by"      select="$by" />
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$text" />
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>
</xsl:stylesheet><!--
========================================================================================
Copyright (c) 2008 Gjermund Gusland Thorsen, released under the MIT License.
All rights deserved.
This piece comes with ABSOLUTELY NO WARRANTY, to the extent permitted by applicable law.
========================================================================================
-->

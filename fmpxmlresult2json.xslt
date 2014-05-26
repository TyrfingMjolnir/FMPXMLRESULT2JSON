<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fmp="http://www.filemaker.com/fmpxmlresult" version="1.0">
	<xsl:output method="text" version="1.0" encoding="UTF-8" indent="no"/>
	<xsl:template match="fmp:FMPXMLRESULT">
		<xsl:text>[
	{
		</xsl:text>
		<xsl:for-each select="fmp:RESULTSET/fmp:ROW">
			<xsl:for-each select="fmp:COL">
				<xsl:variable name="i">
					<xsl:value-of select="position()"/>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="position()=last()">
						<xsl:text>"</xsl:text>
						<xsl:value-of select="//fmp:FIELD[position()=$i]/@NAME"/>
						<xsl:text>":"</xsl:text>
						<xsl:value-of select="fmp:DATA"/>
						<xsl:text>"</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>"</xsl:text>
						<xsl:value-of select="//fmp:FIELD[position()=$i]/@NAME"/>
						<xsl:text>":"</xsl:text>
						<xsl:value-of select="fmp:DATA"/>
						<xsl:text>"</xsl:text>
						<xsl:value-of select="$delimiter"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
			<xsl:choose>
				<xsl:when test="position()=last()">
					<xsl:text>
	}
]
</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$newrecord"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:variable name="delimiter">
		<xsl:text>,
		</xsl:text>
	</xsl:variable>
	<xsl:variable name="newrecord">
		<xsl:text>
	},
	{
		</xsl:text>
	</xsl:variable>
</xsl:stylesheet><!--
========================================================================================

Copyright © 2008 Gjermund Gusland Thorsen
All rights deserved.

This piece comes with ABSOLUTELY NO WARRANTY, to the extent permitted by applicable law.

========================================================================================
-->

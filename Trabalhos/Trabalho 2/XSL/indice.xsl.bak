<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:guiao="urn:guiao" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">

    <xsl:template match="*" mode="indice">
        <xsl:param name="depth"/>

        <xsl:choose>
            <xsl:when test="name(.) = 'temporada'">
                <xsl:element name="h{$depth}">
                    <xsl:variable name="id-temporada" select="@num-temporada"/>
                    <a href="#{generate-id()}"> Temporada <xsl:number format="1"/>
                    </a>
                </xsl:element>
                <xsl:apply-templates select="*" mode="indice">
                    <xsl:with-param name="depth" select="$depth + 1"/>
                </xsl:apply-templates>
            </xsl:when>
            <xsl:when test="name(.) = 'episodio'">
                <xsl:element name="h{$depth}">
                    <xsl:value-of select="name(.)"/>
                    <xsl:value-of select="@num-episodio"/>
                </xsl:element>
                <xsl:apply-templates select="*" mode="indice">
                    <xsl:with-param name="depth" select="$depth + 1"/>
                </xsl:apply-templates>
            </xsl:when>
            <xsl:when test="name(.) = 'parte'">
                <xsl:element name="h{$depth}">
                    <xsl:value-of select="name(.)"/>
                    <xsl:value-of select="@num-parte"/>
                </xsl:element>
                <xsl:apply-templates select="*" mode="indice">
                    <xsl:with-param name="depth" select="$depth + 1"/>
                </xsl:apply-templates>
            </xsl:when>
            <xsl:when test="name(.) = 'cena'">
                <xsl:element name="h{$depth}">
                    <xsl:value-of select="name(.)"/>
                    <xsl:value-of select="@num-cena"/>
                </xsl:element>
            </xsl:when>
        </xsl:choose>
    </xsl:template>


</xsl:stylesheet>

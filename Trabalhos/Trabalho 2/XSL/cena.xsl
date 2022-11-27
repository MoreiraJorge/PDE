<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:guiao="urn:guiao" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:hierarquia="urn:hierarquia" xmlns:tipo="urn:tipo" version="1.0">

    <xsl:template match="hierarquia:cena">
        <xsl:param name="depth"/>

        <xsl:variable name="contexto" select="@contexto"/>

        <xsl:choose>
            <xsl:when test="$depth = 1">
                <div class="page">
                    <div class="subpage">
                        <xsl:element name="h{$depth}">
                            <xsl:attribute name="class"> schene-title </xsl:attribute> Cena
                                <xsl:value-of select="@num-cena"/>
                        </xsl:element>
                        <span class="context">
                            <xsl:value-of select="$contexto"/>
                        </span>
                        
                        <xsl:element name="p"/>
                        <xsl:apply-templates/>
                    </div>
                </div>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="h{$depth}">
                    <xsl:attribute name="class"> schene-title </xsl:attribute>Cena <xsl:value-of
                        select="@num-cena"/>
                </xsl:element>
                <span class="context">
                    <xsl:value-of select="$contexto"/>
                </span>
                <xsl:element name="p"/>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="hierarquia:fala">
        <xsl:element name="p">
            <span class="uppercase character">
                <xsl:value-of select="key('ref-personagem', @ref-personagem)"/>
            </span>
        </xsl:element>
        <xsl:element name="p">
            <xsl:attribute name="class"> speech </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
        <xsl:element name="br"/>
    </xsl:template>

    <xsl:template match="hierarquia:comentario">
        <xsl:element name="i"> (<xsl:value-of select="node()"/>) </xsl:element>
    </xsl:template>

    <xsl:template match="hierarquia:refere">
        <span class="uppercase">
            <xsl:value-of select="key('ref-personagem', @ref-personagem)"/>
        </span>
    </xsl:template>

    <xsl:template match="hierarquia:adereco">
        <span class="prop">
            <xsl:value-of select="key('ref-adereco', @ref-adereco)"/>
        </span>
    </xsl:template>

</xsl:stylesheet>

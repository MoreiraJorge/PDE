<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:guiao="urn:guiao" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:hierarquia="urn:hierarquia" xmlns:tipo="urn:tipo" version="1.0">

    <xsl:template match="guiao:conteudo" mode="indice">
        <xsl:param name="depth"/>

        <xsl:apply-templates select="hierarquia:temporada" mode="indice">
            <xsl:with-param name="depth" select="$depth"/>
        </xsl:apply-templates>

        <xsl:apply-templates select="hierarquia:parte" mode="indice">
            <xsl:with-param name="depth" select="$depth"/>
        </xsl:apply-templates>

        <xsl:apply-templates select="hierarquia:cena" mode="indice">
            <xsl:with-param name="depth" select="$depth"/>
        </xsl:apply-templates>

    </xsl:template>

    <xsl:template match="hierarquia:temporada" mode="indice">
        <xsl:param name="depth"/>
        <xsl:element name="h{$depth}">
            <a href="#{generate-id()}"> Temporada <xsl:number format="1"/>
            </a>
        </xsl:element>
        <xsl:apply-templates select="hierarquia:episodio" mode="indice">
            <xsl:with-param name="depth" select="$depth + 1"/>
        </xsl:apply-templates>
    </xsl:template>

    <xsl:template match="hierarquia:episodio" mode="indice">
        <xsl:param name="depth"/>
        <xsl:element name="h{$depth}">
            <a href="#{generate-id()}"> Episodio <xsl:number format="1"/>
            </a>
        </xsl:element>
        <xsl:apply-templates select="hierarquia:cena" mode="indice">
            <xsl:with-param name="depth" select="$depth + 1"/>
        </xsl:apply-templates>
    </xsl:template>


    <xsl:template match="hierarquia:parte" mode="indice">
        <xsl:param name="depth"/>
        <xsl:element name="h{$depth}">
            <a href="#{generate-id()}"> Parte <xsl:number format="1"/>
            </a>
        </xsl:element>
        <xsl:apply-templates select="hierarquia:cena" mode="indice">
            <xsl:with-param name="depth" select="$depth + 1"/>
        </xsl:apply-templates>
    </xsl:template>

    <xsl:template match="hierarquia:cena" mode="indice">
        <xsl:param name="depth"/>
        <xsl:element name="h{$depth}">
            <a href="#{generate-id()}"> Cena <xsl:number format="1"/>
            </a>
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>

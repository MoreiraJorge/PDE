<?xml version="1.0" encoding="utf-8"?> 
<xsl:stylesheet xmlns:guiao="urn:guiao" xmlns:hierarquia="urn:hierarquia" xmlns:tipo="urn:tipo"
  version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
  xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:dc="http://purl.org/dc/elements/1.1/"
  xmlns:g="http://www.guiao.pt/">

  <xsl:template match="guiao:conteudo" mode="index">
    <xsl:param name="depth"/>
    <g:index>
      <rdf:Seq>
        <xsl:apply-templates select="hierarquia:temporada" mode="index">
          <xsl:with-param name="depth" select="$depth"/>
        </xsl:apply-templates>

        <xsl:apply-templates select="hierarquia:parte" mode="index">
          <xsl:with-param name="depth" select="$depth"/>
        </xsl:apply-templates>

        <xsl:apply-templates select="hierarquia:cena" mode="index">
          <xsl:with-param name="depth" select="$depth"/>
        </xsl:apply-templates>
      </rdf:Seq>
    </g:index>
  </xsl:template>

  <xsl:template match="hierarquia:temporada" mode="index">
    <xsl:param name="depth"/>
    <rdf:_1> Temporada <xsl:number format="1"/>
    </rdf:_1>
    <xsl:apply-templates select="hierarquia:episodio" mode="index">
      <xsl:with-param name="depth" select="$depth + 1"/>
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template match="hierarquia:episodio" mode="index">
    <xsl:param name="depth"/>
    <rdf:_2> Episodio <xsl:number format="1"/>
    </rdf:_2>
    <xsl:apply-templates select="hierarquia:cena" mode="index">
      <xsl:with-param name="depth" select="$depth + 1"/>
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template match="hierarquia:parte" mode="index">
    <xsl:param name="depth"/>
    <rdf:_3> Parte <xsl:number format="1"/>
    </rdf:_3>
    <xsl:apply-templates select="hierarquia:cena" mode="index">
      <xsl:with-param name="depth" select="$depth + 1"/>
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template match="hierarquia:cena" mode="index">
    <xsl:param name="depth"/>
    <rdf:_4> Cena <xsl:number format="1"/>
    </rdf:_4>
  </xsl:template>

</xsl:stylesheet>

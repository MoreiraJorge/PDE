<?xml version="1.0" encoding="utf-8"?> 
<xsl:stylesheet xmlns:guiao="urn:guiao" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
  xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:foaf="http://xmlns.com/foaf/0.1/"
  xmlns:g="http://www.dc.fc.up.pt/T3/" xmlns:hierarquia="urn:hierarquia" xmlns:tipo="urn:tipo"
  version="1.0">

  <xsl:template match="guiao:conteudo" mode="index">
    <g:Indice>
        <rdf:Seq rdf:about="Indice">
          <xsl:apply-templates select="hierarquia:temporada" mode="index"/>
          <xsl:apply-templates select="hierarquia:parte" mode="index"/>
          <xsl:apply-templates select="hierarquia:cena" mode="index"/>
        </rdf:Seq>
    </g:Indice>
  </xsl:template>

  <xsl:template match="hierarquia:temporada" mode="index">
    <rdf:_1> Temporada <xsl:number format="1"/>
    </rdf:_1>
    <xsl:apply-templates select="hierarquia:episodio" mode="index"> </xsl:apply-templates>
  </xsl:template>

  <xsl:template match="hierarquia:episodio" mode="index">
    <rdf:_2> Episodio <xsl:number format="1"/>
    </rdf:_2>
    <xsl:apply-templates select="hierarquia:cena" mode="index"> </xsl:apply-templates>
  </xsl:template>

  <xsl:template match="hierarquia:parte" mode="index">
    <rdf:_3> Parte <xsl:number format="1"/>
    </rdf:_3>
    <xsl:apply-templates select="hierarquia:cena" mode="index"> </xsl:apply-templates>
  </xsl:template>

  <xsl:template match="hierarquia:cena" mode="index">
    <rdf:_4> Cena <xsl:number format="1"/>
    </rdf:_4>
  </xsl:template>

</xsl:stylesheet>

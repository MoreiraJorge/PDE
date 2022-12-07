<?xml version="1.0" encoding="utf-8"?> 
<xsl:stylesheet xmlns:guiao="urn:guiao" xmlns:tipo="urn:tipo" version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
  xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:dc="http://purl.org/dc/elements/1.1/"
  xmlns:foaf="http://xmlns.com/foaf/0.1/" xmlns:g="http://www.guiao.pt/">

  <xsl:template match="guiao:autores">
    <g:autors>
      <rdf:Bag>
        <xsl:apply-templates select="guiao:autor"/>
      </rdf:Bag>
    </g:autors>
  </xsl:template>

  <xsl:template match="guiao:autor">
    <rdf:li dc:creator="{node()}"/>
  </xsl:template>

  <xsl:template match="guiao:personagens">
    <g:characters>
      <rdf:Bag>
        <xsl:apply-templates select="tipo:personagem"/>
      </rdf:Bag>
    </g:characters>
  </xsl:template>

  <!-- Questionar acerca da utilização do FOAF -->
  <xsl:template match="tipo:personagem">
    <rdf:li foaf:Person="{node()}" dc:identifier="{@id}" dc:description="{@descricao}"/>
  </xsl:template>

  <xsl:template match="guiao:aderecos">
    <g:props>
      <rdf:Bag>
        <xsl:apply-templates select="tipo:adereco"/>
      </rdf:Bag>
    </g:props>
  </xsl:template>

  <xsl:template match="tipo:adereco">
    <rdf:li g:prop="{node()}" dc:identifier="{@id}"/>
  </xsl:template>

</xsl:stylesheet>

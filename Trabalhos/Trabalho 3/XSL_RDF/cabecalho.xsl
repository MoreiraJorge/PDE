<?xml version="1.0" encoding="utf-8"?> 
<xsl:stylesheet xmlns:guiao="urn:guiao" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
  xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:foaf="http://xmlns.com/foaf/0.1/"
  xmlns:g="http://www.dc.fc.up.pt/T3/" xmlns:tipo="urn:tipo" version="1.0">

  <xsl:template match="guiao:autores">
    <g:Autores>
      <rdf:Description>
        <rdf:type rdf:resource="Autores"/>
        <g:Lista>
          <rdf:Seq>
            <xsl:apply-templates select="guiao:autor"/>
          </rdf:Seq>
        </g:Lista>
      </rdf:Description>
    </g:Autores>
  </xsl:template>

  <xsl:template match="guiao:autor">
    <rdf:li dc:creator="{node()}"/>
  </xsl:template>

  <xsl:template match="guiao:personagens">
    <g:Personagens>
      <rdf:Description>
        <rdf:type rdf:resource="Personagens"/>
        <g:Lista>
          <rdf:Seq>
            <xsl:apply-templates select="tipo:personagem"/>
          </rdf:Seq>
        </g:Lista>
      </rdf:Description>
    </g:Personagens>
  </xsl:template>

  <!-- Questionar acerca da utilização do FOAF -->
  <xsl:template match="tipo:personagem">
    <rdf:li foaf:Person="{node()}" dc:identifier="{@id}" dc:description="{@descricao}"/>
  </xsl:template>

  <xsl:template match="guiao:aderecos">
    <g:Aderecos>
      <rdf:Description>
        <rdf:type rdf:resource="Aderecos"/>
        <g:Lista>
          <rdf:Seq>
            <xsl:apply-templates select="tipo:adereco"/>
          </rdf:Seq>
        </g:Lista>
      </rdf:Description>
    </g:Aderecos>
  </xsl:template>

  <xsl:template match="tipo:adereco">
    <rdf:li g:prop="{node()}" dc:identifier="{@id}"/>
  </xsl:template>

</xsl:stylesheet>

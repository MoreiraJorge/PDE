<?xml version="1.0" encoding="utf-8"?> 
<xsl:stylesheet xmlns:guiao="urn:guiao" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
  xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:foaf="http://xmlns.com/foaf/0.1/"
  xmlns:g="http://www.dc.fc.up.pt/T3/" version="1.0">

  <xsl:output method="xml" indent="yes"/>

  <xsl:include href="cabecalho.xsl"/>
  <xsl:include href="indice.xsl"/>

  <xsl:template match="guiao:guiao">
    <rdf:RDF xml:base="http://www.dc.fc.up.pt/T3/">
      <rdf:Description dc:date="{guiao:cabecalho/@data}" dc:title="{guiao:cabecalho/guiao:titulo}"
        g:sinopse="{guiao:cabecalho/guiao:sinopse}" rdf:about="Guiao_{@id}">
        <rdf:type rdf:resource="Guiao"/>
        <xsl:apply-templates select="guiao:cabecalho/guiao:autores"/>
        <xsl:apply-templates select="guiao:cabecalho/guiao:personagens"/>
        <xsl:apply-templates select="guiao:cabecalho/guiao:aderecos"/>
        <xsl:apply-templates select="guiao:conteudo" mode="index"/>
      </rdf:Description>
    </rdf:RDF>
  </xsl:template>

</xsl:stylesheet>

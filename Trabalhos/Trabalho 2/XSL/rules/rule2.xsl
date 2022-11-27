<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:guiao="urn:guiao" xmlns:hierarquia="urn:hierarquia"
  xmlns:tipo="urn:tipo" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:key name="id" match="hierarquia:refere" use="@ref-personagem"/>
  <xsl:key name="id" match="hierarquia:fala" use="@ref-personagem"/>

  <!-- Rule to validate if all characters are used -->
  <xsl:template match="//guiao:personagens | //hierarquia:personagens" mode="validate-existances">
    <xsl:apply-templates mode="validate-existance"/>
  </xsl:template>

  <xsl:template match="tipo:personagem" mode="validate-existance">
    <xsl:if test="not(key('id', @id))">
      <xsl:message terminate="no">A personagem <xsl:value-of select="@id"/> não está referênciada ao longo do documento.</xsl:message>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>

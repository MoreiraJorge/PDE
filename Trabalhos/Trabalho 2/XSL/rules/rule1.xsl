<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:hierarquia="urn:hierarquia" xmlns:tipo="urn:tipo"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Rule to validate if references IDREF's to xml entities match -->
  <xsl:template match="//hierarquia:cena" mode="validate-references">
    <xsl:apply-templates select="hierarquia:fala | hierarquia:refere | hierarquia:adereco"
      mode="validate-references"/>
  </xsl:template>

  <xsl:template match="hierarquia:fala" mode="validate-references">
    <xsl:if test="not(local-name(key('ref-personagem', @ref-personagem)) = 'personagem')">
      <xsl:message terminate="no">O elemento fala contém uma referência inválida para uma personagem ( ref-personagem = "<xsl:value-of select="@ref-personagem"/>" ).</xsl:message>
    </xsl:if>
    <xsl:apply-templates select="hierarquia:refere | hierarquia:adereco" mode="validate-references"
    />
  </xsl:template>

  <xsl:template match="hierarquia:refere" mode="validate-references">
    <xsl:if test="not(local-name(key('ref-personagem', @ref-personagem)) = 'personagem')">
      <xsl:message terminate="no">O elemento refere contém uma referência inválida para uma personagem ( ref-personagem = "<xsl:value-of select="@ref-personagem"/>" ).</xsl:message>
    </xsl:if>
  </xsl:template>

  <xsl:template match="hierarquia:adereco" mode="validate-references">
    <xsl:if test="not(local-name(key('ref-adereco', @ref-adereco)) = 'adereco')">
      <xsl:message terminate="no">O elemento adereco contém uma referência inválida para um adereço ( ref-adereco = "<xsl:value-of select="@ref-adereco"/>" ).</xsl:message>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:hierarquia="urn:hierarquia" xmlns:tipo="urn:tipo"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <!-- Rule to validate if references IDREF's to xml entities match -->
  <xsl:template match="//personagens" mode="validate-existances">
    <xsl:apply-templates mode="validate-existances"/>
  </xsl:template>

  <xsl:template match="tipo:personagem" mode="validate-existances">
    <xsl:if test="not(local-name(key('ref-personagem', @ref-personagem)) = 'personagem')">
      <xsl:message terminate="no">O elemento refere na cena número contém uma referência inválida
        para uma personagem ( ref-personagem = "<xsl:value-of select="@ref-personagem"/>"
        ).</xsl:message>
    </xsl:if>
  </xsl:template>

  <!-- <xsl:template match="hierarquia:adereco" mode="validate-existances">
    <xsl:if test="not(local-name(key('ref-adereco', @ref-adereco)) = 'adereco')">
      <xsl:message terminate="no">O elemento adereco na cena número contém uma referência inválida
        para um adereço ( ref-adereco = "<xsl:value-of select="@ref-adereco"/>" ).</xsl:message>
    </xsl:if>
  </xsl:template> -->

</xsl:stylesheet>

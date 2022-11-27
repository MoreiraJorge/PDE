<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:guiao="urn:guiao" xmlns:hierarquia="urn:hierarquia" xmlns:tipo="urn:tipo"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" version="4.01" encoding="UTF-8" indent="yes"/>
    <xsl:include href="indice.xsl"/>
    <xsl:include href="corpo.xsl"/>
    <xsl:include href="utils.xsl"/>
    <xsl:include href="rules/rule1.xsl"/>
    <xsl:include href="rules/rule2.xsl"/>

    <xsl:key name="ref-personagem" match="tipo:personagem" use="@id"/>
    <xsl:key name="ref-adereco" match="tipo:adereco" use="@id"/>

    <xsl:template match="guiao:guiao">
        <xsl:apply-templates select="//hierarquia:cena" mode="validate-references"/>
        <!--<xsl:apply-templates select="./node()" mode="validate-existances"/> -->

        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="page.css"/>
                <title>Trabalho 2</title>
            </head>
            <body>
                <div class="book">
                    <div class="page">
                        <div class="subpage">
                            <xsl:apply-templates select="guiao:cabecalho" mode="capa"/>
                        </div>
                    </div>
                    <div class="page">
                        <div class="subpage">
                            <xsl:apply-templates select="guiao:conteudo/*" mode="indice">
                                <xsl:with-param name="depth" select="1"/>
                            </xsl:apply-templates>
                        </div>
                    </div>
                    <div class="page">
                        <div class="subpage">
                            <h2 class="title">Contexto</h2>
                            <h3>Sinopse</h3>
                            <blockquote>
                                <xsl:value-of select="guiao:cabecalho/guiao:sinopse"/>
                            </blockquote>
                            <xsl:apply-templates select="guiao:cabecalho"
                                mode="personagens-aderecos">
                                <xsl:with-param name="path">.</xsl:with-param>
                            </xsl:apply-templates>
                        </div>
                    </div>
                    <div>
                        <xsl:apply-templates select="guiao:conteudo" mode="corpo">
                            <xsl:with-param name="depth" select="1"/>
                        </xsl:apply-templates>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="guiao:cabecalho" mode="capa">
        <h1>
            <xsl:value-of select="guiao:titulo"/>
        </h1>
        <p>Data: <xsl:value-of select="@data"/></p>
        <h2>Autores</h2>
        <ul>
            <xsl:for-each select="guiao:autores/guiao:autor">
                <li>
                    <xsl:value-of select="node()"/>
                </li>
            </xsl:for-each>
        </ul>
        <blockquote>
            <xsl:value-of select="guiao:sinopse"/>
        </blockquote>
    </xsl:template>

</xsl:stylesheet>

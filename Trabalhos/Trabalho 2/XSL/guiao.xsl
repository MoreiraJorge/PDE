<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" version="4.01" encoding="UTF-8"/>

    <xsl:template match="guiao">
        <html>
            <head>
                <title>Trabalho 2</title>
            </head>
            <body>
                <xsl:apply-templates select="cabecalho"/>
                <xsl:apply-templates select="conteudo"/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="cabecalho">
        <h1><xsl:value-of select="titulo"/></h1>
        <p>Data: <xsl:value-of select="@data"/></p>
        <h2>Autores</h2>
        <ul>
            <xsl:for-each select="autores/autor">
                <li><xsl:value-of select="node()"/></li>
            </xsl:for-each>
        </ul>
        <blockquote>
            <xsl:value-of select="sinopse"/>
        </blockquote>
    </xsl:template>
    
    <xsl:template match="conteudo">
        <xsl:for-each select="descendant::*">
            <xsl:choose>
                <xsl:when test="name(.) = 'temporada'">
                    <h1><xsl:value-of select="name(.)"/> <xsl:value-of select="@num-temporada"/></h1>
                </xsl:when>
                <xsl:when test="name(.) = 'episodio'">
                    <h2><xsl:value-of select="name(.)"/> <xsl:value-of select="@num-episodio"/></h2>
                </xsl:when>
                <xsl:when test="name(.) = 'cena'">
                    <h3><xsl:value-of select="name(.)"/> <xsl:value-of select="@num-cena"/></h3>
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>

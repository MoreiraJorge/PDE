<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:guiao="urn:guiao" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:hierarquia="urn:hierarquia" xmlns:tipo="urn:tipo" version="1.0">
    <xsl:include href="cena.xsl"/>

    <xsl:template match="guiao:conteudo" mode="corpo">
        <xsl:param name="depth"/>

        <xsl:apply-templates select="hierarquia:temporada" mode="corpo">
            <xsl:with-param name="depth" select="$depth"/>
        </xsl:apply-templates>

        <xsl:apply-templates select="hierarquia:parte" mode="corpo">
            <xsl:with-param name="depth" select="$depth"/>
        </xsl:apply-templates>

        <xsl:apply-templates select="hierarquia:cena" mode="corpo">
            <xsl:with-param name="depth" select="$depth"/>
        </xsl:apply-templates>

    </xsl:template>

    <xsl:template match="hierarquia:temporada" mode="corpo">
        <xsl:param name="depth"/>
        <div class="page">
            <div class="subpage">
                <a name="{generate-id()}">
                    <xsl:element name="h{$depth}"> Temporada <xsl:number format="1"/>
                    </xsl:element>
                </a>
                <xsl:apply-templates select="hierarquia:personagens"/>
                <xsl:apply-templates select="hierarquia:episodio" mode="corpo">
                    <xsl:with-param name="depth" select="$depth + 1"/>
                </xsl:apply-templates>
            </div>
        </div>
    </xsl:template>

    <xsl:template match="hierarquia:episodio" mode="corpo">
        <xsl:param name="depth"/>
        <a name="{generate-id()}">
            <xsl:element name="h{$depth}"> Episódio <xsl:number format="1"/></xsl:element>
        </a>
        <xsl:apply-templates select="hierarquia:personagens"/>
        <xsl:apply-templates select="hierarquia:cena" mode="corpo">
            <xsl:with-param name="depth" select="$depth + 1"/>
        </xsl:apply-templates>
    </xsl:template>

    <xsl:template match="hierarquia:personagens">
        <table class="context-table">
            <tr>
                <th>Personagens</th>
            </tr>
            <tr>
                <td class="table-column">
                    <xsl:for-each select="tipo:personagem">
                        <p>
                            <xsl:value-of select="self::node()"/>
                        </p>
                    </xsl:for-each>
                </td>
            </tr>
        </table>
    </xsl:template>

    <xsl:template match="hierarquia:parte" mode="corpo">
        <xsl:param name="depth"/>
        <div class="page">
            <div class="subpage">
                <a name="{generate-id()}">
                    <xsl:element name="h{$depth}"> Parte <xsl:number format="1"/>
                    </xsl:element>
                </a>
                <xsl:apply-templates select="hierarquia:personagens"/>
                <xsl:apply-templates select="hierarquia:cena" mode="corpo">
                    <xsl:with-param name="depth" select="$depth + 1"/>
                </xsl:apply-templates>
            </div>
        </div>
    </xsl:template>

</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:guiao="urn:guiao" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:hierarquia="urn:hierarquia" xmlns:tipo="urn:tipo" version="1.0">

    <xsl:key name="personagem-tipo" match="tipo:personagem/text()" use="."/>
    <xsl:key name="adereco-tipo" match="tipo:adereco/text()" use="."/>

    <xsl:template match="guiao:cabecalho" mode="personagens-aderecos">
        <table class="context-table">
            <tr>
                <th>Personagens</th>
                <th>Adereços</th>
            </tr>
            <tr>
                <td class="table-column">
                    <xsl:for-each select="//tipo:personagem">
                        <p>
                            <xsl:value-of select="self::node()"/>
                        </p>
                    </xsl:for-each>
                </td>
                <td class="table-column">
                    <xsl:for-each select="//tipo:adereco">
                        <p>
                            <xsl:value-of select="self::node()"/>
                        </p>
                    </xsl:for-each>
                </td>
            </tr>
        </table>
    </xsl:template>

    <xsl:template match="hierarquia:cena" mode="personagens-aderecos-cena">

        <table class="context-table">
            <tr>
                <th>Personagens</th>
                <th>Adereços</th>
            </tr>
            <tr>
                <td class="table-column">
                    <xsl:for-each
                        select="(hierarquia:refere | hierarquia:fala | hierarquia:fala/hierarquia:refere)/key('ref-personagem', @ref-personagem)/text()[generate-id() = generate-id(key('personagem-tipo', .)[1])]">
                        <p>
                            <xsl:value-of select="."/>
                        </p>
                    </xsl:for-each>
                </td>
                <td class="table-column">
                    <xsl:for-each
                        select="(hierarquia:adereco | hierarquia:fala/hierarquia:adereco)/key('ref-adereco', @ref-adereco)/text()[generate-id() = generate-id(key('adereco-tipo', .)[1])]">
                        <p>
                            <xsl:value-of select="."/>
                        </p>
                    </xsl:for-each>
                </td>
            </tr>
        </table>
    </xsl:template>
</xsl:stylesheet>

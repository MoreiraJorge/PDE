<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:guiao="urn:guiao" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tipo="urn:tipo" version="1.0">

    <xsl:template match="guiao:cabecalho" mode="personagens-aderecos">
        <table class="context-table">
            <tr>
                <th>Personagens</th>
                <th>Adereços</th>
            </tr>
            <tr>
                <td class="table-column">
                    <xsl:for-each select="guiao:personagens/tipo:personagem">
                        <p>
                            <xsl:value-of select="self::node()"/>
                        </p>
                    </xsl:for-each>
                </td>
                <td class="table-column">
                    <xsl:for-each select="guiao:aderecos/tipo:adereco">
                        <p>
                            <xsl:value-of select="self::node()"/>
                        </p>
                    </xsl:for-each>
                </td>
            </tr>

        </table>
    </xsl:template>

</xsl:stylesheet>

﻿<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
                >
    <xsl:output method="xml" indent="yes"/>
    <xsl:include href="../CommonXsltTemplates.xslt"/>
    <xsl:param name="output-filename" select="'output.txt'" />

    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="/">
        <FileSet>
            <FileSetFiles>
                <FileSetFile>
                    <RelativePath>
                        <xsl:text>single-source-of-truth.xml</xsl:text>
                    </RelativePath>
                    <xsl:element name="FileContents" xml:space="preserve">
    <xsl:apply-templates select="*">
    
    </xsl:apply-templates>
</xsl:element>
                </FileSetFile>
            </FileSetFiles>
        </FileSet>
    </xsl:template>
    <xsl:variable name="data1">
        <xsl:call-template name="parse-input-text">
            <xsl:with-param name="text" select="//InputText" />
        </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="data" select="msxsl:node-set($data1)" />

    <xsl:template match="/*">
        <rock-paper-scissors>
            <name>
                <xsl:for-each select="$data/shapes/shape">
                    <xsl:value-of select="." /><xsl:if test="position() &lt; last()">, </xsl:if>
                </xsl:for-each>
            </name>
            <rules>
                <xsl:for-each select="$data/shapes/shape">
                    <xsl:variable name="index" select="position()" />
                <shapes>
                    <name>
                        <xsl:value-of select="."/>
                    </name>
                    <opp_code>
                        <xsl:value-of select="$data/opponent_codes/opponent_code[$index]"/>
                    </opp_code>
                    <player_code>
                        <xsl:value-of select="$data/player_codes/player_code[$index]"/>
                    </player_code>
                    <wins_against>
                        <xsl:value-of select="$data/wins_againsts/wins_against[$index]"/>
                    </wins_against>
                    <score>
                        <xsl:value-of select="$data/shape_scores/shape_score[$index]"/>
                    </score>
                </shapes>
                </xsl:for-each>
                <outcomes>
                    <win><xsl:value-of select="$data/win_lose_draws/win_lose_draw[1]"/></win>
                    <loss><xsl:value-of select="$data/win_lose_draws/win_lose_draw[2]"/></loss>
                    <draw><xsl:value-of select="$data/win_lose_draws/win_lose_draw[3]"/></draw>
                </outcomes>
            </rules>
        </rock-paper-scissors>
    </xsl:template>

    <xsl:template name="parse-input-text">
        <xsl:param name="text"/>
        <xsl:param name="step" select="1"/>       
        <xsl:variable name="extracted-text" select="substring-before(substring-after($text, '('), ')')"/>
        <xsl:variable name="element-name">
            <xsl:choose>
                <xsl:when test="$step = 1">shape</xsl:when>
                <xsl:when test="$step = 2">player_code</xsl:when>
                <xsl:when test="$step = 3">opponent_code</xsl:when>
                <xsl:when test="$step = 4">shape_score</xsl:when>
                <xsl:when test="$step = 5">wins_against</xsl:when>
                <xsl:when test="$step = 6">win_lose_draw</xsl:when>
            </xsl:choose>
        </xsl:variable>
        <xsl:element name="{$element-name}s">
            <xsl:call-template name="split-on-commas">
                <xsl:with-param name="values" select="$extracted-text" />
                <xsl:with-param name="element-name" select="$element-name" />
            </xsl:call-template>
        </xsl:element>

        <xsl:if test="$step &lt; 6">
            <xsl:call-template name="parse-input-text">
                <xsl:with-param name="text" select="substring-after($text, ')')" />
                <xsl:with-param name="step" select="$step + 1" />
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <xsl:template name="split-on-commas">
        <xsl:param name="values" />
        <xsl:param name="element-name" select="'item'" />
        <xsl:variable name="delimiter" select="', '" />
        <xsl:choose>
            <xsl:when test="contains($values, $delimiter)">
                <xsl:element name="{$element-name}">
                    <xsl:value-of select="substring-before($values, $delimiter)" />
                </xsl:element>
                <xsl:call-template name="split-on-commas">
                    <xsl:with-param name="values" select="substring-after($values, $delimiter)" />
                    <xsl:with-param name="element-name" select="$element-name" />
                    <xsl:with-param name="delimiter" select="$delimiter" />
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="{$element-name}">
                    <xsl:choose>
                        <xsl:when test="string-length(substring-after($values, 'and ')) > 0">
                            <xsl:value-of select="substring-after($values, 'and ')"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$values" />
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>


</xsl:stylesheet>

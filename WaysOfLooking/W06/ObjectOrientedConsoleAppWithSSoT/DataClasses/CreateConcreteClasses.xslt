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

    <xsl:template match="/*">
        <FileSet>
            <FileSetFiles>
                <xsl:for-each select="//shapes">
                <FileSetFile>
                    <RelativePath>
                        <xsl:value-of select="name"/>
                        <xsl:text>.cs</xsl:text>
                    </RelativePath>
                    <xsl:element name="FileContents" xml:space="preserve">
namespace TWOLAT.RPS.Lib
{
    public class <xsl:value-of select="name" /> : Shape
    {
        public override int Score => <xsl:value-of select="score" />;
        public override char OppCode => '<xsl:value-of select="opp_code" />';
        public override char PlayerCode => '<xsl:value-of select="player_code" />';
        public override char WinsAgainst => '<xsl:value-of select="wins_against" />';

        public <xsl:value-of select="name" />() : base("<xsl:value-of select="name" />") { }
    }
}

</xsl:element>
                </FileSetFile>
                    <OverwriteMode>Never</OverwriteMode>
                </xsl:for-each>
                <FileSetFile>
                    <RelativePath>CoreLibraryExtensions.designer.cs</RelativePath>
                    <FileContents>
namespace TWOLAT.RPS.Lib
{
    public static partial class CoreLibraryExtensions 
    {
        public static Shape CreateShape(this Game game, char code)
        {
            switch (code)
            {<xsl:for-each select="//shapes">
                case '<xsl:value-of select="opp_code"/>':
                case '<xsl:value-of select="player_code"/>':
                    return new <xsl:value-of select="name"/>();</xsl:for-each>
                default:
                    throw new ArgumentException("Invalid shape code");
            }
        }     
        
        public static void AddSampleGame(this Game game)
        {<xsl:for-each select="//games/rounds">
            game.Games_GameRounds.Add(new GameRound('<xsl:value-of select="player_code"/>', '<xsl:value-of select="opp_code"/>'));<xsl:text></xsl:text>
            <xsl:text>// </xsl:text><xsl:value-of select="result" />
            <xsl:text>: </xsl:text>
            <xsl:value-of select="//shapes[player_code=current()/player_code]/name" /> vs. <xsl:value-of select="//shapes[opp_code=current()/opp_code]/name" /> 
    </xsl:for-each>
        }
    }

    public partial class Outcome
    {
        public static int WinScore { get => <xsl:value-of select="//outcomes/win"/>; }
        public static int LossScore { get => <xsl:value-of select="//outcomes/loss"/>; }
        public static int DrawScore { get => <xsl:value-of select="//outcomes/draw"/>; }
    }            
}</FileContents>                   
                </FileSetFile>                
            </FileSetFiles>
        </FileSet>
    </xsl:template>
</xsl:stylesheet>

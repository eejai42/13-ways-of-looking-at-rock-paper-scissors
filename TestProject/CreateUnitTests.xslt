<?xml version="1.0" encoding="utf-8"?>
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
                <xsl:for-each select="//WaysOfLooking">
                    <FileSetFile>
                        <RelativePath>
                            <xsl:value-of select="Directory" />
                            <xsl:text>Tests.cs</xsl:text>
                        </RelativePath>
                        <xsl:element name="FileContents" xml:space="preserve">namespace TestProject
{
    public class <xsl:value-of select="Directory" />Tests : SharedTests
    {
        public override void Setup()
        {
            base.Setup();
        }

<xsl:if test="RelativePathToFish">
        [Test]
        public void TestConcreteFish()
        {
            var result = this.Invoke(@"/<xsl:value-of select="Directory" /><xsl:value-of select="RelativePathToFish" />");
            Assert.That(result, Is.EqualTo(this.ExpectedOutput));
        }</xsl:if>

<xsl:if test="RelativePathToFish">
        [Test]
        public void TestDynamicFish()
        {            
        
            var result = this.Invoke(@"/<xsl:value-of select="Directory" /><xsl:value-of select="RelativePathToDynamicFish" />");
            Assert.That(result, Is.EqualTo(this.ExpectedOutput));
        }</xsl:if>

<xsl:if test="RelativePathToDynamicFish">
        [Test]
        public void TestFishingPole()
        {            
            var result = this.Invoke(@"/<xsl:value-of select="Directory" /><xsl:value-of select="RelativePathToFishingPole" />");
            Assert.That(result, Is.EqualTo(this.ExpectedOutput));
        }</xsl:if>
    }
}
</xsl:element>
                    </FileSetFile>
                </xsl:for-each>
            </FileSetFiles>
        </FileSet>
    </xsl:template>
</xsl:stylesheet>

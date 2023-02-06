<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" />
    <xsl:template match="/">
        <FileSet>
            <FileSetFiles>
                <FileSetFile>
                    <RelativePath>../../../docs/README-10-Korean.md</RelativePath>
                    <xsl:element name="FileContents" xml:space="default">
                        <xsl:text># </xsl:text>
                        <xsl:value-of select="*/name"/>
                        <xsl:text>
엘프들이 해안에서 캠핑장을 지을 준비를 시작합니다. 스낵 캠핑장과 가까운 텐트를 결정하기 위해, 이미 커다란
</xsl:text>
                        <xsl:value-of select="/name"/>
                        <xsl:text xml:space="preserve">-토너먼트가 열리고 있습니다.

</xsl:text>
                        <xsl:value-of select="*/name"/>
                        <xsl:text> 두 선수 간의 게임입니다. 게임은 많은 라운드로 구성됩니다. 각 라운드에서 선수들은 한가지 
</xsl:text>
                        <xsl:for-each select="//shapes">
                            <xsl:if test="position() > 1">
                                <xsl:text>,</xsl:text>
                            </xsl:if>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="name"/>
                        </xsl:for-each>
                        <xsl:text>&#32; 형태를 손형태로 선택합니다. 그런 다음 이 라운드의 승자가 선택됩니다:
</xsl:text>
                        <xsl:for-each select="//shapes">
                            <xsl:if test="position() > 1">
                                <xsl:text>,</xsl:text>
                            </xsl:if>
                            <xsl:value-of select="name"/>
                            <xsl:text>&#32; 승리 </xsl:text>
                            <xsl:value-of select="//shapes[opp_code=current()/wins_against]/name"/>
                        </xsl:for-each>
                        <xsl:text>. 두 선수가 동일한 형태를 선택하면, 라운드는 무승부로 끝납니다. </xsl:text>
                        <xsl:apply-templates select="*/rules"/>
                    </xsl:element>
                    <OverwriteMode>Always</OverwriteMode>
                </FileSetFile>
            </FileSetFiles>
        </FileSet>
    </xsl:template>


    <xsl:template match="rules">
        <xsl:text>
</xsl:text>
        <xsl:text>
## 형태와 결과

있습니다 </xsl:text>
        <xsl:value-of select="count(shapes)"/>
        <xsl:text> 형태. 이것들은:
</xsl:text>

        <xsl:apply-templates select="shapes"/>
        <xsl:apply-templates select="outcomes"/>
        <xsl:text>&#32;## 규칙 

어제 도움을 주셔서 고맙습니다, 엘프가 암호화된 전략 지침 (그의 퍼즐 입력 날짜)을 줍니다. 이것이 승리하는 데 도움이 된다고 말합니다. "첫 번째 열은 그의 상대가 플레이 할 것이고, 두 번째 열은 당신이 대답할 것이라고 합니다.
</xsl:text>
        <xsl:for-each select="//shapes">
            <xsl:if test="position() > 1">
                <xsl:text>,</xsl:text>
            </xsl:if>
            <xsl:text> </xsl:text>
            <xsl:value-of select="opp_code"/>
            <xsl:text> 대하여 </xsl:text>
            <xsl:value-of select="name"/>
        </xsl:for-each>
        <xsl:text> 당신은 적당히 선택되어야합니다.</xsl:text>
        <xsl:for-each select="//shapes">
            <xsl:text> </xsl:text>
            <xsl:value-of select="player_code"/>
            <xsl:text> 대하여 </xsl:text>
            <xsl:value-of select="name"/>
            <xsl:text>,</xsl:text>
        </xsl:for-each>
        <xsl:text> 항상 이기는 것은 의심스러운 것이므로

전체 토너먼트의 승자는 가장 높은 점수를 가진 플레이어입니다. 그들의 총 점수는 각 라운드에서의 점수의 합입니다. 한 라운드의 점수는 선택한 형태 (</xsl:text>
        <xsl:for-each select="shapes">
            <xsl:if test="position() > 1">
                <xsl:text>,</xsl:text>
            </xsl:if>
            <xsl:value-of select="name"/>
            <xsl:text> = </xsl:text>
            <xsl:value-of select="score"/>
        </xsl:for-each>
        <xsl:text>) 결과의 점수 (</xsl:text>
        <xsl:for-each select="outcomes/*">
            <xsl:if test="position() > 1">
                <xsl:text>,</xsl:text>
            </xsl:if>
            <xsl:value-of select="name()"/>
            <xsl:text>&#32;=&#32;</xsl:text>
            <xsl:value-of select="."/>
        </xsl:for-each>
        <xsl:text>).

엘프가 당신을 도우기 위해서인지 헛되이 하기 위해서인지를 확신할 수 없기 때문에, 전략 지침에 따르면 얻을 수있는 점수를 계산해야합니다.

</xsl:text>
        <xsl:apply-templates select="games"/>
    </xsl:template>
    
    
    
    
    
    
   
    <xsl:template match="shapes">
        <xsl:text> - </xsl:text>
        <xsl:value-of select="name"/>
        <xsl:text> (경쟁자 코드: `</xsl:text>
        <xsl:value-of select="opp_code"/>
        <xsl:text>`, 플레이어 코드: `</xsl:text>
        <xsl:value-of select="player_code"/>
        <xsl:text>`, 승리: `</xsl:text>
        <xsl:value-of select="//shapes[opp_code = current()/wins_against]/name"/>
        <xsl:text>`, 점수: </xsl:text>
        <xsl:value-of select="score"/>
        <xsl:text>), </xsl:text>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>


    <xsl:template match="outcomes">
        <xsl:text>
## 결과 평가: </xsl:text>
        <xsl:text>
- 승리: </xsl:text>
        <xsl:value-of select="win"/>
        <xsl:text>
-  패배:</xsl:text>
        <xsl:value-of select="loss"/>
        <xsl:text>
- 무승부: </xsl:text>
        <xsl:value-of select="draw"/>
        <xsl:text xml:space="preserve">
</xsl:text>
    </xsl:template>

    <xsl:template match="games">
        <xsl:text>&#10;### </xsl:text>
        <xsl:value-of select="name"/>
        <xsl:text>
요정이 당신을 도우기 위해서인지, 허위로 당신을 현혹하기 위해서인지 확신할 수 없기 때문에, 전략 지침에 따르면 어떤 평가를 받을지 계산해야 합니다.

</xsl:text>
        <xsl:text>```
</xsl:text>
        <xsl:for-each select="//rounds">
            <xsl:value-of select="opp_code"/>
            <xsl:text>&#32;</xsl:text>
            <xsl:value-of select="player_code"/>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each>
        <xsl:text>```
</xsl:text>
        <xsl:text>예를 들어, 다음과 같은 전략 지침이 주어졌다고 가정합시다:

</xsl:text>
        <xsl:for-each select="rounds">
            <xsl:text>- 이 전략 지침은 다음을 예측하고 추천합니다 경쟁자가 선택한:  </xsl:text>
            <xsl:value-of select="//shapes[opp_code=current()/opp_code]/name"/>
            <xsl:text> (코드 </xsl:text>
            <xsl:value-of select="opp_code"/>
            <xsl:text>), 플레이어가 선택한 </xsl:text>
            <xsl:value-of select="//shapes[player_code=current()/player_code]/name"/>
            <xsl:text> (코드 </xsl:text>
            <xsl:value-of select="player_code"/>
            <xsl:text>)</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>라운드는 </xsl:text>
            <xsl:value-of select="result"/>
            <xsl:text>, 였고, 점수는 </xsl:text>
            <xsl:value-of select="score"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>      선택 점수: </xsl:text>
            <xsl:value-of select="choice_score"/>
            <xsl:text>, 결과 점수: </xsl:text>
            <xsl:value-of select="outcome_score"/>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each>
        <xsl:text>최종 점수는: </xsl:text>
        <xsl:value-of select="sum(//games/rounds/score)"/>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>

</xsl:stylesheet>
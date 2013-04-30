<?xml version="1.0" ?>

<!--
  Citation style for Microsoft Word 2010
  
  Author: Christof Heymann 
  
  This citation style is close to LNI GI (Gesellschaft fuer Informatik), IEEE and LNCS.
  Feel free to edit and share.
  
  License: CC BY-NC 3.0 US / DE
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:b="http://schemas.openxmlformats.org/officeDocument/2006/bibliography">

<xsl:output method="html" encoding="us-ascii"/>

<xsl:template match="/">

<xsl:apply-templates select="*" />

</xsl:template>

<xsl:template match="b:version">
  <xsl:text>2013.04.26</xsl:text>
</xsl:template>

<xsl:template match="b:StyleName">
  <xsl:text>GOFL First Edition</xsl:text>
</xsl:template>

<!-- book -->
<!-- important book fields -->
<xsl:template match="b:GetImportantFields[b:SourceType = 'Book']">
  <b:ImportantFields>
    <b:ImportantField>
      <xsl:text>b:Author/b:Author/b:NameList</xsl:text>
    </b:ImportantField>

    <b:ImportantField>
      <xsl:text>b:Title</xsl:text>
    </b:ImportantField>
    
    <b:ImportantField>
      <xsl:text>b:Year</xsl:text>
    </b:ImportantField>
    
    <b:ImportantField>
      <xsl:text>b:City</xsl:text>
    </b:ImportantField>
    
    <b:ImportantField>
      <xsl:text>b:Publisher</xsl:text>
    </b:ImportantField>
    
    <b:ImportantField>
      <xsl:text>b:Edition</xsl:text>
    </b:ImportantField>
    
  </b:ImportantFields>
</xsl:template>

<!-- book template -->
<xsl:template match="b:Source[b:SourceType = 'Book']">
  <tr>  
    <td style="vertical-align:top; padding-bottom:15px; width:25%;">
      <xsl:choose>
        <xsl:when test="count(b:Author/b:Author/b:Corporate) = 1">
          <xsl:text>[</xsl:text>
          <xsl:value-of select="substring(b:Author/b:Author/b:Corporate, 1, 2)" />
          <xsl:choose>
            <xsl:when test="string-length(b:Year) = 5">
              <xsl:value-of select="substring(b:Year, 3, 3)" />
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="substring(b:Year, 3, 2)" />
            </xsl:otherwise>
          </xsl:choose>
          <xsl:text>]</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="format-author" />
        </xsl:otherwise>
      </xsl:choose>	  
    </td>
    <td style="vertical-align:top; padding-bottom:15px; width:75%;">
		<xsl:choose>
			<xsl:when test="count(b:Author/b:Author/b:Corporate) = 1">
			<span style="text-transform:uppercase">
				<xsl:value-of select="b:Author/b:Author/b:Corporate" />
      </span>
			<xsl:text>; </xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="b:Author/b:Author" mode="all" />
			</xsl:otherwise>
		</xsl:choose>   
      <i>
        <xsl:value-of select="b:Title" />
        <xsl:text>.</xsl:text>
      </i>
      <xsl:variable name="edition" select="b:Edition" />
      <xsl:choose>
        <xsl:when test="string-length($edition) &gt; 0">
          <xsl:text> </xsl:text>
          <xsl:value-of select="b:Edition" />
          <xsl:text> Auflage, </xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:text> </xsl:text>
        </xsl:otherwise>
      </xsl:choose>
      
      <xsl:value-of select="b:Publisher" />
      <xsl:text>, </xsl:text>
      <xsl:value-of select="b:City" />
      <xsl:text>, </xsl:text>
      <xsl:value-of select="substring(b:Year, 1, 4)" />
      <xsl:text>.</xsl:text>
    </td>
  </tr>
</xsl:template>

<!-- book section -->
<!-- book section important fields -->
<xsl:template match="b:GetImportantFields[b:SourceType = 'BookSection']">
  <b:ImportantFields>
    <b:ImportantField>
      <xsl:text>b:Author/b:Author/b:NameList</xsl:text>
    </b:ImportantField>
    <b:ImportantField>
      <xsl:text>b:Title</xsl:text>
    </b:ImportantField>
    <b:ImportantField>
      <xsl:text>b:Author/b:BookAuthor/b:NameList</xsl:text>  
    </b:ImportantField>
    <b:ImportantField>
      <xsl:text>b:BookTitle</xsl:text>  
    </b:ImportantField>
    <b:ImportantField>
      <xsl:text>b:Year</xsl:text>
    </b:ImportantField>
    <b:ImportantField>
      <xsl:text>b:Pages</xsl:text>
    </b:ImportantField>
    <b:ImportantField>
      <xsl:text>b:City</xsl:text>
    </b:ImportantField>
    <b:ImportantField>
      <xsl:text>b:Publisher</xsl:text>
    </b:ImportantField>
  </b:ImportantFields>
</xsl:template>

<!-- book section template -->
<xsl:template match="b:Source[b:SourceType = 'BookSection']">
  <tr>  
    <td style="vertical-align:top; padding-bottom:15px; width:25%;">
      <xsl:call-template name="format-author" />
    </td>
    <td style="vertical-align:top; padding-bottom:15px; width:75%;">
      <xsl:apply-templates select="b:Author/b:Author" mode="all" />
      <xsl:value-of select="b:Title" />
      <xsl:text>.</xsl:text>
      <xsl:text> In </xsl:text>
      <xsl:apply-templates select="b:Author/b:BookAuthor" mode="all" />
      <i>
        <xsl:value-of select="b:BookTitle" />
      </i>
      <xsl:text>. </xsl:text>
      <xsl:value-of select="b:Publisher" />
      <xsl:text>, </xsl:text>
      <xsl:value-of select="b:City" />
      <xsl:text>, </xsl:text>
      <xsl:value-of select="substring(b:Year, 1, 4)" />
      <xsl:text>; </xsl:text>
      <xsl:text>S. </xsl:text>
      <xsl:value-of select="b:Pages" />
      <xsl:text>.</xsl:text>
    </td>
  </tr>
</xsl:template>

<!-- journal article -->
<!-- journal article important fields -->
<xsl:template match="b:GetImportantFields[b:SourceType = 'JournalArticle']">
  <b:ImportantFields>
    <b:ImportantField>
      <xsl:text>b:Author/b:Author/b:NameList</xsl:text>
    </b:ImportantField>
    <b:ImportantField>
      <xsl:text>b:Title</xsl:text>
    </b:ImportantField>
    <b:ImportantField>
      <xsl:text>b:JournalName</xsl:text>
    </b:ImportantField>
    <b:ImportantField>
      <xsl:text>b:Publisher</xsl:text>
    </b:ImportantField>
    <b:ImportantField>
      <xsl:text>b:Year</xsl:text>
    </b:ImportantField>
    <b:ImportantField>
      <xsl:text>b:Month</xsl:text>
    </b:ImportantField>
    <b:ImportantField>
      <xsl:text>b:Issue</xsl:text>
    </b:ImportantField>
    <b:ImportantField>
      <xsl:text>b:Pages</xsl:text>
    </b:ImportantField>
    <!--
    <b:ImportantField>
      <xsl:text>b:City</xsl:text>
    </b:ImportantField>
    -->
  </b:ImportantFields>
</xsl:template>

<!-- journal article template -->
<xsl:template match="b:Source[b:SourceType = 'JournalArticle']">
  <tr>  
    <td style="vertical-align:top; padding-bottom:15px; width:25%;">
      <xsl:call-template name="format-author" />
    </td>
    <td style="vertical-align:top; padding-bottom:15px; width:75%;">
      <xsl:apply-templates select="b:Author/b:Author" mode="all" />
      <xsl:text>&quot;</xsl:text>
      <xsl:value-of select="b:Title" />
      <xsl:text>&quot;</xsl:text>
      <xsl:text>. </xsl:text>
      <i>
      <xsl:value-of select="b:JournalName" />
      </i>
      <xsl:if test="string-length(b:Issue) &gt; 0">
        <xsl:text> (</xsl:text>
        <xsl:value-of select="b:Issue" />
        <xsl:text>)</xsl:text>
      </xsl:if> 
      <xsl:if test="string-length(b:Publisher) &gt; 1">
        <xsl:value-of select="b:Publisher" />
      </xsl:if> 
      <!-- 
      <xsl:value-of select="b:City" />
      <xsl:text>, </xsl:text>
      -->
      <xsl:text>, </xsl:text>
      <xsl:value-of select="b:Month" />
      <xsl:text> </xsl:text>
      <xsl:value-of select="substring(b:Year, 1, 4)" />
      <xsl:text>; </xsl:text>
      <xsl:text>S. </xsl:text>
      <xsl:value-of select="b:Pages" />
      <xsl:text>.</xsl:text>
    </td>
  </tr>
</xsl:template>

<!-- article in a periodical-->
<!-- important fields -->
<xsl:template match="b:GetImportantFields[b:SourceType = 'ArticleInAPeriodical']">
  <b:ImportantFields>
    <b:ImportantField>
      <xsl:text>b:Author/b:Author/b:NameList</xsl:text>
    </b:ImportantField>
    <b:ImportantField>
      <xsl:text>b:Title</xsl:text>
    </b:ImportantField>
    <b:ImportantField>
      <xsl:text>b:PeriodicalTitle</xsl:text>
    </b:ImportantField>
     <b:ImportantField>
      <xsl:text>b:Year</xsl:text>
    </b:ImportantField>
     <b:ImportantField>
      <xsl:text>b:Month</xsl:text>
    </b:ImportantField>
    <b:ImportantField>
      <xsl:text>b:Pages</xsl:text>
    </b:ImportantField>
    <b:ImportantField>
      <xsl:text>b:Issue</xsl:text>
    </b:ImportantField>
  </b:ImportantFields>
</xsl:template>

<!-- article in a periodical template -->
<xsl:template match="b:Source[b:SourceType = 'ArticleInAPeriodical']">
  <tr>  
    <td style="vertical-align:top; padding-bottom:15px; width:25%;">
      <xsl:call-template name="format-author" />
    </td>
    <td style="vertical-align:top; padding-bottom:15px; width:75%;">
      <xsl:apply-templates select="b:Author/b:Author" mode="all" />
      <xsl:text>&quot;</xsl:text>
      <xsl:value-of select="b:Title" />
      <xsl:text>&quot;</xsl:text>
      <xsl:text>. </xsl:text>
      <i>
      <xsl:value-of select="b:PeriodicalTitle" />
      </i>
      <xsl:if test="string-length(b:Issue) &gt; 0">
        <xsl:text> (</xsl:text>
        <xsl:value-of select="b:Issue" />
        <xsl:text>)</xsl:text>
      </xsl:if> 
      <xsl:text>, </xsl:text>
      <xsl:value-of select="b:Month" />
      <xsl:text> </xsl:text>
      <xsl:value-of select="substring(b:Year, 1, 4)" />
      <xsl:text>; </xsl:text>
      <xsl:text>S. </xsl:text>
      <xsl:value-of select="b:Pages" />
      <xsl:text>.</xsl:text>
    </td>
  </tr>
</xsl:template>

<!-- conference proceedings -->
<!-- important fields -->
<xsl:template match="b:GetImportantFields[b:SourceType = 'ConferenceProceedings']">
  <b:ImportantFields>
    <b:ImportantField>
      <xsl:text>b:Author/b:Author/b:NameList</xsl:text>
    </b:ImportantField>
    <b:ImportantField>
      <xsl:text>b:Title</xsl:text>
    </b:ImportantField>
    <b:ImportantField>
      <xsl:text>b:Pages</xsl:text>
    </b:ImportantField>
    <b:ImportantField>
      <xsl:text>b:Year</xsl:text>
    </b:ImportantField>
    <b:ImportantField>
      <xsl:text>b:ConferenceName</xsl:text>
    </b:ImportantField>
    <b:ImportantField>
      <xsl:text>b:City</xsl:text>
    </b:ImportantField>
    <b:ImportantField>
      <xsl:text>b:Publisher</xsl:text>
    </b:ImportantField>
  </b:ImportantFields>
</xsl:template>

<!-- conference proceedings template -->
<xsl:template match="b:Source[b:SourceType = 'ConferenceProceedings']">
  <tr>  
    <td style="vertical-align:top; padding-bottom:15px; width:25%;">
      <xsl:call-template name="format-author" />
    </td>
    <td style="vertical-align:top; padding-bottom:15px; width:75%;">
      <xsl:apply-templates select="b:Author/b:Author" mode="all" />
      <xsl:text>&quot;</xsl:text>
      <xsl:value-of select="b:Title" />
      <xsl:text>&quot;</xsl:text>
      <xsl:text>. In </xsl:text>
      <i>
      <xsl:value-of select="b:ConferenceName" />
      </i>
      <xsl:text>, </xsl:text>
      <xsl:if test="string-length(b:Publisher) &gt; 1">
        <xsl:value-of select="b:Publisher" />
        <xsl:text>, </xsl:text>
      </xsl:if> 
      <xsl:value-of select="b:City" />
      <xsl:text>, </xsl:text>
      <xsl:value-of select="substring(b:Year, 1, 4)" />
      <xsl:text>; </xsl:text>
      <xsl:text>S. </xsl:text>
      <xsl:value-of select="b:Pages" />
      <xsl:text>.</xsl:text>
    </td>
  </tr>
</xsl:template>

<!-- report -->
<!-- important fields -->
<xsl:template match="b:GetImportantFields[b:SourceType = 'Report']">
  <b:ImportantFields>
    <b:ImportantField>
      <xsl:text>b:Author/b:Author/b:NameList</xsl:text>
    </b:ImportantField>
    <b:ImportantField>
      <xsl:text>b:Title</xsl:text>
    </b:ImportantField>
    <b:ImportantField>
      <xsl:text>b:Year</xsl:text>
    </b:ImportantField>
    <b:ImportantField>
      <xsl:text>b:Institution</xsl:text>
    </b:ImportantField>
    <b:ImportantField>
      <xsl:text>b:City</xsl:text>
    </b:ImportantField>
    <b:ImportantField>
      <xsl:text>b:ThesisType</xsl:text>
    </b:ImportantField>
    <b:ImportantField>
      <xsl:text>b:StandardNumber</xsl:text>
    </b:ImportantField>
  </b:ImportantFields>
</xsl:template>

<!-- report template -->
<xsl:template match="b:Source[b:SourceType = 'Report']">
  <tr>  
    <td style="vertical-align:top; padding-bottom:15px; width:25%;">
      <xsl:call-template name="format-author" />
    </td>
    <td style="vertical-align:top; padding-bottom:15px; width:75%;">
      <xsl:apply-templates select="b:Author/b:Author" mode="all" />
      <xsl:text>&quot;</xsl:text>
      <xsl:value-of select="b:Title" />
      <xsl:text>&quot;</xsl:text>
      <xsl:text>. </xsl:text>
      <xsl:value-of select="b:Institution" />
      <xsl:text>, </xsl:text>
      <xsl:value-of select="b:City" />
      <xsl:text>, </xsl:text>
      <xsl:value-of select="b:ThesisType" />
      <xsl:text>, </xsl:text>
      <xsl:if test="string-length(b:StandardNumber) &gt; 1">
        <xsl:value-of select="b:StandardNumber" />
        <xsl:text>, </xsl:text>      
      </xsl:if>      
      <xsl:value-of select="substring(b:Year, 1, 4)" />
      <xsl:text>.</xsl:text>
    </td>
  </tr>
</xsl:template>

<!-- internet site -->
<!-- important fields -->
<xsl:template match="b:GetImportantFields[b:SourceType = 'InternetSite']">
  <b:ImportantFields>
    <b:ImportantField>
      <xsl:text>b:Author/b:Author/b:NameList</xsl:text>
    </b:ImportantField>
    <b:ImportantField>
      <xsl:text>b:Title</xsl:text>
    </b:ImportantField>
        <b:ImportantField>
      <xsl:text>b:InternetSiteTitle</xsl:text>
    </b:ImportantField>
    <b:ImportantField>
      <xsl:text>b:Year</xsl:text>
    </b:ImportantField>
    <b:ImportantField>
      <xsl:text>b:Month</xsl:text>
    </b:ImportantField>
    <b:ImportantField>
      <xsl:text>b:Day</xsl:text>
    </b:ImportantField>
    <b:ImportantField>
      <xsl:text>b:YearAccessed</xsl:text>
    </b:ImportantField>
    <b:ImportantField>
      <xsl:text>b:MonthAccessed</xsl:text>
    </b:ImportantField>
    <b:ImportantField>
      <xsl:text>b:DayAccessed</xsl:text>
    </b:ImportantField>
    <b:ImportantField>
      <xsl:text>b:URL</xsl:text>
    </b:ImportantField>
  </b:ImportantFields>
</xsl:template>

<!-- internet site template -->
<xsl:template match="b:Source[b:SourceType = 'InternetSite']">
  <tr>  
    <td style="vertical-align:top; padding-bottom:15px; width:25%;">    
      <xsl:choose>
        <xsl:when test="count(b:Author/b:Author/b:Corporate) = 1">
          <xsl:text>[</xsl:text>
          <xsl:value-of select="substring(b:Author/b:Author/b:Corporate, 1, 3)" />
          <xsl:choose>
            <xsl:when test="string-length(b:Year) = 5">
              <xsl:value-of select="substring(b:Year, 3, 3)" />
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="substring(b:Year, 3, 2)" />
            </xsl:otherwise>
          </xsl:choose>
          <xsl:text>]</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="format-author" />
        </xsl:otherwise>
      </xsl:choose>
    </td>
    <td style="vertical-align:top; padding-bottom:15px; width:75%;">
      <xsl:choose>
        <xsl:when test="count(b:Author/b:Author/b:Corporate) = 1">
          <span style="text-transform:uppercase">
            <xsl:value-of select="b:Author/b:Author/b:Corporate" />
          </span>
          <xsl:text>; </xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates select="b:Author/b:Author" mode="all" />
        </xsl:otherwise>
      </xsl:choose>
      <i>
        <xsl:value-of select="b:Title" />
      </i>
      <xsl:text>. Abgerufen am </xsl:text>
      <xsl:value-of select="b:DayAccessed" />
      <xsl:text>. </xsl:text>
      <xsl:value-of select="b:MonthAccessed" />
      <xsl:text> </xsl:text>
      <xsl:value-of select="b:YearAccessed" />
      <xsl:text> von </xsl:text>
      <xsl:value-of select="b:InternetSiteTitle" />
      <xsl:text>, </xsl:text>
      <xsl:text>Stand: </xsl:text>
      <xsl:value-of select="b:Day" />
      <xsl:text>. </xsl:text>
      <xsl:value-of select="b:Month" />
      <xsl:text> </xsl:text>
      <xsl:value-of select="substring(b:Year, 1, 4)" />
      <xsl:text>, </xsl:text>
      <xsl:value-of select="b:URL" />
      <xsl:text>.</xsl:text>
    </td>
  </tr>
</xsl:template>

<!-- document from internet site -->
<!-- important fields -->
<xsl:template match="b:GetImportantFields[b:SourceType = 'DocumentFromInternetSite']">
  <b:ImportantFields>
    <b:ImportantField>
      <xsl:text>b:Author/b:Author/b:NameList</xsl:text>
    </b:ImportantField>
    <b:ImportantField>
      <xsl:text>b:Title</xsl:text>
    </b:ImportantField>
        <b:ImportantField>
      <xsl:text>b:InternetSiteTitle</xsl:text>
    </b:ImportantField>
    <b:ImportantField>
      <xsl:text>b:Year</xsl:text>
    </b:ImportantField>
    <b:ImportantField>
      <xsl:text>b:Month</xsl:text>
    </b:ImportantField>
    <b:ImportantField>
      <xsl:text>b:Day</xsl:text>
    </b:ImportantField>
    <b:ImportantField>
      <xsl:text>b:YearAccessed</xsl:text>
    </b:ImportantField>
    <b:ImportantField>
      <xsl:text>b:MonthAccessed</xsl:text>
    </b:ImportantField>
    <b:ImportantField>
      <xsl:text>b:DayAccessed</xsl:text>
    </b:ImportantField>
    <b:ImportantField>
      <xsl:text>b:URL</xsl:text>
    </b:ImportantField>
  </b:ImportantFields>
</xsl:template>

<!-- document from internet site template -->
<xsl:template match="b:Source[b:SourceType = 'DocumentFromInternetSite']">
  <tr>  
    <td style="vertical-align:top; padding-bottom:15px; width:25%;">
      <xsl:choose>
        <xsl:when test="count(b:Author/b:Author/b:Corporate) = 1">
          <xsl:text>[</xsl:text>
          <xsl:value-of select="substring(b:Author/b:Author/b:Corporate, 1, 3)" />
          <xsl:choose>
            <xsl:when test="string-length(b:Year) = 5">
              <xsl:value-of select="substring(b:Year, 3, 3)" />
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="substring(b:Year, 3, 2)" />
            </xsl:otherwise>
          </xsl:choose>
          <xsl:text>]</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="format-author" />
        </xsl:otherwise>
      </xsl:choose>
    </td>
    <td style="vertical-align:top; padding-bottom:15px; width:75%;">
      <xsl:choose>
        <xsl:when test="count(b:Author/b:Author/b:Corporate) = 1">
          <span style="text-transform:uppercase">
            <xsl:value-of select="b:Author/b:Author/b:Corporate" />
          </span>
          <xsl:text>; </xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates select="b:Author/b:Author" mode="all" />
        </xsl:otherwise>
      </xsl:choose>
      <i>
        <xsl:value-of select="b:Title" />
      </i>
      <xsl:text>. Abgerufen am </xsl:text>
      <xsl:value-of select="b:DayAccessed" />
      <xsl:text>. </xsl:text>
      <xsl:value-of select="b:MonthAccessed" />
      <xsl:text> </xsl:text>
      <xsl:value-of select="b:YearAccessed" />
      <xsl:text> von </xsl:text>
      <xsl:value-of select="b:InternetSiteTitle" />
      <xsl:text>, </xsl:text>
      <xsl:text>Stand: </xsl:text>
      <xsl:value-of select="b:Day" />
      <xsl:text>. </xsl:text>
      <xsl:value-of select="b:Month" />
      <xsl:text> </xsl:text>
      <xsl:value-of select="substring(b:Year, 1, 4)" />
      <xsl:text>, </xsl:text>
      <xsl:value-of select="b:URL" />
      <xsl:text>.</xsl:text>
    </td>
  </tr>
</xsl:template>

<!-- bibliography -->
<xsl:template match="b:Bibliography">
  <html xmlns="http://www.w3.org/TR/REC-html40">
    <body>
      <table>
        <xsl:apply-templates select="*"></xsl:apply-templates>
      </table>
    </body>
  </html>
</xsl:template>

<!-- authors -->
<xsl:template match="b:Author" mode="all">
    <xsl:for-each select="b:NameList/b:Person">
        <span style="text-transform:uppercase">
          <xsl:value-of select="b:Last" />
        </span>
        <xsl:text>, </xsl:text>
        <xsl:value-of select="b:First" />
        <xsl:text>; </xsl:text>
    </xsl:for-each>
</xsl:template>

<xsl:template match="b:BookAuthor" mode="all">
    <xsl:for-each select="b:NameList/b:Person">
        <span style="text-transform:uppercase">
          <xsl:value-of select="b:Last" />
        </span>
        <xsl:text>, </xsl:text>
        <xsl:value-of select="substring(b:First, 1, 1)" />
        <xsl:text>.; </xsl:text>
    </xsl:for-each>
</xsl:template>

<!-- format citation (short) -->
<xsl:template name="format-author">
  <xsl:text>[</xsl:text>
  <!-- see LNI GI guidelines TODO: a - z -->
  <xsl:choose>
    <xsl:when test="count(b:Author/b:Author/b:NameList/b:Person) = 1">
        <xsl:value-of select="substring(b:Author/b:Author/b:NameList/b:Person/b:Last, 1, 3)" />
    </xsl:when>
    <xsl:when test="count(b:Author/b:Author/b:NameList/b:Person) = 2">
      <xsl:value-of select="substring(b:Author/b:Author/b:NameList/b:Person[1]/b:Last, 1, 1)" />
      <xsl:value-of select="substring(b:Author/b:Author/b:NameList/b:Person[2]/b:Last, 1, 1)" />
    </xsl:when>
    <xsl:when test="count(b:Author/b:Author/b:NameList/b:Person) = 3">
      <xsl:value-of select="substring(b:Author/b:Author/b:NameList/b:Person[1]/b:Last, 1, 1)" />
      <xsl:value-of select="substring(b:Author/b:Author/b:NameList/b:Person[2]/b:Last, 1, 1)" />
      <xsl:value-of select="substring(b:Author/b:Author/b:NameList/b:Person[3]/b:Last, 1, 1)" />
    </xsl:when>
    <xsl:when test="count(b:Author/b:Author/b:NameList/b:Person) = 4">
      <xsl:value-of select="substring(b:Author/b:Author/b:NameList/b:Person[1]/b:Last, 1, 1)" />
      <xsl:value-of select="substring(b:Author/b:Author/b:NameList/b:Person[2]/b:Last, 1, 1)" />
      <xsl:value-of select="substring(b:Author/b:Author/b:NameList/b:Person[3]/b:Last, 1, 1)" />
      <xsl:value-of select="substring(b:Author/b:Author/b:NameList/b:Person[4]/b:Last, 1, 1)" />
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="substring(b:Author/b:Author/b:NameList/b:Person/b:Last, 1, 3)" />
    </xsl:otherwise>
  </xsl:choose>
  <xsl:choose>
    <xsl:when test="string-length(b:Year) = 5">
      <xsl:value-of select="substring(b:Year, 3, 3)" />
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="substring(b:Year, 3, 2)" />
    </xsl:otherwise>
  </xsl:choose>
  <xsl:text>]</xsl:text>
</xsl:template>

<xsl:template match="b:Citation/b:Source[b:SourceType = 'Book']">
  <html xmlns="http://www.w3.org/TR/REC-html40">
    <body>
	  <xsl:choose>
        <xsl:when test="count(b:Author/b:Author/b:Corporate) = 1">
          <xsl:text>[</xsl:text>
          <xsl:value-of select="substring(b:Author/b:Author/b:Corporate, 1, 3)" />
          <xsl:choose>
            <xsl:when test="string-length(b:Year) = 5">
              <xsl:value-of select="substring(b:Year, 3, 3)" />
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="substring(b:Year, 3, 2)" />
            </xsl:otherwise>
          </xsl:choose>
          <xsl:text>]</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="format-author" />
        </xsl:otherwise>
      </xsl:choose>
    </body>
  </html>
</xsl:template>

<xsl:template match="b:Citation/b:Source[b:SourceType = 'BookSection']">
  <html xmlns="http://www.w3.org/TR/REC-html40">
    <body>
      <xsl:call-template name="format-author" />
    </body>
  </html>
</xsl:template>

<xsl:template match="b:Citation/b:Source[b:SourceType = 'JournalArticle']">
  <html xmlns="http://www.w3.org/TR/REC-html40">
    <body>
      <xsl:call-template name="format-author" />
    </body>
  </html>
</xsl:template>

<xsl:template match="b:Citation/b:Source[b:SourceType = 'ArticleInAPeriodical']">
  <html xmlns="http://www.w3.org/TR/REC-html40">
    <body>
      <xsl:call-template name="format-author" />
    </body>
  </html>
</xsl:template>

<xsl:template match="b:Citation/b:Source[b:SourceType = 'ConferenceProceedings']">
  <html xmlns="http://www.w3.org/TR/REC-html40">
    <body>
      <xsl:call-template name="format-author" />
    </body>
  </html>
</xsl:template>

<xsl:template match="b:Citation/b:Source[b:SourceType = 'Report']">
  <html xmlns="http://www.w3.org/TR/REC-html40">
    <body>
      <xsl:call-template name="format-author" />
    </body>
  </html>
</xsl:template>

<xsl:template match="b:Citation/b:Source[b:SourceType = 'InternetSite']">
  <html xmlns="http://www.w3.org/TR/REC-html40">
    <body>
      <xsl:choose>
        <xsl:when test="count(b:Author/b:Author/b:Corporate) = 1">
          <xsl:text>[</xsl:text>
          <xsl:value-of select="substring(b:Author/b:Author/b:Corporate, 1, 3)" />
          <xsl:choose>
            <xsl:when test="string-length(b:Year) = 5">
              <xsl:value-of select="substring(b:Year, 3, 3)" />
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="substring(b:Year, 3, 2)" />
            </xsl:otherwise>
          </xsl:choose>
          <xsl:text>]</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="format-author" />
        </xsl:otherwise>
      </xsl:choose>
    </body>
  </html>
</xsl:template>

<xsl:template match="b:Citation/b:Source[b:SourceType = 'DocumentFromInternetSite']">
  <html xmlns="http://www.w3.org/TR/REC-html40">
    <body>
      <xsl:choose>
        <xsl:when test="count(b:Author/b:Author/b:Corporate) = 1">
          <xsl:text>[</xsl:text>
          <xsl:value-of select="substring(b:Author/b:Author/b:Corporate, 1, 3)" />
          <xsl:choose>
            <xsl:when test="string-length(b:Year) = 5">
              <xsl:value-of select="substring(b:Year, 3, 3)" />
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="substring(b:Year, 3, 2)" />
            </xsl:otherwise>
          </xsl:choose>
          <xsl:text>]</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="format-author" />
        </xsl:otherwise>
      </xsl:choose>
    </body>
  </html>
</xsl:template>

<xsl:template match="text()" />

</xsl:stylesheet>

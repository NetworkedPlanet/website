<xsl:stylesheet version="2.0" 
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:wp="http://wordpress.org/export/1.2/"
		xmlns:content="http://purl.org/rss/1.0/modules/content/"
        xmlns:dc="http://purl.org/dc/elements/1.1/"
		>
  <xsl:output method="text"/>

  <xsl:template match="rss">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="channel">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="item[not(wp:status='draft')]">
    <xsl:variable name="post_date"><xsl:value-of select="substring-before(wp:post_date, ' ')"/></xsl:variable>
    <xsl:variable name="slug"><xsl:value-of select="replace(wp:post_name, '_', '-')"/></xsl:variable>
    <xsl:result-document href="../_posts/{$post_date}-{$slug}.md">---
layout: post
title: <xsl:value-of select="replace(title, ':', ' -')"/>
<xsl:apply-templates select="category"/>
<xsl:apply-templates select="dc:creator"/>
---
<xsl:value-of select="replace(content:encoded, '&#xA;', '&#xA;&#xA;')"/>
    </xsl:result-document>
  </xsl:template>

  <xsl:template match="category[@domain='category']">
category: <xsl:value-of select="."/>
  </xsl:template>

  <xsl:template match="category[@domain='post_tag']">
tag: <xsl:value-of select="."/>
  </xsl:template>

  <xsl:template match="category"></xsl:template>
  
  <xsl:template match="dc:creator">
author: <xsl:value-of select="."/>
</xsl:template>
</xsl:stylesheet>

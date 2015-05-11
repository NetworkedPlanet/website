---
layout: post
title: Opening downloaded help (.chm) files
tag: tip
category: Uncategorized
author: gra
---
<strong>We have noticed that when downloading the TMCore EPiServer Module it is sometimes the case that the help file, <code>.chm</code> file does not open correctly.  This article explains why, and how to fix it.</strong>

<h3>The solution</h3>

<p>Rather than tantalize and tease with the solution, to make the chm file readable on your machine open up the properties for the <code>CHM</code> file and click the <strong>Unblock</strong> button.</p>

<h3>The problem</h3>

<p>The "problem" is caused by Windows protecting your system.  Windows is aware that the <code>CHM</code> file originated from the internet.  The help system, which is HTML based, contains code (ActiveX) which, if maliciously written, could damage your machine.  Therefore, Microsoft issues are security patch (896358/890175) to disable this by default.</p>

<p>In order to allow the code within the <code>CHM</code> file to run, you must "unblock" the file.</p>

<h3>References</h3>

<p>The links below explain the exact nature of the problem and alternative workarounds to this problem.</p>

<ul>

<li><a href="http://support.microsoft.com/kb/902225">Microsoft Knowledge Base Article 902225</a></li>

<li><a href="http://support.microsoft.com/kb/892675">Microsoft Knowledge Base Article 892675</a></li>

</ul>


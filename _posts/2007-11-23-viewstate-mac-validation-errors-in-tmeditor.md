---
layout: post
title: ViewState MAC Validation errors in TMEditor
tag: bug
category: TMCore
tag: tmcore
author: gra
---
<h1>ViewState MAC Validation errors in TMEditor</h1>

If you've used TMEditor on Windows 2003 you may have experienced the following error when using TMEditor:

<div style="color:red;text-decoration:italic">Validation of viewstate MAC failed. If this application is hosted by a Web Farm or cluster, ensure that  configuration specifies the same validationKey and validation algorithm. AutoGenerate cannot be used in a cluster.</div>

There are several reasons why this may happen; however there is a general way around this problem which is to disable ViewState MAC validation.  To do this edit the TMEditor's <code>web.config</code> file and add the following as a child of the <code>system.web</code> section:

<pre>&lt;pages enableEventValidation="false" viewStateEncryptionMode="Never" enableViewStateMac="false" /&gt;</pre>

However please note that this may allow attacks on the application or IIS on a public-facing server; however if you've got TMEditor sitting unprotected on an internet connection then you're already in trouble <code>:-)</code>.



The following references provide more information:

<ul>

	<li><a href="http://forums.asp.net/t/955145.aspx?PageIndex=9">http://forums.asp.net/t/955145.aspx?PageIndex=9</a> - ASP.NET forum post</li>

	<li><a href="http://msdn2.microsoft.com/en-us/library/aa302426.aspx">http://msdn2.microsoft.com/en-us/library/aa302426.aspx</a> - Building Secure ASP.NET Pages and Controls (MSDN).</li>

</ul>
---
layout: post
title: TMCore on SQL Server 2005 Express
tag: tip
category: TMCore
tag: tmcore
author: gra
---
Partners and customers have been expressing an interest in using TMCore 2007 on <a href="http://www.microsoft.com/sql/editions/express/default.mspx">Microsoft SQL Server 2005 Express Edition</a>.  Networked Planet are happy to announce that TMCore does function as expected on this platform.  However, there are some extra steps you have to perform during configuration as the Express edition is not quite so "out of the box" as Microsoft SQL Server.



Microsoft SQL Server 2005 Express Edition (henceforth MSSQLEE) that is free to download, use and embed.  You can <a href="http://msdn.microsoft.com/vstudio/express/sql/register/default.aspx">download it from Microsoft here</a>.



Once you have downloaded MSQLEE, you'll notice very quickly that this is definitely not the same as regular SQL Server.  Most immediately noticable are the lack of the Enterprise Manager and Query Analyzer tools.  Fortunately Microsoft have made available, as a separate download, <a href="http://www.microsoft.com/downloads/details.aspx?displaylang=en&amp;FamilyID=C243A5AE-4BD1-4E3D-94B8-5A0F62BF7796">SQL Server 2005 Management Studio Express</a>, also this article, <a href="http://www.microsoft.com/technet/prodtechnol/sql/2005/mgsqlexpwssmse.mspx">Managing SQL Server Express with SQL Server 2005 Management Studio Express Editon</a>, may give you some useful insights in how to use this utility.



Once you've downloaded and installed these, the next steps are to:

<ol>

	<li>Create the <code>topicmap</code> database, using Studio Express.</li>

	<li>Use Studio Express to load the database schema, <code>tmcore.sql</code>, in to the database.  See note below.</li>

</ol>

<strong>Note:</strong> When you execute <code>tmcore.sql</code> against the database you will see the following output:

<pre>(1 row(s) affected)

(1 row(s) affected)

Cannot grant, deny, or revoke permissions to sa, dbo, entity owner, information_schema, sys, or yourself.</pre>

This is a known issue which does not cause any problems with the operation of TMCore (you will see the same message when using the non-express edition of SQL Server 2005.



If using MS SQL Server this would be the end of configuration, however for MSSQLEE you will hit errors errors fairly quickly.  If you try to use TMEditor or TMWS you will most likely encounter the following error:

<blockquote>An error has occurred while establishing a connection to the server.  When connecting to SQL Server 2005, this failure may be caused by the fact that under the default settings SQL Server does not allow remote connections. (provider: Named Pipes Provider, error: 40 - Could not open a connection to SQL Server)</blockquote>

By default MSSQLEE does not accept remote connections.  To enable this, you can use the SQL Server Surface Area Configuration utility to set MSSQLEE to be <em>Using both TCP/IP and named pipes</em> under the <em>Database Engine</em> -&gt; <em>Remote Connections</em> sections.  You may also need to enable SQL Server Browsing and open the firewall to accept connections on the required TCP/UDP ports.  See this Microsoft <a href="http://support.microsoft.com/kb/914277">Knowledge Base Article KB914277</a> for a full description on how to do this.



Finally, the connection string in TMEditor and TMWS's <code>web.config</code> files will need updating to use a form that MSSQLEE will understand and tolerate.  It will be something in this form:

<blockquote><code>&lt;add key="networkedplanet.tmcore.dbconnect" value="Data Source=<span style="color: green;"><strong>SERVER NAME</strong></span>;Integrated Security=SSPI; Initial Catalog=<span style="color: green;">topicmap</span>" /&gt;</code></blockquote>

Where servername is of the form: <code><em>machine name</em><em>service name</em></code>.  Therefore if your host name is <code>DEMETER</code>, and you're using the default service name of <code>SQLEXPRESS</code>, you full connection string will be:

<blockquote><code>&lt;add key="networkedplanet.tmcore.dbconnect" value="Data Source=<span style="color: green;">DEMETERSQLEXPRESS</span>;Integrated Security=SSPI; Initial Catalog=<span style="color: green;">topicmap</span>" /&gt;</code></blockquote>

Once these steps are followed, and replicated for your own applications, you should find that SQL Server Express provides a quick and convenient way to use TMCore.



If you'd like to add your own hints and tips for using MSSQLEE then please comment below.  If you encounter any problems with this guide or you think we should add some more information, then please e-mail us at <a href="mailto:contact@networkedplanet.com?subject=MSQLEE Blog Comments&amp;">contact@networkedplanet.com</a>.
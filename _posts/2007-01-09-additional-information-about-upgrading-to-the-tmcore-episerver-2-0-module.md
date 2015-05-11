---
layout: post
title: Additional information about upgrading to the TMCore EPiServer 2.0 Module
tag: episerver module
tag: tip
category: TMCore EPiServer Module
author: gra
---
<strong>A number of projects are using a Release Candidate or Beta release of the EPiServer Module 2.0. With the final release now public here are a few additional pieces of information:</strong>

<h4>Which files are added/deleted?</h4>

There have been additions to the documentation and the AJAX topic editing client.  However, deploying over the top of an existing installation will work correctly; the obsolete files will simply not be used.

<h4>Is it necessary to run the EpiServerModule.sql when I am updating?</h4>

Yes, we've updated the SQL Stored Procedures. However, this does not change any of the data in the database.

<h4>Which <code>web.config</code> settings should be added/removed?</h4>

No settings <strong>must</strong> be removed or changed, however you should review your existing <code>web.config</code> configuration with the installation guide to ensure correct operation.

<h4>Adding a new Dynamic Property 'topicidentity' to the EPiServer Project. Should there be a default value?</h4>

No value is required as default. It will get filled in automatically on each page by the EPiServer Module, either during the page create post-processing, or by the consistency checker.

<h4>The first time I run the Consistency Checker I get a lot problems reported</h4>

<pre><em>page name</em> has no GUID. Will create one: urn:guid:<em>xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx</em>

<em>page name</em> has unwanted subject identifier <em>http://www.networkedplanet.com/2005/01/episerver/np-gen-psi/<em>pageid</em></em>

<em>page name</em> requires new subject identifier: urn:guid:<em>xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx</em></pre>

In TEM 2.0 we require the definition a new dynamic property to EPiServer which is a GUID, or <a href="http://en.wikipedia.org/wiki/Globally_Unique_Identifier"><em>G</em>lobally <em>U</em>nique <em>ID</em>entifier</a>.  The GUID is then used, in combination with a prefix <code>urn:guid:</code>, to construct the subject identifier of the topic representing the page.



The result of this is that the GUID property of the page is unchanged throughout the life of the page, and is preserved through export operations.  This therefore allows EPiServer administrators to export page data, export the XTM from TMCore and then import in to new systems and the system will work as expected.



The EPiServer page ID can still be derived from the a topic via an occurrence value on the topic, typed by the <em>Page ID occurrence type</em> topic, by default this a topic with the subject identifier <code>http://www.networkedplanet.com/2005/01/episerver/pageid</code>.



The old subject identifier is no longer required and will be removed by the consistency checker.
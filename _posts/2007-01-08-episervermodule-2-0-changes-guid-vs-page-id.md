---
layout: post
title: EPiServerModule 2.0 Changes - GUID vs. Page ID
tag: episerver module
category: TMCore EPiServer Module
author: gra
---
<p><strong>In the latest version of the Networked Planet TMCore EPiServer Module (henceforth TEM); we moved away from the model of using EPiServer page IDs to instead use a dynamically generated GUID.</strong></p>

<h3>EPiServer Module 1.x</h3>

<p>In TEM 1.x each topic that represented in a page in EPiServer would have a subject identifier which was composed of a prefix (typically <em>http://www.networkedplanet.com/2005/01/episerver/np-gen-psi/</em> followed by the integer ID of the page that this topic represented.  The advantages of this system were:</p>

<ul>

<li>The ID was persistent in EPiServer, so there were no concerns with the ID changing <em>within</em> an EPiServer installation.</li>

<li>The subject identifier of the topic could be easily derived from the page (just add the prefix), and vice versa.</li>

</ul>

<p>Unfortunately this system also carried a penalty.  If page data was exported from EPiServer and then migrated to a new EPiServer installation, a new ID would be assigned, usually different from the old id.  This means that the link between the page and the topic was broken.  In short, moving page data around between servers was very difficult and we felt we had to address this in the 2.0 release of the TEM.</p>

<h3>EPiServer Module 2.0</h3>

<p>In TEM 2.0 we require the definition a new dynamic property to EPiServer which is a GUID, or <a href="http://en.wikipedia.org/wiki/Globally_Unique_Identifier"><em>G</em>lobally <em>U</em>nique <em>ID</em>entifier</a>.  The GUID is then used, in combination with a prefix <code>urn:guid:</code>, to construct the subject identifier of the topic representing the page.</p>

<p>The result of this is that the GUID property of the page is unchanged throughout the life of the page, and is preserved through export operations.  This therefore allows EPiServer administrators to export page data, export the XTM from TMCore and then import in to new systems and the system will work as expected.</p>

<p>The EPiServer page ID can still be derived from the a topic via an occurrence value on the topic, typed by the <em>Page ID occurrence type</em> topic, by default this a topic with the subject identifier <code>http://www.networkedplanet.com/2005/01/episerver/pageid</code>.

<h3>Pitfalls</h3>

<p>Of course, nothing ever comes for free, there are few ill-considered things you can do to EPiServer which will cause problems with this new system.</p>

<p>The most serious of these is to delete the dynamic property from EPiServer.  This causes all GUID values of pages to be destroyed.  These values are unfortunately unrecoverable.</p>

<p>Manually setting the GUID is also unwise, not only do you risk setting the GUID to a value which will potentially clash with another page ID, but also you will put the page GUID out of sync with the topic GUID.  This means that you must either:

<ol>

<li>Manually set the GUID subject identifier on the topic to match the changed page GUID; or</li>

<li>Run the TEM consistency checker which will create a new topic for the page, based on the new GUID.  However, this will leave the old topic hanging around in the system, along with all its associations which may cause confusion.</li>

</ol>

</p>


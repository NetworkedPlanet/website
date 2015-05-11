---
layout: post
title: Technical information about the TMCore EPiServer Module 3.0 Alpha
tag: episerver module
category: TMCore EPiServer Module
author: gra
---
<h3>Installation and Configuration</h3>

We have only tested this against the <strong>EPiServer CMS RC3</strong> release. We suspect and hope it will work with subsequent RCs and we'll keep this blog up to date regarding compatability as new releases come out.



The existing documentation for installation and usage remains the same, therefore following the installation instructions provided is the correct procedure with the following addition.  There is one new configuration property called:



<code>&lt;add key="NP_TM_NPCL_Endpoint" value="http://localhost/npcl-ws/NPCLSchemaService.asmx" /&gt;</code>



This does have a default value (shown above) but in case your NPCL web service is somewhere else this is the additional line to add to the appsettings section in <code>web.config</code>.

<h3>Known Issues</h3>

If the <strong>Topic Map</strong> tab contents cannot render within the window and a scrollbar is required in Internet Explorer 7, then scrolling results in some weird behaviour in regards to the CSS.  This is a known issue in EPiServer CMS 5.</a>

<h3>Migration from TMCore EPiServer Module 2.x</h3>

We haven't done a rigorous test of this, but none of the topic map data structures have been changed and as we have used our own GUID property on EPiServer pages in the 2.0 module pulling across the EPiServer data and the topic map we do not expect any compatibility issues of this type.
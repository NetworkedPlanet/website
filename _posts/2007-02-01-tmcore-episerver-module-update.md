---
layout: post
title: TMCore EPiServer Module Update
category: Announcements
tag: episerver module
tag: releases
category: TMCore EPiServer Module
author: gra
---
<strong>Thanks to excellent feedback from our partners and our continued QA processes we are pleased to announce the update of the TMCore EPiServer Module to version 2.0.1.0</strong>



The following bugs have been fixed

<ol>

	<li>Publishing a page caused all associations to be published, even if the page at the other end of the association was unpublished.  Behaviour is changed to only publish associations where both ends of the association are published pages (or a topic without a page).</li>

	<li>Javascript error reported if calling up topic details for a topic which did not represent an EPiServer page in the EPiServer Edit mode.  This has been fixed.</li>

	<li>Copying a page in EPiServer did not cause a new GUID to be assigned or a new topic to be created.  This has been fixed.</li>

</ol>

Please <a href="mailto:contact@networked.com">contact Networked Planet</a> to obtain an updated version of the module.
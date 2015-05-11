---
layout: post
title: EPiServer Module 3.3.0.40 Released
tag: episervermodule
category: Product Announcements
tag: releases
category: TMCore EPiServer Module
author: gra
---
TMCore EPiServer Module 3.3.0.40 has now been released. This update addresses these issues;

-Editing a page that is not part of the MasterLanguage branch using the On-Page-Editor caused the saving of the page to fail.

-Paging of topic results when searching from the Topic List was unreliable. This has now been addressed and paging now works when searching for topics.

As well as these issues the performance of the module in Edit mode has been improved. The plugin no longer calls the TMService until its plugin tab has been clicked on by the editor.

When upgrading from a previous release, please ensure that you empty your web browser cache so that your receive the most recent Javascript and CSS files served from the web server.
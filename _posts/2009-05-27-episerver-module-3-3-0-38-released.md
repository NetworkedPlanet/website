---
layout: post
title: EPiServer Module 3.3.0.38 Released
tag: episerver module
tag: releases
category: TMCore EPiServer Module
author: gra
---
EPiServer Module 3.3.0.38 has now been released.

This release fixes an issue where unpublished pages when deleted from within EPiServer were not also being removed from the Topic Map. This would cause an already deleted unpublished page to show as a valid association within the Topic Map Editor interface. If you have previously encountered this issue, you must manually remove the topic for the deleted unpublished page as the consistency checker is unable to determine topics that do not have an associated page within EPiServer at this time.

Compatibility with EPiServer CMS 5 R2 SP2 RC has also been tested. We are aware of cosmetic issues with the Topic Map Editor when using Internet Explorer 8 or Firefox however.


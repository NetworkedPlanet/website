---
layout: post
title: EPiServer Module 3.3.0.37 Released
tag: episerver module
tag: episervermodule
tag: releases
category: TMCore EPiServer Module
author: gra
---
EPiServer Module 3.3.0.37 has now been released. This update addresses an issue whereby registering events with SchemaJSON were not being fired correctly. Registering events with SchemaJSON now requires that after the event is registered FlushSchema() is called so that the event is properly registered.


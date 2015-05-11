---
layout: post
title: Http Post not allowed by default when deploying TMCore and EPiServer  Solutions
tag: episerver module
tag: tip
category: TMCore
tag: tmcore
category: TMCore EPiServer Module
author: gra
---
When deploying production versions of TMCore EPiServer Module it is often the case that the editorial application works from the local browser but not a remote browser. This is because web applications by default do not allow Http Post operations. This is required by the Topic Map editor that is integrated with EPiServer. To fix this problem ensure the following is contain in the episerver web.config file.

<pre>&lt;system.web&gt;

&lt;webServices&gt;

&lt;protocols&gt;

&lt;add name="HttpPost"/&gt;

&lt;/protocols&gt;

&lt;/webServices&gt;

&lt;/system.web&gt;</pre>

If using ASP.NET 2.0 you can apply this configuration change to only the path containing the web service by wrapping the above XML in a <em>location</em> element:

<pre>&lt;location path="NetworkedPlanet/EPiServerModule/Service"&gt;

&lt;system.web&gt;

&lt;webServices&gt;

&lt;protocols&gt;

&lt;add name="HttpPost"/&gt;

&lt;/protocols&gt;

&lt;/webServices&gt;

&lt;/system.web&gt;

&lt;/location&gt;</pre>
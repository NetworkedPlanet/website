---
layout: post
title: TMCore Configuration and Deployment on Windows 2003 Server for EPiServer Projects
tag: episerver module
tag: tip
category: TMCore EPiServer Module
author: gra
---
Many projects are developing solutions on XP and then deploying them onto Windows 2003 Server. To minimise the configuration issues here are a few suggestions:

On Windows 2003:

Install the TMCore Services (TMEditor, TMService and NPCLService) into their own website (perhaps called TMCore) with its own AppPool. Just copying the DefaultAppPool works fine. This has the benefit of keeping TMCore out of the EPiServer project space (i.e. no fiddling with httpmodule exclusions etc, issues with different .NET versions).

Install the EPiServer Project into its own website and configure as normal. The only property in the EPiServerModule that needs to be changed is the one referencing the TMWS endpoint. Obviously the TMCore website will be running on a different port to the EPiServer site.

On Windows XP:

The real pain here is that IIS can only host one website! And even worse is that while Microsoft have achieved binary compatibility between .NET 1.1 and .NET 2.0 they have failed to ensure XML compatibility in the web.config files! Thus if you are using the ASP.NET 1.1 TMCore services it is not possible to deploy them under an EPiServer install using ASP.NET 2.0.

Some options:

1. Use the TMCore ASP.NET 2.0 Web Services for TMEditor, TMWS and NPCL, and install them under the EPiServer virtual website.

2. Install a virtual machine (either MS or VMWare) and on this install TMCore. The benefit of this is that this machine can then run happily and support multiple projects.

3. Not sure EPiServer recommend this any more, but install EPiServer in a virtual directory and TMCore services in virtual directories all in the same website. The advantage of this is that it removes the need for fiddling with the httpmodule exclusions AND means that TMCore can support multiple projects more cleanly.

Hope this helps.


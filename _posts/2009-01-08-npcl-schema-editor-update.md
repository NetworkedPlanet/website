---
layout: post
title: NPCL Schema Editor Update
tag: npcl editor
category: NPCL Schema Editor
tag: releases
author: kal
---
The NPCL Schema Editor is a plugin for Visual Studio 2005 that enables you to create topic map ontologies through a simple graphical interface. The goal of the schema editor is to make it easy for developers or information architects to convert the domain model into a topic maps model. The editor has been designed to be extensible by supporting additional user-defined menu actions and we have separately released a set of extensions to enable the topic map ontology to be mapped against Content Types in a SharePoint site.

Over the last few months that the NPCL Schema Editor has been out we have come across a few issues with installation (especially on Vista / Server 2008 machines) and with our extensions mechanism for the NPCL Schema Editor. This new release of the NPCL Schema Editor fixes those issues.

The main changes are:

<ul>

<li>

BUGFIX: Fixed extension loading code so that a copy of the NetworkedPlanet.Npcl.Vs.Dsl.DLL is no

longer required in the extensions directory. If you previously added this file to the

extensions directory to fix extension loading issues you should now delete that file.

</li>

<li>NEW: The installer now includes policy files so that extensions that targeted version 2.0.0.0

or version 2.0.0.1 of the NPCL Schema Editor will continue to work after an upgrade.</li>

<li>NEW: Added README and INSTALL text files to the release package.</li>

</ul>

The sharp-eyed among you will have noticed that we haven't yet upgraded this package to work with Visual Studio 2008. This is the next thing on the list and will be part of the forthcoming 2.1 release of the schema editor.

You can download the new NPCL Schema Editor from <a href="http://www.networkedplanet.com/download/npclschemaeditor/NPCLSchemaEditor-2.0.0.2.zip">here</a>. Please note that if you have a previous version of the schema editor installed you must uninstall that before attempting to install the new version.

I also found a couple of minor annoyances in the SharePoint Module extensions for the Schema Editor and fixed those. The updated extension package can be downloaded from <a href="http://www.networkedplanet.com/download/npclschemaeditor/sharepointmoduleextensions.zip">here</a>.

As usual if you have any comments or suggestions for improvements or, dare I say it, bug reports please send them to support@networkedplanet.com.


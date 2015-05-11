---
layout: post
title: Concepts for SharePoint 1.2 released
category: Concepts for SharePoint
tag: concepts for sharepoint
tag: releases
author: jen
---
Version 1.2 of Concepts for SharePoint is now available. This package introduces a number of features and enhancements. The full change list and upgrade instructions can be found below.



To try out Concepts for SharePoint please <a href="http://www.networkedplanet.com/contact/request-evaluation/" title="Request Evaluation">request an evaluation</a>. If you are an existing customer with a valid support contract please contact support@networkedplanet.com for a download link.



<strong>Upgrading instructions</strong>

------------------



Unzip the download package and run the STSADM -upgradesolution command.  The exact command-line you use will depend on how you want to schedule the upgrade, but will be similar to:



stsadm -o upgradesolution -name ConceptsForSharePoint.wsp -filename ConceptsForSharePoint.wsp -allowgacdeployment -local



Restart IIS and the SharePoint 2010 Timer Service



If running CfS on a separate server to that of the Web3 Platform, you will also need to upgrade the additional web3.wsp file contained in the upgrade package and restart the services.



For full upgrade and usage instructions, please refer to the documentation contained in the downloaded package



<strong>Change Log</strong>

----------



FEATURE: Added Concepts for SharePoint License Manager



FEATURE: User Profile Scraper SharePoint timer job added to pull SharePoint site collection users into the Web3 Platform



FEATURE: New Topic Web Part - adds a new topic from within the SharePointenvironment and redirects to the concept pahe for that topic.



ENHANCEMENT: Changes to the way the topic map is synchronized with the ManagedMetadata Service to speed up the overall synchronization process



ENHANCEMENT: Template mappings can now be configured to load up custom templatesfor concept pages for specific topics based on a topic's PSI



ENHANCEMENT: Related concepts added as a refinement to SharePoint Search



ENHANCEMENT: Additional language strings for Web Parts added to language resource file



ENHANCEMENT: Web Parts that use a starting topic can now be set to "Current User"



ENHANCEMENT: Base topic type concept page allows a new instance of that type to be added from within the SharePoint environment
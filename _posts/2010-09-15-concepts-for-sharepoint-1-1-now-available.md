---
layout: post
title: Concepts for SharePoint 1.1 now available
category: Concepts for SharePoint
tag: concepts for sharepoint
tag: releases
tag: web3
author: jen
---
Version 1.1 of Concepts for SharePoint is now available. This package addresses a small number of bugs and enhancements. The full change list and upgrade instructions can be found below.



This update is available to all customers with a valid support contract. Please contact support@networkedplanet.com for a download link.



<strong>Upgrading from 1.0</strong>

------------------



To upgrade from 1.0, unzip the  download package and run the STSADM -upgradesolution command.  The exact  command-line you use will depend on how you want to schedule the upgrade, but  will be similar to:



stsadm -o upgradesolution -name  ConceptsForSharePoint.wsp -filename ConceptsForSharePoint.wsp  -allowgacdeployment -local



Restart IIS and the SharePoint 2010 Timer  Service



If running CfS on a separate server to that of the Web3 Platform,  you will also need to upgrade the additional web3.wsp file contained in the  upgrade package and restart the services.



<strong>Change  Log</strong>

----------



BUGFIX: Query amended to ensure sure that deleted  associations whose roles still exist do not get returned in the results of the  One Hop Web Part.



FEATURE: New Topic List Web Part renders gridview of  topics of type, with custom propertie to show occurrences and/or identifiers in  the results set.



DOCS: Amended documentation error that specified the  wrong format for message

queues on remote machines.



LOGGING:  Additional logging added to make it clear if there has been a security problem  when activating the feature through the GUI.



BUGFIX: Documents were not  being returned in the content query web parts along with list  items.



ENHANCEMENT: Allowed sparql results to be picked up and used by  classes which inherit from web parts doing SPARQL queries.



BUGFIX: Null  reference exception for starting topic when first adding a  TopicInformationWebPart to a page



DOCS: Added full documentation of the  NetworkedPlanet.Web3.SharePoint.WebParts class



BUGFIX: Fixed error that  was reported about thread aborted after setting topic map in CfS site  settings



BUGFIX: template mapping bug fix



BUGFIX: Privileges error  fixed when deriving from the BaseTopicWebPart



BUGFIX: adding a second  label for a newly installed language pack had a bug which was causing the  additional label(s) not to be added to the topic term



BUGFIX: Fixed bug  that was causing the SPARQL web part not to render any content in certain  situations



BUGFIX: content query web parts were displaying unhelpful  error if the topic map had not yet been synchronised with the term store
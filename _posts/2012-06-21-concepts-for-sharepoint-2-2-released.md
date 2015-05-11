---
layout: post
title: Concepts for SharePoint 2.2 released
category: Concepts for SharePoint
tag: concepts for sharepoint
category: Product Announcements
tag: releases
author: jen
---
<div>



Version 2.2 of Concepts for SharePoint is now available. This package addresses a small number of bugs and enhancements. The full change list and upgrade instructions can be found below.



The Concepts for SharePoint package can be requested from the <a href="http://www.networkedplanet.com/solutions/concepts-for-sharepoint/">NetworkedPlanet main website</a>.



<strong>Upgrading instructions</strong>

------------------



Unzip the download package and run the STSADM -upgradesolution command.  The exact command-line you use will depend on how you want to schedule the upgrade, but will be similar to:



stsadm -o upgradesolution -name ConceptsForSharePoint.wsp -filename ConceptsForSharePoint.wsp -allowgacdeployment -local



Restart IIS and the SharePoint 2010 Timer Service



If running CfS on a separate server to that of the Web3 Platform, you will also need to upgrade the additional web3.wsp file contained in the upgrade package and restart the services.



For full upgrade and usage instructions, please refer to the documentation contained in the downloaded package.



<strong>Changelog</strong>

--------------------

ENHANCEMENT: Depreciated OneHopQueryWebPart in favour of AjaxHopWebPart



ENHANCEMENT: Removed reliance on MSMQ from term store synchronization. Synchronization now gets data directly from Web3 Platform database



ENHANCEMENT: Changes to Web Part styling to better fit in with deafult SharePoint styling



FEATURE: Added the ability to set whether subject identifiers and name properties of topics are to be added to the term store as term synonyms



ENHANCEMENT: Changed synchronization timer jobs to run either as a full sync or incremental - schedules can be set for each in SharePoint Central Administration



ENHANCEMENT: Added additional exception details to logging if an exception is encountered



</div>

<div>ENHANCEMENT: Added additional configuration for the connection to the Web3 database. Administrators can set pass through authentication or set specific user credentialsENHANCEMENT: Performance enhancement to search crawler by getting topic information directly from the Web3 databaseENHANCEMENT: performance enhancement to search by reducing amount of queries in the Business Data ConnectorFEATURE: New CheckInstallation stsadm command that can be run after installation/upgrade to check for common problemsBUGFIX: made the url parameter of "createweb3contenttype" stsadm command non-optional to avoid problems with action links from SharePoint search resultsBUGFIX: Special characters in topic names were causing duplicate terms to be created in the term store.



</div>

&nbsp;
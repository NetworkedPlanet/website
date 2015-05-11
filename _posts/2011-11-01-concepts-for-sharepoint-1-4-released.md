---
layout: post
title: Concepts for SharePoint 1.4 released
category: Concepts for SharePoint
tag: concepts for sharepoint
tag: releases
author: jen
---
<div>



Version 1.4 of Concepts for SharePoint is now available. This package addresses a small number of bugs and enhancements. The full change list and upgrade instructions can be found below. 



New customers can <a href="http://www.networkedplanet.com/contact/request-evaluation/" title="Request Evaluation">request an evaluation</a>. Existing customers with a valid support contract should contact support@networkedplanet.com for a download link.



<strong>Upgrading instructions</strong>

------------------



Unzip the download package and run the STSADM -upgradesolution command.  The exact command-line you use will depend on how you want to schedule the upgrade, but will be similar to:



stsadm -o upgradesolution -name ConceptsForSharePoint.wsp -filename ConceptsForSharePoint.wsp -allowgacdeployment -local



Restart IIS and the SharePoint 2010 Timer Service



If running CfS on a separate server to that of the Web3 Platform, you will also need to upgrade the additional web3.wsp file contained in the upgrade package and restart the services.



For full upgrade and usage instructions, please refer to the documentation contained in the downloaded package



<strong>Change Log</strong>

----------



ENHANCEMENT: Allow the filtering of items returned by the ContentQueryWebPart by SharePoint content type



ENHANCEMENT: performance improvement by removing unnecessary topic reference look ups



ENHANCEMENT: Any field internal name can be set on the ContentQueryWebPart to be used as the value for the title displayed in links. If empty the Web Part uses the item's display name



BUGFIX: Changes to timer jobs to ensure that jobs do not continue to attempt to run on sites which have been deleted



BUGFIX: Changes to feature deactivation to ensure that all jobs are properly removed when CfS is deactivated and removed



BUGFIX: Allow TopicMapAddress property to be set on web parts that inherit from the ContentQueryWebPart



BUGFIX: Concept page links in the ContentQueryWebPart were incorrect when on subsites



FEATURE: concept pages can now load topics based on the term ID from the SharePoint term store as well as the standard topic id, address or psi



BUGFIX: Changes to the topic caching to also cache topics by PSI in addition to topic address



ENHANCEMENT: Changed the ContentQueryWebPart to return documents as well as SharePoint list items by default



BUGFIX: SharePointTaxonomyHelper class was closing an SPWeb object that may be needed in the current context for future use



BUGFIX: Added a new handler that ensures that the event handlers required for concept link fields are added to any new subsites created after the initial activated of CfS. This means that CfS will not be required to be reactivated on new subsites



BUGFIX: Fixed bug in Concepts for SharePoint Licensing which caused an intermittent error being thrown: "handle is invalid"



</div>

&nbsp;
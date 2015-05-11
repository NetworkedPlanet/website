---
layout: post
title: SharePoint Module 3.1 Hotfix 3 now available
tag: hotfix
tag: sharepoint module
category: TMCore SharePoint Module
author: jen
---
A new hotfix package is available for version 3.1 of the TMCore SharePoint Module. This package addresses a small number of bugs and provides new features. The full change list can be found below.

<strong>Systems Affected</strong>

This hotfix should be applied to any installation of the TMCore SharePoint Module 3.1 downloaded before 14th September 2009. If you downloaded your copy of the software from our site on or after this date, the hotfix is included in the package and you do not need to apply it again.

To determine if your system is affected, check the File Version property of the assembly NetworkedPlanet.SharePoint in the GAC (browse to C:WindowsASSEMBLY, locate the NetworkedPlanet.SharePoint assembly, right-click and choose Properties. The File Version can be found on the Version tab above Description and Copyright). This hotfix updates the File Version of the NetworkedPlanet.SharePoint assembly to 2.1.3.0 - if the file version shown is greater than or equal to 2.1.3.0, then you do not need to apply this hotfix.

<strong>Upgrade Instructions </strong>

1. <a title="Networked Planet SharePoint Module Hotfix 3" href="http://www.networkedplanet.com/download/SPModule/NetworkedPlanet.SharePoint.3.1.Hotfix3.zip">Download the Hotfix 3 package</a>.

2. The package is provided in a compressed ZIP file. Unzip the package on a machine in the server farm.

3. Upgrade the NPSharePoint.wsp solution. The exact command-line you use will depend on how you want to schedule the upgrade, but will be similar to:

stsadm -o upgradesolution -name NPSharePoint.wsp -filename NPSharePoint.wsp -allowgacdeployment -allowcaspolicies -local

4. Upgrade the NPOfficeServer.wsp solution. Use the following STSADM command:

stsadm -o upgradesolution -name NPOfficeServer.wsp -filename NPOfficeServer.wsp -allowgacdeployment -allowcaspolicies -local

5. Restart IIS and Windows SharePoint Services Timer

6. Deactivate and reactivate the NPItemBase feature on all site collections that use the feature.

<strong>Change Log</strong>

<ul>

	<li>FEATURE: Changed NPItemBase feature so that TopicId field can be indexed by SharePoint search</li>

	<li>FEATURE: New stsadm command 'upgradeitembase' which can be used after activating/reactivating

NPItemBase to update any TopicId fields created before activation

so that they can be indexed by SharePoint Search.

An optional parameter can be specified (-updatelistitems) which will iterate through all

list items and set the value of the topic id field.</li>

	<li>BUGFIX: Fixed bug that prevented the AdvancedFacetedSearchResultsWebPart from rendering correctly

when adding SharePoint field information and the number of results exceeded the

configured maximum.</li>

	<li>BUGFIX: Fixed bug caused by exceptions being thrown when deactivating NPItemBase encountered

sealed or readonly content types.</li>

	<li>BUGFIX: ExtendedXsltWebPart now logs to the correct category - NP - WebParts</li>

	<li>BUGFIX: Fixed a bug with the AdvancedFacetedSearchResultsWebPart that prevented the web part

from displaying additional SharePoint field content if security filtering was disabled.</li>

</ul>
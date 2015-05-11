---
layout: post
title: SharePoint Module 3.1 Hotfix 6 now available
tag: hotfix
tag: module
category: Product Announcements
tag: releases
tag: sharepoint module
tag: spmodule
author: jen
---
A new hotfix package is available for version 3.1 of the TMCore SharePoint Module. This package addresses a small number of bugs and provides new features. The full change list can be found below.

<h3 style="font-size: 1.17em;">Systems Affected</h3>

This hotfix should be applied to any installation of the TMCore SharePoint Module 3.1 downloaded before 15th March 2010. If you downloaded your copy of the software from our site on or after this date, the hotfix is included in the package and you do not need to apply it again.

To determine if your system is affected, check the File Version property of the assembly NetworkedPlanet.SharePoint in the GAC (browse to C:WindowsASSEMBLY, locate the NetworkedPlanet.SharePoint assembly, right-click and choose Properties. The File Version can be found on the Version tab above Description and Copyright). This hotfix updates the File Version of the NetworkedPlanet.SharePoint assembly to 2.1.6.0 - if the file version shown is greater than or equal to 2.1.6.0, then you do not need to apply this hotfix.



<strong>Pre-Requisites</strong>



Upgrade to TMCore07 SP5 (if running an earlier version) to avoid issues with faceted search components in the SharePoint Module.

<h3 style="font-size: 1.17em;">Upgrade Instructions</h3>

1. <a title="NetworkedPlanet SharePoint Module 3.1 Hotfix 6" href="http://www.networkedplanet.com/download/SPModule/NetworkedPlanet.SharePoint.3.1.Hotfix6.zip">Download the Hotfix 6 package</a>.

2. The package is provided in a compressed ZIP file. Unzip the package on a machine in the server farm.

3. Upgrade the NPSharePoint.wsp solution. The exact command-line you use will depend on how you want to schedule the upgrade, but will be similar to:

<pre style="font: normal normal normal 12px/18px Consolas, Monaco, 'Courier New', Courier, monospace;">stsadm -o upgradesolution -name NPSharePoint.wsp -filename NPSharePoint.wsp -allowgacdeployment -allowcaspolicies -local</pre>

4. Restart IIS and Windows SharePoint Services Timer

<h3 style="font-size: 1.17em;"><strong>Change Log</strong></h3>

<ul>

	<li>ENHANCEMENT: Optimized update of associated topic fields to reduce the number of database writes required when saving a SharePoint list item.



Added more logging of SharePoint object close and disposal.</li>

	<li>ENHANCEMENT: Added check to ItemUpdated event receiver to check whether a double event was caused by a check-in. If so, do not do processing for check-in events.</li>

	<li>BUGFIX: Amended the site deletion code so that topics for sub sites are correctly marked as superceded if the site is the root site of a site collection. This allows the WebCleanUp timer task to successfully remove any topics of the superceded sites on its next run.</li>

	<li>BUGFIX: Site deletion - if a site deletion fails in SharePoint for any reason, the WebCleanUp 	timer task that runs 2 minutes after the delete event will now also check whether the site still exists and if so set the psi back to PUBLISHED.</li>

</ul>
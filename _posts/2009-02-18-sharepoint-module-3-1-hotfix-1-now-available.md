---
layout: post
title: SharePoint Module 3.1 Hotfix 1 now available
tag: hotfix
category: Product Announcements
tag: sharepoint module
category: TMCore SharePoint Module
author: kal
---
A new hotfix package is available for version 3.1 of the TMCore SharePoint Module. This package addresses a number of bugs and performance issues. The full change list can be found <a href="#changelog">below</a>.

<strong>Systems Affected</strong>

This hotfix should be applied to any installation of the TMCore SharePoint Module 3.1 downloaded before 18th Februart 2009. If you downloaded your copy of the software from our site on or after this date, the hotfix is included in the package and you do not need to apply it again.

To determine if your system is affected, check the File Version property of the assembly NetworkedPlanet.SharePoint in the GAC (browse to C:WindowsASSEMBLY, locate the NetworkedPlanet.SharePoint assembly, right-click and choose Properties. The File Version can be found on the Version tab above Description and Copyright). This hotfix updates the File Version of the NetworkedPlanet.SharePoint assembly to 2.1.1.0 - if the file version shown is greater than or equal to 2.1.1.0, then you do not need to apply this hotfix.

<div id="instructions">

<strong>Upgrade Instructions</strong>

<ol>

<li>Download the <a href="http://www.networkedplanet.com/download/spmodule/NetworkedPlanet.SharePoint.3.1.Hotfix1.zip">Hotfix1 package</a>.</li>

<li>The package is provided in a compressed ZIP file. Unzip the package on a machine in the server farm. The package contains the following files:

<ul>

<li>NPSharePoint.wsp. This is an updated copy of the SharePoint Solution package provided with the 3.1 release of the TMCore SharePoint Module.</li>

<li>NPOfficeServer.wsp. This is an updated copy of the SharePoint Solution package provided with the 3.1 release of the TMCore SharePoint Module.</li>

</ul>

<li>Use stsadm to upgrade the NPSharePoint.wsp and NPOfficeServer.wsp solutions on the server. The exact command-line you use will depend on how you want to schedule the upgrade, but in any case it must include the -allowgacdeployment option. A sample command line would be:<br/>

<code>stsadm -o upgradesolution -name NPSharePoint.wsp -filename NPSharePoint.wsp -local -allowgacdeployment</code><br/>

<code>stsadm -o upgradesolution -name NPOfficeServer.wsp -filename NPOfficeServer.wsp -local -allowgacdeployment</code><br/>

</li>

<li>After applying the solution updates it may be necessary to restart IIS.</li>

</ol>

</div>

<div id="changelog">

<strong>Change Log</strong>

<ul>

<li>BUGFIX: Fixed an error in the display of tag details for users other than the

current user.</li>

<li>

BUGFIX: Fixed an error in the Classification page that occurs when the ontology

contains one or more topic types with no name.</li>

</li>

</ul>

</div>


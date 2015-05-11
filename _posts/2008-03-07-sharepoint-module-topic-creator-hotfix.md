---
layout: post
title: SharePoint Module Topic Creator Hotfix
tag: hotfix
tag: sharepoint module
category: TMCore SharePoint Module
author: kal
---
A bug was discovered in the recently released TMCore SharePoint Module 3.0 that affects the Topic Creator selectors. This hotfix addresses that issue.

<strong>Systems Affected</strong>

This bug will occur on any installation of the TMCore SharePoint Module 3.0 downloaded before 8th March 2008. If you downloaded your copy of the software from our site on or after this date, the hotfix is included in the package and you do not need to apply it again.

To determine if your system is affected, check the File Version property of the assembly NetworkedPlanet.SharePoint in the GAC (browse to C:WindowsASSEMBLY, locate the NetworkedPlanet.SharePoint assembly, right-click and choose Properties. The File Version can be found on the Version tab above Description and Copyright). This bug affects File Version 2.0.0.0 of this file.

<strong>Symptoms</strong>

The bug shows up when the user clicks on the a configured Topic Creator link from a related topics field. A dialog window appears, but no content is displayed in the window.

<strong>Fix Procedure</strong>

<ol>

<li>Download the <a href="http://www.networkedplanet.com/download/spmodule/NetworkedPlanet.SharePoint.3.0.Hotfix1.zip">Hotfix1 package</a>.</li>

<li>The package is provided in a compressed ZIP file. Unzip the package on a machine in the server farm. The package contains a single file named NPSharePoint.wsp. This is an updated copy of the SharePoint Solution package provided with the 3.0 release of the TMCore SharePoint Module.</li>

<li>Use stsadm to upgrade the NPSharePoint.wsp solution on the server. The exact command-line you use will depend on how you want to schedule the upgrade, but in any case it must include the -allowgacdeployment option. A sample command line would be:<br/><code>stsadm -o upgradesolution -name NPSharePoint.wsp -filename NPSharePoint.wsp -local -allowgacdeployment</code></li>

<li>After applying this update it may be necessary to restart IIS.</li>

</ol>

If you have any questions about this hotfix or require any further support, please contact us at support@networkedplanet.com.


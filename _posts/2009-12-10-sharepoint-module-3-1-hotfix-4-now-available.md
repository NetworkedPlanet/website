---
layout: post
title: SharePoint Module 3.1 Hotfix 4 now available
tag: hotfix
tag: module
category: Product Announcements
tag: releases
tag: sharepoint module
tag: spmodule
author: jen
---
A new hotfix package is available for version 3.1 of the TMCore SharePoint Module. This package addresses a small number of bugs and provides new features. The full change list can be found below.

<h3>Systems Affected</h3>

This hotfix should be applied to any installation of the TMCore SharePoint Module 3.1 downloaded before 10th December 2009. If you downloaded your copy of the software from our site on or after this date, the hotfix is included in the package and you do not need to apply it again.

To determine if your system is affected, check the File Version property of the assembly NetworkedPlanet.SharePoint in the GAC (browse to C:WindowsASSEMBLY, locate the NetworkedPlanet.SharePoint assembly, right-click and choose Properties. The File Version can be found on the Version tab above Description and Copyright). This hotfix updates the File Version of the NetworkedPlanet.SharePoint assembly to 2.1.4.0 - if the file version shown is greater than or equal to 2.1.4.0, then you do not need to apply this hotfix.

<h3>Upgrade Instructions</h3>

1. <a title="NetworkedPlanet SharePoint Module 3.1 Hotfix 4" href="http://www.networkedplanet.com/download/SPModule/NetworkedPlanet.SharePoint.3.1.Hotfix4.zip">Download the Hotfix 4 package</a>.

2. The package is provided in a compressed ZIP file. Unzip the package on a machine in the server farm.

3. Upgrade the NPSharePoint.wsp solution. The exact command-line you use will depend on how you want to schedule the upgrade, but will be similar to:

<pre>stsadm -o upgradesolution -name NPSharePoint.wsp -filename NPSharePoint.wsp -allowgacdeployment -allowcaspolicies -local</pre>

4. Upgrade the NPOfficeServer.wsp solution. Use the following STSADM command:

<pre>stsadm -o upgradesolution -name NPOfficeServer.wsp -filename NPOfficeServer.wsp -allowgacdeployment -allowcaspolicies -local</pre>

5. Run the following stsadm command:

<pre style="font: normal normal normal 12px/18px Consolas, Monaco, 'Courier New', Courier, monospace;">stsadm -o copyappbincontent</pre>

6. Restart IIS and Windows SharePoint Services Timer

7. Reactivate the NPDiagnostics feature by running the stsadm command:

<pre>stsadm -o activatefeature -name NPDiagnostics -force</pre>

8. Upgrade Enterprise Services to the version included with the hotfix, the new version of Enterprise Services is 1.1.2.0



9. Restart the Topic Map Index Service

<h3><strong>Change Log</strong></h3>

<ul>

	<li>BUGFIX: One hop and two hop web parts were intermittently returning Deadlock errors. These have

now been changed to sleep and retry up to a maximum of three times when encountering

deadlock issues with the database.</li>

	<li>ENHANCEMENT: Url Mappings can now feature more than one publish URL for a web application by using

the zones set up when extending the SharePoint web application.</li>

	<li>ENHANCEMENT: Additional diagnostic logging has been added to Url Mapping. The <strong>NPDiagnostics

feature must be reactivated on the farm</strong> for this to take affect.</li>

	<li>FEATURE: The stsadm remapurls command now has an optional parameter which when used skips the url

remapping on content type to topic type mappings.</li>

	<li>NOTE: The new hotfix of Enterprise Services has been included with this hotfix. This fixes issues with

results display and ordering when using advanced faceted search restriction sets.</li>

</ul>
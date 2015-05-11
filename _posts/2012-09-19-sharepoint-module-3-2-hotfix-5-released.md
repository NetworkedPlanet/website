---
layout: post
title: SharePoint Module 3.2 Hotfix 5 released
tag: hotfix
category: Product Announcements
tag: sharepoint module
author: jen
---
<div id="_mcePaste">A new hotfix package is available for version 3.2 of the TMCore SharePoint Module.</div>

<div><strong>Systems Affected</strong></div>

This hotfix should be applied to any installation of the TMCore SharePoint Module 3.2 downloaded before 19th September 2012. If you downloaded your copy of the software from our site on or after this date, the hotfix is included in the package and you do not need to apply it again.



To determine if your system is affected, check the File Version property of the assembly NetworkedPlanet.SharePoint in the GAC (browse to C:\Windows\ASSEMBLY, locate the NetworkedPlanet.SharePoint assembly, right-click and choose Properties. The File Version can be found on the Version tab above Description and Copyright). This hotfix updates the File Version of the NetworkedPlanet.SharePoint assembly to 2.2.5.0 - if the file version shown is greater than or equal to 2.2.5.0, then you do not need to apply this hotfix.



<strong>Upgrade Instructions</strong>



1. Download the hotfix 5 package for <a href="http://www.networkedplanet.com/download/spmodule/NetworkedPlanet.SharePoint.3.2.Hotfix5_2007.zip">SharePoint 2007</a> or <a href="http://www.networkedplanet.com/download/spmodule/NetworkedPlanet.SharePoint.3.2.Hotfix5_2010.zip">SharePoint 2010</a>.



2. The package is provided in a compressed ZIP file. Unzip the package on a machine in the server farm.



3. Upgrade the NPSharePoint.wsp solution. The exact command-line you use will depend on how you want to schedule the upgrade, but will be similar to:

<pre>stsadm -o upgradesolution -name NPSharePoint.wsp -filename NPSharePoint.wsp -allowgacdeployment -allowcaspolicies -local</pre>

4. Upgrade the NPOfficeServer.wsp solution. Use the following STSADM command:

<pre>stsadm -o upgradesolution -name NPOfficeServer.wsp -filename NPOfficeServer.wsp -allowgacdeployment -allowcaspolicies -local</pre>

5. Restart IIS and Windows SharePoint Services Timer



<strong>Change Log</strong>



BUGFIX: Fixed a false negative being returned in the SynchronizationTask and ProfileScraperTask when site collection URLs were part of an Alternate Access Mapping within the timer job's Web Application
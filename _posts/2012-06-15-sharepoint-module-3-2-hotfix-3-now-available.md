---
layout: post
title: SharePoint Module 3.2 Hotfix 3 now available
tag: hotfix
category: Product Announcements
tag: sharepoint module
category: TMCore SharePoint Module
author: jen
---
<div id="_mcePaste" style="position: absolute; left: -10000px; top: 0px; width: 1px; height: 1px; overflow-x: hidden; overflow-y: hidden;">A new hotfix package is available for version 3.2 of the TMCore SharePoint Module. This package addresses a small number of bugs and enhancements. The full change list can be found below.</div>

<div id="_mcePaste" style="position: absolute; left: -10000px; top: 0px; width: 1px; height: 1px; overflow-x: hidden; overflow-y: hidden;">Systems Affected</div>

<div id="_mcePaste" style="position: absolute; left: -10000px; top: 0px; width: 1px; height: 1px; overflow-x: hidden; overflow-y: hidden;">This hotfix should be applied to any installation of the TMCore SharePoint Module 3.2 downloaded before 20th August 2010. If you downloaded your copy of the software from our site on or after this date, the hotfix is included in the package and you do not need to apply it again.</div>

<div id="_mcePaste" style="position: absolute; left: -10000px; top: 0px; width: 1px; height: 1px; overflow-x: hidden; overflow-y: hidden;">To determine if your system is affected, check the File Version property of the assembly NetworkedPlanet.SharePoint in the GAC (browse to C:WindowsASSEMBLY, locate the NetworkedPlanet.SharePoint assembly, right-click and choose Properties. The File Version can be found on the Version tab above Description and Copyright). This hotfix updates the File Version of the NetworkedPlanet.SharePoint assembly to 2.2.1.0 - if the file version shown is greater than or equal to 2.2.1.0, then you do not need to apply this hotfix.</div>

<div id="_mcePaste" style="position: absolute; left: -10000px; top: 0px; width: 1px; height: 1px; overflow-x: hidden; overflow-y: hidden;">Upgrade Instructions</div>

<div id="_mcePaste" style="position: absolute; left: -10000px; top: 0px; width: 1px; height: 1px; overflow-x: hidden; overflow-y: hidden;">1. Download the hotfix 1 package for SharePoint 2007 or SharePoint 2010.</div>

<div id="_mcePaste" style="position: absolute; left: -10000px; top: 0px; width: 1px; height: 1px; overflow-x: hidden; overflow-y: hidden;">2. The package is provided in a compressed ZIP file. Unzip the package on a machine in the server farm.</div>

<div id="_mcePaste" style="position: absolute; left: -10000px; top: 0px; width: 1px; height: 1px; overflow-x: hidden; overflow-y: hidden;">3. Upgrade the NPSharePoint.wsp solution. The exact command-line you use will depend on how you want to schedule the upgrade, but will be similar to:</div>

<div id="_mcePaste" style="position: absolute; left: -10000px; top: 0px; width: 1px; height: 1px; overflow-x: hidden; overflow-y: hidden;">stsadm -o upgradesolution -name NPSharePoint.wsp -filename NPSharePoint.wsp -allowgacdeployment -allowcaspolicies -local</div>

<div id="_mcePaste" style="position: absolute; left: -10000px; top: 0px; width: 1px; height: 1px; overflow-x: hidden; overflow-y: hidden;">4. Upgrade the NPOfficeServer.wsp solution. Use the following STSADM command:</div>

<div id="_mcePaste" style="position: absolute; left: -10000px; top: 0px; width: 1px; height: 1px; overflow-x: hidden; overflow-y: hidden;">stsadm -o upgradesolution -ame NPOfficeServer.wsp -filename NPOfficeServer.wsp -allowgacdeployment -allowcaspolicies -local</div>

<div id="_mcePaste" style="position: absolute; left: -10000px; top: 0px; width: 1px; height: 1px; overflow-x: hidden; overflow-y: hidden;">5. Restart IIS and Windows SharePoint Services Timer</div>

<div id="_mcePaste" style="position: absolute; left: -10000px; top: 0px; width: 1px; height: 1px; overflow-x: hidden; overflow-y: hidden;">Change Log</div>

<div id="_mcePaste" style="position: absolute; left: -10000px; top: 0px; width: 1px; height: 1px; overflow-x: hidden; overflow-y: hidden;">ENHANCEMENT: Stored procedures for OneHop and TwoHop Query Web Parts were updated toimprove concurrency. There was no change to the interfaces for these stored procedures.</div>

<div id="_mcePaste" style="position: absolute; left: -10000px; top: 0px; width: 1px; height: 1px; overflow-x: hidden; overflow-y: hidden;">ENHANCEMENT: An optional property can now be used to delay processing of the profilescraper. The property sets a sleep period in milliseconds between each profile changebeing processed.</div>

<div id="_mcePaste" style="position: absolute; left: -10000px; top: 0px; width: 1px; height: 1px; overflow-x: hidden; overflow-y: hidden;">BUGFIX: Reduced the amount of SharePOint ItemUpdated events that are fired when an itemis deleted which is associated to other SharePoint items.</div>

<div id="_mcePaste" style="position: absolute; left: -10000px; top: 0px; width: 1px; height: 1px; overflow-x: hidden; overflow-y: hidden;">ENHANCEMENT: Optimised code to ensure references to the NPCL schema are usingcached schema whenever needed.</div>

<div id="_mcePaste" style="position: absolute; left: -10000px; top: 0px; width: 1px; height: 1px; overflow-x: hidden; overflow-y: hidden;">BUGFIX: Associated Topic Field Control was disposing of an active Web object</div>

<div id="_mcePaste" style="position: absolute; left: -10000px; top: 0px; width: 1px; height: 1px; overflow-x: hidden; overflow-y: hidden;">ENHANCEMENT: The profile scraper has been optimised to avoid unnecessary lookups ofuser topics in order to pass these topic ids to any custom profile scraper plug-ins.</div>

A new hotfix package is available for version 3.2 of the TMCore SharePoint Module.



<strong>Systems Affected</strong>



This hotfix should be applied to any installation of the TMCore SharePoint Module 3.2 downloaded before 15th June 2012. If you downloaded your copy of the software from our site on or after this date, the hotfix is included in the package and you do not need to apply it again.



To determine if your system is affected, check the File Version property of the assembly NetworkedPlanet.SharePoint in the GAC (browse to C:WindowsASSEMBLY, locate the NetworkedPlanet.SharePoint assembly, right-click and choose Properties. The File Version can be found on the Version tab above Description and Copyright). This hotfix updates the File Version of the NetworkedPlanet.SharePoint assembly to 2.2.3.0 - if the file version shown is greater than or equal to 2.2.3.0, then you do not need to apply this hotfix.



<strong>Upgrade Instructions</strong>



1. Download the hotfix 3 package for <a href="http://www.networkedplanet.com/download/spmodule/NetworkedPlanet.SharePoint.3.2.Hotfix3_2007.zip">SharePoint 2007</a> or <a href="http://www.networkedplanet.com/download/spmodule/NetworkedPlanet.SharePoint.3.2.Hotfix3_2010.zip">SharePoint 2010</a>.



2. The package is provided in a compressed ZIP file. Unzip the package on a machine in the server farm.



3. Upgrade the NPSharePoint.wsp solution. The exact command-line you use will depend on how you want to schedule the upgrade, but will be similar to:

<pre>stsadm -o upgradesolution -name NPSharePoint.wsp -filename NPSharePoint.wsp -allowgacdeployment -allowcaspolicies -local</pre>

4. Upgrade the NPOfficeServer.wsp solution. Use the following STSADM command:

<pre>stsadm -o upgradesolution -name NPOfficeServer.wsp -filename NPOfficeServer.wsp -allowgacdeployment -allowcaspolicies -local</pre>

5. Restart IIS and Windows SharePoint Services Timer



<strong>Change Log</strong>



BUGFIX: Hierarchy topic selector was experiencing a javascript error when topic names contained apostrophes
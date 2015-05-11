---
layout: post
title: SharePoint Module Hotfix 4 Now Available
tag: hotfix
tag: sharepoint module
category: TMCore SharePoint Module
author: kal
---
A new hotfix package is available for version 3.0 of the TMCore SharePoint Module. This package addresses a number of bugs and performance issues. The full change list can be found <a href="#changelog">below</a>.

<strong>Systems Affected</strong>

This hotfix should be applied to any installation of the TMCore SharePoint Module 3.0 downloaded before 2nd June 2008. If you downloaded your copy of the software from our site on or after this date, the hotfix is included in the package and you do not need to apply it again.

To determine if your system is affected, check the File Version property of the assembly NetworkedPlanet.SharePoint in the GAC (browse to C:WindowsASSEMBLY, locate the NetworkedPlanet.SharePoint assembly, right-click and choose Properties. The File Version can be found on the Version tab above Description and Copyright). This hotfix updates the File Version of the NetworkedPlanet.SharePoint assembly to 2.0.0.4 - if the file version shown is greater than or equal to 2.0.0.4, then you do not need to apply this hotfix.

<strong>Installation Instructions</strong>

<ol>

<li>Download the <a href="http://www.networkedplanet.com/download/spmodule/NetworkedPlanet.SharePoint.3.0.Hotfix4.zip">Hotfix4 package</a>.</li>

<li>The package is provided in a compressed ZIP file. Unzip the package on a machine in the server farm. The package contains the following files:

<ul>

<li>NPSharePoint.wsp. This is an updated copy of the SharePoint Solution package provided with the 3.0 release of the TMCore SharePoint Module.</li>

<li>NPOfficeServer.wsp. This is an updated copy of the SharePoint Solution package provided with the 3.0 release of the TMCore SharePoint Module.</li>

</ul>

<li>Use stsadm to upgrade the NPSharePoint.wsp and NPOfficeServer.wsp solutions on the server. The exact command-line you use will depend on how you want to schedule the upgrade, but in any case it must include the -allowgacdeployment option. A sample command line would be:<br/>

<code>stsadm -o upgradesolution -name NPSharePoint.wsp -filename NPSharePoint.wsp -local -allowgacdeployment</code><br/>

<code>stsadm -o upgradesolution -name NPOfficeServer.wsp -filename NPOfficeServer.wsp -local -allowgacdeployment</code><br/>

</li>

<li>After applying the solution updates it may be necessary to restart IIS.</li>

<li>If you have installed the NPCL Editor Extensions for the TMCore SharePoint Module,

copy the contents of the NPCLEditorExtensions directory to the extensions

installation directory for NPCL Editor. The path to the extensions directory

will depend on your installation but will typically be either:

<code>C:Documents and SettingsAll UsersApplication DataNetworkedPlanetNPCLEditorExtensions</code> or

<code>C:Documents and Settings{User Name}Application DataNetworkedPlanetNPCLEditorExtensions</code>

</li>

</ol>

<a name="changelog"><strong>Change Log</strong></a>

<ul>

<li>DOCS: Added documentation of the list Auto-classification feature to the Site

Developers Guide.</li>

<li>BUGFIX: _ITEM_URL_ column now returns the correct URL for links to items on

nested sites.</li>

<li>BUGFIX[695]: Fixed a security exception in the ItemDeleted event handler that

could cause topics to not get deleted from the topic map when the

item is deleted via a site that uses forms-based authentication.</li>

<li>BUGFIX: Fixed content type mapping lookup to take account of URL mappings in

NPUrlMap.xml. This means that when using extended sites, there is now

no need to duplicate the content type mappings.</li>

<li>BUGFIX: Fixed reporting of TopicMapIndexClient connection errors to include

stack trace.</li>

<li>BUGFIX[685]: Fixed CustomAction Id clash that occasionally caused ASP.NET

errors when displaying List Settings on a site with the

NPClassification feature enabled.</li>

<li>BUGFIX[690]: Fixed the login dialog for the NPCL Editor extensions to accept

user names in the traditional &lt;domain>&lt;user> form instead of

&lt;domain>/&lt;user></li>

<li>ENHANCEMENT: Web parts and AssociatedTopicsFields now use a common cache for

context topics during page request processing. This will reduce

the number of database queries required to display pages/list

items that have multiple query web parts or multiple related

topics fields on them.</li>

</ul>

This hotfix also rolls in the fixes previously provided in <a href="http://www.networkedplanet.com/sharepoint-module-topic-creator-hotfix/" title="Hotfix 1">Hotfix 1</a>, <a href="http://www.networkedplanet.com/sharepoint-module-hotfix-2/" title="SharePoint Module Hotfix 2">Hotfix 2</a>, and <a href="http://www.networkedplanet.com/sharepoint-module-hotfix-3-now-available/" title="SharePoint Module Hotfix 3 Now Available">Hotfix 3</a>.

<strong>For Further Support</strong>

If you have any questions about this hotfix or require any further support, please contact us at support@networkedplanet.com.


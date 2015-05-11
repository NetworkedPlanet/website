---
layout: post
title: SharePoint Module Hotfix 2
tag: hotfix
tag: sharepoint module
category: TMCore SharePoint Module
author: kal
---
A new hotfix package is available for version 3.0 of the TMCore SharePoint Module. This package addresses a number of bugs and provides a couple of additional enhancements for site developers. The full change list can be found <a href="#changelog">below</a>.

<strong>Systems Affected</strong>

This bug will occur on any installation of the TMCore SharePoint Module 3.0 downloaded before 21st March 2008. If you downloaded your copy of the software from our site on or after this date, the hotfix is included in the package and you do not need to apply it again.

To determine if your system is affected, check the File Version property of the assembly NetworkedPlanet.SharePoint in the GAC (browse to C:WindowsASSEMBLY, locate the NetworkedPlanet.SharePoint assembly, right-click and choose Properties. The File Version can be found on the Version tab above Description and Copyright). This hotfix updates the File Version of the NetworkedPlanet.SharePoint assembly to 2.0.0.2 - if the file version shown is greater than or equal to 2.0.0.2, then you do not need to apply this hotfix.

<strong>Installation Instructions</strong>

<ol>

<li>Download the <a href="http://www.networkedplanet.com/download/spmodule/NetworkedPlanet.SharePoint.3.0.Hotfix2.zip">Hotfix2 package</a>.</li>

<li>The package is provided in a compressed ZIP file. Unzip the package on a machine in the server farm. The package contains the following files:

<ul>

<li>NPSharePoint.wsp. This is an updated copy of the SharePoint Solution package provided with the 3.0 release of the TMCore SharePoint Module.</li>

<li>NPOfficeServer.wsp. This is an updated copy of the SharePoint Solution package provided with the 3.0 release of the TMCore SharePoint Module.</li>

<li>Docs. This directory contains the updated Site Developers Guide documentation.</li>

<li>Stylesheets. This directory contains the updated base stylesheets for site developers.</li>

<li>NPCLEditor. This directory contains the updated NPCL Schema Editor extensions for the TMCore SharePoint Module</li>

</ul>

<li>Use stsadm to upgrade the NPSharePoint.wsp and NPOfficeServer.wsp solutions on the server. The exact command-line you use will depend on how you want to schedule the upgrade, but in any case it must include the -allowgacdeployment option. A sample command line would be:<br/>

<code>stsadm -o upgradesolution -name NPSharePoint.wsp -filename NPSharePoint.wsp -local -allowgacdeployment</code><br/>

<code>stsadm -o upgradesolution -name NPOfficeServer.wsp -filename NPOfficeServer.wsp -local -allowgacdeployment</code><br/>

</li>

<li>After applying the solution updates it may be necessary to restart IIS.</li>

<li>To install the updates to the NPCL Schema Editor extensions, simply copy the contents of the NPCLEditorExtensions directory to the local extensions directory on your development machine (typically <code>C:Documents and SettingsAll UsersApplication Data

NetworkedPlanetNPCLEditorExtensions</code>).</li>

</ol>

<a name="changelog"><strong>Change Log</strong></a>

<ul>

<li>BUGFIX: TwoHopQueryWebPart is now properly security filtering both the

TargetTopic and the ViaTopic.

</li><li>BUGFIX: Modified the sample TwoHopQueryWebPart stylesheets so that they

render in a meaningful way even if there is no CSS associated with their CSS

class. Each grouped list now renders as a &lt;strong> tag  wrapped around the

group header and a &lt;ul> containing &lt;li> tags for each member of the group

</li><li>

BUGFIX: Fixed an error in the EnterpriseServices.SocialTagging module that

caused the creation of a new tag to take a long time to complete. Creating new

tags in the social tagging web parts should now be much faster.

</li><li>

BUGFIX: Fixed the ItemAdded event handler to ensure proper completion when the

NPItemBase feature is not activated.

</li><li>

BUGFIX: Topic names for topics that represent SharePoint list items are now

generated from the formatted representation of the SharePoint field configured

by the Topic Type Mapping. This change ensures that calculated fields are

rendered as just their formatted string value.

</li><li>

BUGFIX: Fixed rendering of Source attributes in Related Topics Field links in

views to render a full URL rather than a web-relative URL.

</li><li>ENHANCEMENTS: Enhancements made to the NPCL Schema Editor Extensions to ensure

more consistent editing of features that are already deployed to a server. The

enhancements should make it much easier to update a test deployment of features

generated using the NPCL Schema Editor extensions.

</li><li>ENHANCEMENT: Modified the Associated Topic Field properties editor to allow

the name of the form used by a Topic Creator to be entered in a text field

rather than chosen from a drop-down list of forms. This enables the use of

forms other than those contained in the list (e.g. forms from _layouts)

for the creation of items.

</li>

</ul>

This hotfix also rolls in the fixes previously provided in <a href="http://www.networkedplanet.com/sharepoint-module-topic-creator-hotfix/">Hotfix1</a>.

<strong>For Further Support</strong>

If you have any questions about this hotfix or require any further support, please contact us at support@networkedplanet.com.


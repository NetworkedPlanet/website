---
layout: post
title: TMCore SharePoint Module 3.0 Known Issues, Fixes and Workarounds
tag: bug
tag: sharepoint module
category: TMCore SharePoint Module
author: kal
---
<!-- How to edit this file:

Create a new row in the table, use the style "workaround" (yellow), "fixed" (green) or "bug" (red) on the row (tr).

-->

<h1>TMCore SharePoint Module 3.0 Known Issues, Fixes and Workarounds</h1>

<p>This blog entry is used to record and document known issues found with the

TMCore SharePoint Module version 3.0 and their current status.</p>

<p>If you discover an issue with the TMCore SharePoint Module that is not listed here, then please 	report it to us at <a href="mailto:support@networkedplanet.com">support@networkedplanet.com</a>.</p>

<table class="releasenotes" cellpadding="5px" cellspacing="0px">

<thead>

<tr>

<th>Ref.</th><th>Issue</th></th><th>Resolution</th>

</tr>

</thead>

<tbody>

<tr class="workaround">

<td valign="top">690</td>

<td valign="top">

<b>Cannot connect to SharePoint site from the NPCL editor.</b><br/>

<p>

When using the NPCL Editor Extensions provided with the TMCore SharePoint Module to map topic types in the ontology to content types, you may be presented with a log-in dialog to connect to the SharePoint site to retrieve a list of content types or field types. If you are connecting to the SharePoint site as a domain user, the dialog requires a domain and user name to log in, you must enter this full log-in name in the form <i>domain/user</i>, rather than the more usual <i>domainuser</i> form.

</p>

<p>NOTE: From Hotfix 4 for the TMCore SharePoint Module, this fix will be included in the installation package.</p>

</td>

<td valign="top">Workaround: Enter your log-in name in the form <i>domain/user</i>.</td>

</tr>

<tr class="workaround">

<td valign="top">685</td>

<td valign="top">

<b>ASP.NET Error when attempting to enable List Auto-classification</b><br/>

<p>When using the link from a List Settings page to enable Auto-classification on the list, you may encounter the following ASP.NET error:</p>

<pre>

Multiple controls with the same ID

'ctl00$PlaceHolderMain$ctl05$ctl01$RptControls$EnableAutoClassification' were

found. Trace requires that controls have unique IDs.

</pre>

<p>This error message is caused because two different elements of the NPClassification feature accidently use the same Id value. To fix this on an existing installation, follow these steps on each server in the server farm:</p>

<ol>

<li>Locate the NPClassification feature directory. It will be under the SharePoint 12 directory (12TEMPLATEFEATURESNPClassification).</li>

<li>Using Notepad or another text editor, open the file ListClassificationFeatureElements.xml</li>

<li>On the <code>CustomAction</code> element, change the value of the <code>Id</code> attribute from <code>EnableAutoClassification</code> to <code>ClassifyList</code>.</li>

<li>Save the XML file and restart IIS.</li>

</ol>

<p>NOTE: From Hotfix 4 for the TMCore SharePoint Module, this fix will be included in the installation package.</p>

</td>

</tr>

</tbody>

</table>


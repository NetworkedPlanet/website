---
layout: post
title: TMCore07 SP3 Known Issues, Fixes and Workarounds
tag: bug
category: TMCore
tag: tmcore
author: gra
---
<!-- How to edit this file:

Create a new row in the table, use the style "workaround" (yellow), "fixed" (green) or "bug" (red) on the row (tr).

-->

<h1>TMCore07 SP3 Known Issues, Fixes and Workarounds</h1>

<p>This blog entry is used to record and document known issues found with TMCore07

SP3 edition and their current status.</p>

<p>If you discover an issue with TMCore07 SP3 that is not listed here, then please

report it to us at <a href="mailto:support@networkedplanet.com">support@networkedplanet.com</a>.</p>

<table class="releasenotes" cellpadding="5px" cellspacing="0px">

<thead>

<tr>

<th>Ref.</th><th>Issue</th></th><th>Resolution</th>

</tr>

</thead>

<tbody>

<tr class="workaround">

<td valign="top">634, 635, 636</td>

<td valign="top">The <code>web.config</code> files supplied with TMService, NPCL-WS and TMEditor declare a log4net configuration section named <code>NetworkedPlanet.&lt;application name&gt;.log4net</code>. Log4net requires that the configuration section is named <code>log4net</code> therefore any log4net configuration information specified using the existing names will be ignored.</td>

<td valign="top">The TMCore07 SP3 installer has been updated (on 3rd December 2007) to fix this issue.  For installations created with an installer downloaded prior to this date, this issue can be manually fixed simply by renaming the section in the <code>web.config</code> files.</td>

</tr>

</tbody>

</table>


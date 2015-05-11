---
layout: post
title: Web3 2.0 Javascript Hotfix
tag: hotfix
tag: web3
category: Web3 Platform
author: kal
---
A new hotfix for Web3 2.0 has just been released to correct some problems with cross-browser compatibility in the topic map editor application. This hotfix addresses the following issues:

<ul>

	<li>BUGFIX: Editing hierarchy subject identifiers in IE9 was resulting in an invalid URI as the behaviour of that browser is to wrap strings recognized as URLs in an HTML &lt;A&gt; tag.</li>

	<li>FEATURE: Added facility for deleting a hierarchy definition from within the Topic Map Editor. This can be accessed by selecting the hierarchy from the Hierarchies panel and then clicking on the trash-can icon at the top of the middle panel. Deleting a hierarchy definition removes only the definition, not the associations that make up the hierarchy.</li>

</ul>

<h3>Download</h3>

The new hotfix can be downloaded from <a title="Download the Hotfix" href="http://www.networkedplanet.com/download/download.aspx?file=web3/2.0Hotfix1/Web3_2.0_ServerHotfix.zip">http://www.networkedplanet.com/download/download.aspx?file=web3/2.0Hotfix1/Web3_2.0_ServerHotfix.zip</a>

<h3>Installation</h3>

<ol>

	<li>Download the hotfix ZIP file using the link above.</li>

	<li>Unzip the file to a temporary directory.</li>

	<li>The hotfix consists of two directories of files - css and js. Copy these two directories to the Web3 server directory (typically C:Program FilesNetworkedPlanetWeb3Server), overwriting the contents of the existing css and js directories.</li>

	<li>After applying this hotfix a client browsing the site may need to use a force refresh (ctrl-F5 or ctrl-R) to ensure that the browser picks up the updated Javascript and CSS.</li>

</ol>

<h3>Relevant Versions</h3>

This hotfix is only provided and test for Web3 2.0.
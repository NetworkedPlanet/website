---
layout: post
title: SharePoint Module Related Topics Fields display "#VERDI!"
tag: sharepoint module
tag: tip
category: TMCore SharePoint Module
author: kal
---
This note applies to version 2.0 of the TMCore SharePoint Module.

<strong>Problem</strong>

It has been reported that in Norwegian language installations of the TMCore SharePoint Module, when a Related Topics Field is displayed in a list view, the column renders an unexpected value string "#VERDI!". This issue has been tracked down to the CAML rendering for Related Topics Fields and a fix can be implemented quite easily.

<strong>Fix</strong>

To fix this problem:

<ol>

<li>Locate the file fldtypes_topicmap.xml. This file will be in the 12TEMPLATESXML directory of your SharePoint installation (typically C:Program FilesCommon FilesMicrosoft Sharedweb server extensions12TEMPLATESXMLfldtypes_topicmap.xml).</li>

<li>Open the file in a text editor application such as Notepad or Visual Studio and replace all instances of the string #VALUE! with the string #VERDI!. There should be three such instances to replace.</li>

<li>Save the file and restart IIS to force a re-read of the configuration file.</li>

</ol>


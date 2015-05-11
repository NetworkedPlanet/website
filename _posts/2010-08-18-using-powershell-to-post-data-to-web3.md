---
layout: post
title: Using PowerShell To POST Data to Web3
tag: powershell
category: Theory and Practice
tag: tip
tag: web3
category: Web3 Platform
author: kal
---
Sometimes it is useful to be able to use PowerShell to manipulate a Web3 instance - either because you are scripting a set of batch operations or because you are just in PS at the time and it saves swapping contexts.



POSTing data to a REST service with PS is really easy, the only small wrinkle with Web3 is the need to authenticate with the server. Assuming you are using the default Windows Authentication setup for your Web3 server, the following set of commands should get the job done:



$wc=New-Object System.Net.WebClient

$cred=Get-Credential

$wc.Credentials=$cred

$wc.UploadString($URI, $CONTENT)



The Get-Credential cmdlet will pop-up a dialog prompting for your username and password - if anyone knows of a way to avoid that please let me know! If you need to load the content from a file, use the Get-Content cmdlet.
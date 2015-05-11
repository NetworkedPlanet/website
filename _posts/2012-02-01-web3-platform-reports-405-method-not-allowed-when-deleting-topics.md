---
layout: post
title: Web3 Platform reports '405 method not allowed' when deleting topics
tag: tip
tag: web3
category: Web3 Platform
author: gra
---
If when trying to delete topics in the Web3 Platform causes an error message '405 method not allowed' to be reported, this is most likely due to the WebDAV module being installed in IIS. WebDAV is not supported by the Web3 Platform and should be removed from the IIS site.

To remove WebDAV, open the site in the IIS Features panel and open the Modules feature. Select the WebDAV module if it is installed and choose the Remove action. Restart the site and check that topics can now be deleted.
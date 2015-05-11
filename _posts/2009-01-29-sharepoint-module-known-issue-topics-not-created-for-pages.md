---
layout: post
title: SharePoint Module Known Issue - Topics not created for Pages
tag: bug
tag: sharepoint module
category: TMCore SharePoint Module
author: kal
---
We recently received a bug report from one of our customers about the SharePoint Module not creating a topic when a new page was created in a Page Library. Normally, topics are created whenever an item is added to a list using SharePoint's ItemAdded event. However  in this case the ItemAdded event handler was failing and so the topic was not created. Further investigation revealed that the ItemAdded event handler was not receiving the correct event information - in particular the reference to the new list item was null. This means that our event handler cannot determine the identity of the new list item and so cannot create a topic.

It turns out that this is an issue that has been hit by a number of people and not something directly related to the operation of the SharePoint Module itself. Until Microsoft correct this behaviour the only workaround available for this issue is to edit the item or its properties after creating it. Editing the item will force an ItemUpdated event which does contain the correct event properties and the topic will then be created.


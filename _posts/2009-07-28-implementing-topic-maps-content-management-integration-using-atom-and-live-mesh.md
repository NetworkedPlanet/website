---
layout: post
title: Implementing Topic Maps Content Management Integration using Atom and Live Mesh
tag: atom
category: Theory and Practice
tag: topic maps
author: gra
---
One of the most common scenarios for Topic Maps is to use them as the primary paradigm for organising, classifying and finding content in a content management system. The basic strategy involved in these integrations is to create topics for each content item in the CMS and then associate the content topics to other topics in the the topic map. We call this process  'content item proxification and classification'. This builds up a nice graph that can then be exploited in search and navigation controls either within the CMS or as part of some other publishing process.

The key to making this work is to somehow hook into what is happening within the CMS so that the topic map view of the content items correctly reflects things in the CMS. i.e. if a document is deleted its topic shouldn't show up in the topicmap.

The integrations we have done for EPiServer and SharePoint have taken the approach of event handlers installed into the CMS product. This means that as things happen in the CMS our handlers are notified and can ensure that the topic map is in a consistent state.

However, more and more, we are looking at online content systems, and how to integrate these content stores with Topic Maps systems.The following sections discuss a generic pull approach to synchronisation and then give some detailed insights into implementing this approach with Live Mesh. Live Mesh is an online service from Microsoft for collborating, file syncing and generally supporting dynamic ad-hoc work groups. It is of course missing a powerful metadata management and classification aspect.

OK, so first up is the general notion of a pull based approach to integrating a Topic Maps system with a CMS. This approach was inspired by the TMShare protocol that was developed at CEN. This was an Atom based protocol that published a feed of changes that had occurred inside the system. A client could process this feed to get the current state of each item that had changed. Note: this approach didn't say what had changed, just that a given topic has changed and here was the address of its representation. The client could then update its local store to be aligned with the 'server' node.

So, instead of syncing between two topic maps this approach looks to sync the Atom feed from Live Mesh into a topicmap.

The Live Mesh environment consists of an online virtual folder and file hierarchy and optionally corresponding syncronised folders on multiple devices. However, when synced all the 'actions' performed can be found in an Atom feed for each users' Mesh. The news feed for a Mesh can be found at the following URL (note that the base of the URL will change as this is the CTP):

<code>

https://user-ctp.windows.net/V0.1/Mesh/News

</code>

This feed contains a series of entries. Each entry corresponds to some event that has occurred; such as a file being added or a folder deleted, renamed etc.

Our syncronising application runs as a background process on the users' machine. The process will fetch the feed of events and then update the topicmap accordingly (this topic map could be local or in some online Topic Maps service). In a local TMCore instance I have already set up an ontology consisting of File, Folder, Mesh Space, Concept and Person. The items in Mesh will map to their obvious counterparts in this ontology.

The TMShare protocol provides links to representations of things that have changed. The client is expected to pull the representation and update its local version. Mesh has a more transaction based approach where is lists the actions that have been performed. However, if a client application just sticks to doing changes rather than updating full representations then there is no way for a client to get back in sync if an event is lost or if some events simply are not published (except for an out of bound action). For this integration we consider each event to simply be a notification that a given Mesh entity has been updated / deleted. We then fetch that entity's Atom entry and from that update the topic representation. For most content management integrations we can accept some delay in getting in sync but we would like it to happen.

Drivin the sync process is the News feed. It contains an entry for each event that has occurred. Here is the basic structure of a 'Live Mesh Event Atom Entry':

<code>

&lt;entry>

&nbsp;&nbsp;&nbsp;&nbsp;&lt;id>urn:uuid:2979996d-57a0-e3c7-d7bd-b5f1a2b33bcb&lt;/id>

&nbsp;&nbsp;&nbsp;&nbsp;&lt;title&nbsp;type="text">LiveMesh.LiveFolderAdd&lt;/title>

&nbsp;&nbsp;&nbsp;&nbsp;&lt;published>2009-07-28T12:43:35Z&lt;/published>

&nbsp;&nbsp;&nbsp;&nbsp;&lt;updated>2009-07-28T12:43:35Z&lt;/updated>

&nbsp;&nbsp;&nbsp;&nbsp;&lt;author>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;name>Graham&nbsp;Moore&lt;/name>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;uri>email-graham_moore@live.com/Profiles&lt;/uri>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;email>graham_moore@live.com&lt;/email>

&nbsp;&nbsp;&nbsp;&nbsp;&lt;/author>

&nbsp;&nbsp;&nbsp;&nbsp;&lt;link&nbsp;rel="self"&nbsp;type="application/atom+xml;type=entry"&nbsp;title="self"&nbsp;href="Mesh/News/T3KY45PHG5AEXAQHVDZ4IC6WKM-NWMXSKNAK7D6HV55WXY2FMZ3ZM"&nbsp;/>

&nbsp;&nbsp;&nbsp;&nbsp;&lt;link&nbsp;rel="edit"&nbsp;type="application/atom+xml;type=entry"&nbsp;title="edit"&nbsp;href="Mesh/News/T3KY45PHG5AEXAQHVDZ4IC6WKM-NWMXSKNAK7D6HV55WXY2FMZ3ZM"&nbsp;/>

&nbsp;&nbsp;&nbsp;&nbsp;&lt;link&nbsp;rel="LiveFX/AuthorProfile"&nbsp;type="application/atom+xml;type=feed"&nbsp;title="LiveFX/AuthorProfile"&nbsp;href="email-graham_moore@live.com/Profiles"&nbsp;/>

&nbsp;&nbsp;&nbsp;&nbsp;&lt;category&nbsp;term="NewsItem"&nbsp;label="NewsItem"&nbsp;scheme="http://user.windows.net/Resource"&nbsp;/>

&nbsp;&nbsp;&nbsp;&nbsp;&lt;content&nbsp;type="application/xml">

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;NewsItemContent&nbsp;xmlns:i="http://www.w3.org/2001/XMLSchema-instance"&nbsp;xmlns="http://user.windows.net">

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;CoalesceCount>1&lt;/CoalesceCount>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;Contexts>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;NewsItemContext>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;Kind>Scope&lt;/Kind>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;Relationship>LiveFX/MeshObject&lt;/Relationship>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;TargetLink>Mesh/MeshObjects/3XDCEOEAANZUPFD5OV7TLE3IFM&lt;/TargetLink>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;Text>documents41&lt;/Text>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;Type>LiveFX/MeshObject&lt;/Type>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/NewsItemContext>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;NewsItemContext>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;Kind>Target&lt;/Kind>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;Relationship>LiveFX/MeshObject&lt;/Relationship>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;TargetLink>Mesh/MeshObjects/3XDCEOEAANZUPFD5OV7TLE3IFM&lt;/TargetLink>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;Text>documents41&lt;/Text>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;Type>LiveFX/MeshObject&lt;/Type>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/NewsItemContext>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/Contexts>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/NewsItemContent>

&nbsp;&nbsp;&nbsp;&nbsp;&lt;/content>

&nbsp;&nbsp;&lt;/entry>

</code>

The key things that we use from the above Atom entry is the <b>Title</b> element value. This is the unique key for the event type. I would have preferred to see this implemented a little more robustly, either in a custom attribute/element in the entry or as part of the content. I certainly would have liked to see it as a URI rather than just a string.

The following are the list of event types that can occur in the Live Mesh Environment:

<code>

LiveMesh.FolderRename - Occurs when a folder is renamed (note there is no event created when a LiveFolder is renamed.)

LiveMesh.FolderAdd - Occurs when a new folder is added.

LiveMesh.MemberAdd - Occurs when a member is added to Folder.

LiveMesh.LiveFolderAdd - Occurs when a new LiveFolder is added. Why the need for the special cases? If the scope was set to the Mesh that would be enough.

LiveMesh.LiveFolderDelete - Occurs when a LiveFolder is deleted. Note: no events are raised for all the sub files and folders that are also removed.

LiveMesh.FileAdd - Occurs when a file is added to a folder.

LiveMesh.FileUpdate - Occurs when a file is updated or renamed.

LiveMesh.FileDelete - Occurs when a file is deleted.

LiveMesh.MemberInvite - Occurs when a member is invited to join a folder.

</code>

With the event detected we can then pull information out of the <b>Contexts</b> element. This data structure isn't the cleanest for pulling out the key information but it tells us on which item the event has occurred and in what context (folder). The <b>NewsContext</b> provides links to the items being affected. These items can then be fetched and the state replicated into the topicmap. This includes creating and deleting topics for files and folders, maintaing relationships between files and folders and folders and their parents.

As Live Mesh doesnt raise events for recursive deletes, we fire a pseudo delete event when there is a LiveMesh.LiveFolderDelete event for all descendent files and folders.

All of this processing means we then have a topicmap synced with the state in a given Live Mesh account.

The trade off we see between an event based integration and a pull integration is that the pull integration is more lightweight, robust at dealing with failure, and easier to evolve over time. The value of the integrated event model based approach is that information moves in near real time from the CMS into the Topic Maps system.

So by using the Atom feed of changes to a Live Mesh environment we are able to create and maintain proxy topics for all files and folders. This gives us a baseline on which to build further functionality such as advanced metadata management, classification, search etc.

Now all we need is a nice Silverlight UI to allow users to navigate, query and further classify all their nice Mesh file topics ;)


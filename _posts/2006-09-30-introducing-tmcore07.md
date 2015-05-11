---
layout: post
title: Introducing TMCore07
category: Announcements
category: TMCore
tag: tmcore
author: kal
---
<strong>Introduction</strong>

Since our first release of the TMCore engine in 2005, we have worked through 3 separate "minor" upgrades, each of which not only improved performance and fixed the occasional bug, but each of them also added some new features to extend the range of the API or provide a more useful "out-of-the-box" experience with the product. This month we proudly unwrap TMCore07, our first "major" upgrade to the TMCore engine. This month we also kick off "On Topic" our product and techie news blog. So this seems like the best time to review TMCore07, explain what we have done that warranted a new major version and how we hope it will address some of the feedback we have received from customers and from using the product ourselves on numerous projects.

<strong>What's Not New</strong>

We have worked in software development for many years and we know that perhaps one of the most important things to know when you decide whether or not to upgrade a deployed solution is not so much what is new and improved in the product, but what is unchanged and can be relied upon to work from one release to the next. So before we get into what is shiny and new, lets first look at what hasn't changed and at what has changed that might give you some pause for concern (and how we have tried to address that concern in advance!). If you are a newcomer to TMCore (welcome!), you can probably skip this whole section and not miss much if you go directly to <a href="#newstuff">what's new in TMCore07</a>

The three principle access points to TMCore are the API, the Web Services interface and the TMRQL public views and store procedures that allow you to write your own queries against the TMCore database. All thre have had some interesting additions, but in all cases we have worked to keep the changes compatible with older code.

If you have written code (C#. VB etc) against the TMCore05 API, you should find that all your existing TMCore05 code will run against the TMCore07 database with no changes. The TMCore installation includes a policy file that gets installed in the GAC and redirects any references to previous versions of tmcore.dll to the new version in the GAC, so in most cases you shouldn't even need to recompile.

If you have code that uses the TMCore Web Service by binding directly to the WSDL files that came with TMCore05, your code should require no changes - we kept all of the operations in TMCore05 in the transition to TMCore07, however we have added some new features and if you use the Web Servie to perform updates on a topic map I would definitely recommend that you look at the new ProcessTransaction method. We have also made a significant change to the way that queries invoked through the Query method on the Web Service are configured and processed - again we strongly recommend that you look into this and update your Web.config file for the Web Service if you have some customised queries defined in it. If you wrote web service client code using the serviceclient.dll assembly however you will need to recompile and possibly to modify your code a little - we took the opportunity of TMCore07 to tidy up the class structure in serviceclient.dll a little and to add some new features and convenience methods (which you may want to look into if you are updating your code anyway).

The TMCore TMRQL views and stored procedures in TMCore05 are also unchanged in TMCore07 so queries that worked against TMCore05 databases should return the same results when run against TMCore07. Although the script has expanded quite a lot, many of the additions are private stored procedures that are currently used by the web service ProcessTransaction operation. We can't stress enough that you should NEVER rely on these stored procedures being stable from one release of TMCore to the next and that therefore you should NEVER make use of them in your own code or queries. If the stored procedure or view name starts with the prefix "tm_" (or "TM_"), it is a public part of the TMRQL spec and will remain constant at least for this major version of TMCore. Anything in the database that starts with "_tm" or "_TM" or indeed with any other characters, should be treated as private and prone to change or removal in any forthcoming minor release.

OK, thats enough for you upgraders. Lets join the newbies and see what is worth getting excited about in TMCore07.

<a name="newstuff">

<strong>What's New In TMCore07</strong>

</a>

There is quite a lot of detail here, so use the following links to jump to the sections that interest you.

<ul>

<li><a href="#ws">Web Service Enhancements</a> - including transactional updates and AJAX-friendly interfaces.</li>

<li><a href="#npcl">Networked  Planet Constraint Language</a> - a model and XML syntax for expressing a topic map ontology.</li>

<li><a href="#tmeditor">TMEditor 2.0</a> - a complete rewrite of the generic topic map editing tool.</li>

</ul>

<hr/>

<a name="ws"><strong>Web Service Enhancements</strong></a>

The TMCore Web Service has been one of the most stable, reliable bits of the product The service interface was unchanged since the first release of TMCore05...until now (and even now we have only added a single new operation!). The one issue with the Web Service that we found from our own use and project work was that doing an update to the topic map was unecessarily complex. This all comes from the fact that the Save method has the simple semantic that the caller provides the complete definition of how the topic or association should be recorded in the topic map. That means that if you have a topic with 200 occurrences and all you want to do is delete one, you still need to provide the complete <topic> structure with 199 <occurrence> elements in it! Although easy to understand, the difficulty with this approach is that in order to modify a topic you must first know what the current topic structure is - and in a number of cases you actually want to push a change into a topic without knowing its current state (and, of course there are also concurrency issues in which one client could unwittingly overwrite the changes made by another). So to address these issues we proudly introduce the ProcessTransaction operation...tada!

As its name suggests, ProcessTransaction allows the caller to request that a list of operations on the topic map be carried out as a single transaction. The operations supported are listed below:

<table>

<tr>

<th>Operation Name</th><th>What it does</th>

</tr>

<tr><td>CreateTopic</td><td>Takes a complete definition of a new topic and adds it to the topic map (merging with existing topics if necessary).</tr>

<tr><td>UpdateTopic</td><td>Takes a complete definition of the structure of an existing topic in the topic map and modifies the topic so that it matches the new structure. This is equivalent to the Save operation with the additional benefit that multiple topics can be updated in a single transaction.</td></tr>

<tr><td>DeleteTopic</td><td>Removes an identified topic from the topic map.</td></tr>

<tr><td>CreateTopicProperty</td><td>Adds one or more names, identifiers, types or occurrences to an identified topic. This operation allows you to write new information into a topic without having to know the full structure of the topic in advance.</td></tr>

<tr><td>DeleteTopicProperty</td><td>Removes one or more names, identifiers, types or occurrences from an identified topic.</td></tr>

<tr><td>CreateAssociation</td><td>Takes a complete definition of a new association and adds it to the topic map.</td></tr>

<tr><td>DeleteAssociation</td></td>Removes an identified association from the topic map.</td></tr>

</table>

We will look at the use of ProcessTransaction in more detail in a future article, but for now it is worth pointing out a couple of things. Firstly, remember that you can use as many of these operations together in a single transaction as you want. A ProcessTransaction call is executed in a single database transaction, with an automatic rollback if one operation in the transaction fails. In implementation these operations typically map to one or two lookups followed by execution of a stored procedure against the database, so there is a practical limit to the size of transaction you should send, but in theory you can throw as big a transaction as your database server will handle at the service. Secondly you will notice that there is no UpdateTopicProperty method - combining DeleteTopicProperty and CreateTopicProperty in a transaction has the nice effect of effectively performing an update and without the overhead of a complex syntax for identifying which property is to be updated and how. Thirdly for operations that act on an "identified" topic, the identified can be either the datatbase object ID of the topic, or an identifier (subject identifier, subject locator or source locator) for the topic, or an transaction-specific string identifier assigned to a topic in the CreateTopic operation (this allows you to create two topics and then reference them in a CreateAssociation operation all in a single transaction). Finally, the DeleteTopicProperty and DeleteAssociation methods support matching the item to be deleted "by value" - that is by allowing you to specify the structure of the property or association to be deleted. Matching by value supports some simple wild-carding operations so it is possible for example to issue a command to delete all "Home Phone Number" type occurrences from a topic and then create a new "Home Phone Number" occurrence to replace them.

<emph>XML Over HTTP Interfaces</emph>

To be honest we originally wanted these to be REST interfaces, but the RESTful service interface we came up with just got too horribly complicated. Instead we have opted for a simple mapping of all of the existing web service operations (including ProcessTransaction) to simple ASP.NET web forms that allow you to POST an XML document containing the request parameters or, for most operations at least, to issue a GET with the request parameters encoded as URL parameters. What these interfaces do is support AJAX applications, Flash applications and a huge raft of other scripting languages that have their own built-in XML processing and HTTP comms libraries (and that pretty much includes all modern scripting languages...even csh ;-)

<hr/>

<a name="npcl"><strong>NetworkedPlanet Constriant Language</strong></a>

When we added the Topic Map Editor to TMCore05 we realised that there was a need for a simple but expressive ontology language for topic maps - something that allows ontology designers to specify their ontology as topic types, occurrence types, association types and so on. TMEditor in TMCore05 provided a very simplistic model of meta-types which has now been superceded by the NetworkedPlanet Constraint Langauge (NPCL). NPCL is a big topic that we will be returning too in this blog a number of times I suspect. However its key features are:

<ol>

<li>You can specify that a topic can be used as a topic type, occurrence type, association type or association role type (or any combination of these four).</li>

<li>You can define constraints between types of three different kinds:

<ul><li>Topic Occurrence Constriants: Specify that a topic of type T can (or should) have some number of occurrences of type O.</li>

<li>Role Player Constraints: Specify that a topic of type T can (or should) play a role of type R (optionally limiting it to being roles of type R in associations of type A)</li>

<li>Association Role Constraints: Specify that an assocation of type A can (or should) have some number of association roles of type R.</li>

</ul>

These constraints can all have cardinality counts (minimum/maximum) associated with them. This allows you to express things such as "A 'Person' topic must have a single 'Age' occurrence"; "A 'Person' topic can play an 'Employee' role in a 'Works For' association zero or more times"; and "A 'Works For' association must have exactly one 'Employee' role and exactly one 'Employer' role.

</li>

<li>In addition to cardinality counts, both types and constraints can have additional meta-data, this meta-data model is extensible, allowing you to add your own application-specific annotations to your ontology.</li>

<li>The NPCL type and constraint information can be represented in topic map form, meaning that you can store your schema in the topic map that has the data and edit it with normal topic map editing tools. However, the information can also be represented in a simple XML form (schema provided!) which makes it alot easier to write. We have provided command-line tools for converting between these forms and for importing the XML version of NPCL into a topic map and for getting the NPCL information in a topic map out in the XML format.</li>

</ol>

The current implementation of NPCL focusses solely on allowing you as a developer to store NPCL information and to get at it again - we do not enforce your ontology at the API level (the merits of this are debatable) and we do not currently provide any validation tools. Right now our feeling is that validation tools would be useful, schema enforcement at the TMCore API level would end up being prohibitive. However the lack of validation tools does not mean that NPCL as it currently stands is useless - instead it provides a simple, consistent platform on which you can build applications that do enforce the rules such as forms-based editing or data-entry interfaces.

Finally on the subject of NPCL for now it is worth mentioning that TMCore07 also includes a small web service for retrieving the NPCL information for a topic map or for a single type in the topic map. There is currently no web serivce interface for updating the NPCL information in a topic map. I should probably also mention that NPCL has been presented to the ISO committe working on the forthcoming ISO Topic Maps Constraint Language specification and the current indications are the TMCL will use a very similar model, so when ISO publish the standard it should be possible to simply convert NPCL information into TMCL.

<hr/>

<a name="tmeditor"><strong>TMEditor 2.0</strong></a>

When it was first released, we received quite a few comments about our generic topic map editing application. Not all of them positive - the main complaint was that the interface was too clunky - a lot of clicks needed to do simple tasks and the interface seemed a little too much tailored to a power user. The other main complaint was with the lack of options for locating topics to edit or to use as types or scopes. The other complaint we had (this is true) was that it was too green.

So we decided that TMCore07 should have a completely new TMEditor application.

The main part of the new interface is a tabbed topic editor. Each tab allows you to edit a different aspect of the topic, names on one tab, occurrences on the next and so on - this gives much more screen space and means that each separate editing tab can be laid out to be a more useable. There is also a Summary tab which allows you to navigate the topic map within the editor application.

Another key feature to the new user interface is the History List. This little widget sits in the top-right corner of the editor and tracks the topics you visit. You can also add topics into this list by searching for them and clicking on them in the results list. What the History List lets you do is keep a set of topics in easy reach which can be invaluable when creating occurrences and associations of the same type repeatedly (for example an association with two roles requires 4 topics other than the one you are editing to be specified completely plus any additional topics required for scoping purposes).

The final major feature is the utilities tab set on the right. This provides a simple way to create new topics (making it far easier to enter a list of new topics); and several topic map search and browse options. On of the neatest is the Topic Chooser. The Topic Chooser is launched from the main editing interface by clicking on a button labelled "..". The chooser tab then displays a context-sensitive list of the topics that would be appropriate for the field from which it was launched. The Topic Chooser is driven by the NPCL ontology for the topic map, so if you launch the Chooser from the Association Type field on the Associations editor tab, it would display only a list of association types defined in the NPCL ontology. If you set the role type field for an association and then launch the chooser on the role player field you see only a list of topics that can play that type of role.

The entry page to TMEditor has also been overhauled. You can now manage the topic maps in TMCore through this interface - creating new topic maps, removing unwanted ones and managing the NPCL schema for a topic map as well as importing and exporting XTM files.

<hr />

<strong>Conclusion</strong>

This has been a quick tour around the major new features of TMCore. We will have more to say on some of these features in later articles. As always, we provide a free 90-day evaluation license which you can request <a href="http://www.networkedplanet.com/contact/request-evaluation/">here</a>.


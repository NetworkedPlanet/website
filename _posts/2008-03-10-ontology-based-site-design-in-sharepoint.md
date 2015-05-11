---
layout: post
title: Ontology based site design in SharePoint
category: Ontologies
tag: sharepoint module
tag: tip
category: TMCore SharePoint Module
author: gra
---
<p>

We've talked previously, <a href="http://www.networkedplanet.com/download/tm-website-architecture.pdf">Topic Map website architectures</a> about how topic maps can be used in terms of websites, we have also talked before about <a href="http://www.networkedplanet.com/ontology-driven-application-design-with-the-npcl-schema-editor/"> Ontology driven application design.</a>  I'm going to pick up a couple of threads and reflect on how  defining an Ontology can be useful in the construction of a SharePoint 2007 site.

</p>

<p>First, what do we mean by a SharePoint site design? We consider it to be the definition of content types, lists and sites within a site collection. This really comes down to the kinds of items you are going to have and the organising principles you are going, impose, er, provide for users to navigate the site. We aren't talking about the look and feel aspect of design.</p>

<p>Next, whats an Ontology? I'm going to use the definition that its, <i>the types of things and the types of relationships between those things that exist in a particular domain according to some view point.</i> So, no controlled vocabularies here, although they may be implied, no instance data, just the types of things. Kind of like a class diagram in UML, or a Logical Entity Relationship Model.</p>

<p>The power of the ontology is that it immediately frees you from the bounds of the technology. While SharePoint things (items, documents, sites and users) have some properties in common they are in fact all quite different beasts. They have different representations, different APIs, different event models and of course varying degrees of default functionality associated with them.This means when doing site design you are instantly forced to think about, and quickly choose, the king of SharePoint thing to use. I call this the technology committment. The technology committment always trumps the design aesthetic because if it can't be done, or costs to much to be done, it won't get done. Enter Ontology driven site design.</p>

<p>Ontology driven site design is a Zen like experience where the designers can concentrate on the true nature of the information management problem at hand. They can consider all the actors, artifacts, and concepts in a holistic fashion. They do not need to worry about the issues that people manifest themselves as accounts in Active Directory, or that products some from a third party web service feed, or that documents and tasks will use the base SharePoint types for these artifacts. Without these technical constraints they are free to define the types and more importantly, the relationships between these types in ways that directly help tackle the information management issues facing the different users of the system. Furthermore, its possible to ignore the strict hierarchy that is imposed by SharePoint and think about information access purely in terms of the logical model. This of course could contain multiple hierarchical structures and will almost certainly be graph like in nature.</p>

<p>One final little point is that the SharePoint tooling is lacking any overview capability of 'how it all fits together' using an ontology as the basis for the site provides clear documentation to all involved in the project. This artifact can be used in design meetings, data integration meetings and of course site implementation.</p>

<p>So if its all so Zen, so technology agnostic how useful is it beyond documentation? Well, of course you need some technology to make this happen, and this is SharePoint so of course you want to make use of all the SharePoin features. This is where Topic Maps comes in and specifically, the TMCore SharePoint Module. There are two key things Topic Maps integrated with SharePoint via our tools does for you. Firstly, using the NPCL Visual Studio plugin its possible to draw and visualise an ontology. Then, while still inside Visual Studio its possible to either connect the types in the ontology to existing SharePoint content types or to indicate that new types should be created. Finally, the plugin will allow you to generate a feature that contains all the Content type definitions, the ontology and the relationship between the two. </p>

<p>The second thing the Topic Maps integration provides is some basic plumbing inside SharePoint such that all SharePoint items can have a related Topic. Once we have flattened the shape of all things in SharePoint to be just topics and associations its possible to truly realise the Zen ontology while still utilising all the things that the different shaped SharePoint things give you.</p>

<p>Creating this highly connected, semantically organised graph of concepts is great but only if you can then utilise it for the benefit of users. This can be done in a number of ways but one of the most powerful is to develop queries over the logical ontology in order to provide multiple navigation paths to the same content, contextualised lists of topics, or documents based on the user and their situation, finally perhaps making use of the notion of faceted search to slice and dice through the information.</p>

<p>Ontology design needs to be a proper part of the design process. It should happen early on in the project in conjunction with use case and system integration iterations. It's key that these things happen at the same time, as the logical model the ontology provides is the tool for delivering the use cases and the target for mapping in information from other systems.</p>

<p>Ontology driven design for SharePoint has some basic practical advantages over developing the site through the administration interfaces or XML features. Furthermore, it empowers a much more natural and powerful way to think about, organise and exploit the content and concepts of a given domain or application.</p>

<p>To see all of this in action we have produced some cool vidoes of ontology design in the context of SharePoint site design. They can be found <a href="http://www.networkedplanet.com/products/sharepointmodule/videos.shtml">here</a>.


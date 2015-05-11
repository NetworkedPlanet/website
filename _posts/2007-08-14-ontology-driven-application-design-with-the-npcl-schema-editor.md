---
layout: post
title: Ontology-driven Application Design with the NPCL Schema Editor
tag: npcl editor
category: NPCL Schema Editor
tag: ontology
category: Theory and Practice
tag: tip
author: kal
---
With the <a href="http://www.networkedplanet.com/networkedplanet-announce-visual-topic-map-schema-editor/" title="NetworkedPlanet Announce Visual Topic Map Schema Editor">new release of the NPCL Schema Editor</a>, the focus of our developer tool set is now moving around to <strong>ontology-driven application design</strong>. This post is to explain a little more about what that concept involves and how we think it can provide real benefit to system architects and developers alike.

<h2>Ontology and Information Management</h2>

Our key focus has always been on Information Management - enabling organizations to better organize the information that they work with to make it more accessible, more relevant to key processes and better connected to the concepts that drive the business. Adding ontologies into the mix strengthens the connections between information assets and concepts by enabling the business concepts to be made as concrete as the documents and databases that are part of the business. An ontology can also provide a means for expressing the common consensus on "what exists in our business", "what do we do" and "what are our key business drivers, goals and concepts" - in that alone the development of an ontology can be a key part of examining and improving business processes.

<h2>An Ontology-based Application Development Process</h2>

There are many stages of the application development life-cycle where ontologies can play a key role. These  are the principle ones that we have seen from our exeperience in developing information management solutions using topic maps.

<h3>Design To Ontology</h3>

An ontology represents a concrete specification of the classes of concepts and relationships that are involved in a particular system architecture. By creating an ontology with "Person", "Company", "Document" and other topic types we are explicitly saying that these concept classes are a key part of the system architecture. In many cases these conceptual classes will persist all the way down into the data layer. Of course, in the old days that meant creating database tables, but with topic maps the possibility of a more flexible approach is opened up.

Furthermore with a constraint language for topic maps such as NPCL, we can take the high-level concept classes and encode them directly in a syntax that the topic map processor can understand and act on. In this way we can really start the process of coding a system by writing the ontology - it is the first step on the road to making our conceptual designs a concrete reality.

A constraint language also allows us to express more about our model than a simple system of types. Constraints enable us to specify how those types interact and combine and impose minimum requirements for data integrity.

<h3>Ontology to Code</h3>

Ontology and code can interface in many different ways.

<ul>

<li><strong>Code Access To Ontology</strong><br/>

At the simplest you can use code to acess the ontology information. In TMCore, this feature is provided by the NPCL library and the supporting database views that enable running code to query and traverse ontology information. In this way code can be written that is designed to work flexibly with different domain models by allowing the ontology to specify how it behaves. A simple example of this is the UI for populating a topic with occurrence values. An ontology-unaware application will have to prompt the user to search for the occurrence type and will have no way of validating that the occurrence type and its value make sense for the topic (specifying two Age occurrences with different values on a Person topic for example). An ontology-aware application could know that a Person topic is only allowed one Age occurrence, that the value for this occurrence must be a non-negative integer and that the value must be less than 130.

</li>

<li><strong>Ontology-Driven Queries</strong><br />

An ontology specifies both the types and the relationships between them. Therefore it is easy to see that it should be possible to create ontology-driven query interfaces that allow users to develop queries that traverse an topic map instance based on the types and relationships specified in the ontology and without the need for a lot of specialised knowledge about how that information is stored. ISO is working on a standardised query language for topic map queries known as TMCL, but even this is working from the principle of being ontology-unaware. An ontology-aware application will ensure that users only ever create "meaningful" queries (queries that could possibly return at least one result) and can avoid the need for users to know the underlying identifiers assigned to the types in the ontology. We have already implemented an initial version of this idea in the TMCore SharePoint Module where a simple web-form UI allows a user to construct a query as a series of "hops" through the topic map with optional filtering at each stage of the hop. The ontology-aware query editor form ensures that the user can only select an appropriate relationship type for the next hop based on the type(s) returned by the previous hop.

</li>

<li><strong>Ontology-based Code Generation</strong><br />

An initial version of our ideas on code generation was shown at the TMRA conference last year (and is written up in the book <a href="http://www.amazon.co.uk/Leveraging-Semantics-Topics-Maps-International/dp/354071944X/ref=sr_1_1/026-2065107-6402822?ie=UTF8&s=books&qid=1187087575&sr=8-1">"Leveraging the Semantics of Topic Maps"</a>. Code generation holds many promises - not least of which is reducing the burden on the application developer by removing (or reducing) the need to write the classes that represent the key entities in the solution and allowing them instead to focus on the business logic. Combine this with the ability of a flexible schema language like NPCL to allow domain-specific constraints to be expressed in the schema itself and gradually it should be possible to move more and more of the commonly coded elements of solutions into simple configuration of properties in a schema.

</li>

</ul>

<h3>Ontology to UI</h3>

I have already mentioned how an ontology-aware user interface can provide input validation, but the advantages of ontology-based application development do not stop there. As many of our applications tend to be web-based and/or forms-based, the ontology can be used as the intial specification of the layout of the various presentational forms. We will shortly be releasing an example of this for the TMCore SharePoint Module which uses the annotated ontology to generate SharePoint content types and fields which in turn automatically produces the forms representations for those items in the SharePoint interface.

Future work in this area will also look at the possibility of auto-generating all kinds of page layouts and windows forms as well as web forms.

<h2>Conclusion: The Future For Ontology-Driven Applications</h2>

The release of the NPCL Schema Editor is the first step in enabling the vision of speeding up the development of complex information management solutions through the application of simple  topic map schemas. By building on a solid base of Topic Maps, TMCore, NPCL and now the visual editor tool we will be bringing our developer community more and better tooling to help in code generation, query generation, application and UI configuration. To keep apprised of what we are doing, be sure to subscribe to this blog!


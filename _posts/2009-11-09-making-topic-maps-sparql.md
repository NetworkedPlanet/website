---
layout: post
title: Making Topic Maps SPARQL
tag: sparql
category: Theory and Practice
tag: topic maps
tag: web3
author: kal
---
<p>

The focus of this article is on the implementation of the SPARQL query language on top of a topic map repository. I'm not going to get down into implementation issues but instead will describe what has motivated this work and the way in which we have addressed the various incompatibilities between the graph-based data model for which SPARQL was designed and the aggregate association model of topic maps.

</p>

<h2>Contents</h2>

<ul>

<li><a href="#motivation">Motivation and Goals</a></li>

<li><a href="#approach">Approach</a></li>

<li><a href="#limitations">Limitations of TMSPARQL</a></li>

<li><a href="#conclusions">Conclusions</a></li>

<li><a href="#examples">Further Examples</a></li>

</ul>

<h2 id="motivation">Motivation and Goals</h2>

<p>The principle motivation behind this work has been the need for topic maps repositories to be active participants in the Linked Data Web. It is relatively trivial to expose topic map data as RDF but just providing a bunch of addressable RDF resources isn't really enough. A true Linked Data repository really must also support a query interface that allows clients to search and filter the data provided by the repository. It is clear (from even a cursory inspection of the various linked data repositories that exist out there) that SPARQL is the preferred query language for Linked Data clients. Therefore if a topic maps repository is to be a full and useful participant in the Linked Data web it is important that it can provide a SPARQL query service endpoint.</p>

<p>A second, weaker, motivation has been the progress and direction of the ISO TMQL standard. At the time of writing the TMQL standard is still under development and while it is not clear just yet exactly how the query language will look, it is my opinion that the final language will not be palatable to those outside the topic maps community. It is hoped that by providing a SPARQL query implementation on top of a topic maps repository it would be possible to provide a simpler query language that perhaps meets the 80/20 rule leaving the 20% of really heavy lifting in topic maps query to TMQL.</p>

<p>The main goal of this project is to enable the implementation of a SPARQL query endpoint, but it is also important that this should be an endpoint that is usable by any Linked Data client. In particular the SPARQL query endpoint should be queryable by a client that does not know (and does not need to care) that the underlying repository is using topic maps as its core data model rather than RDF. Ideally a client should be able to send the same query to both RDF and Topic Maps based repositories and, assuming there is some consistent mapping of identifiers to resources, retrieve equivalent results. For example, if I have a topic map that stores social network data using the FOAF ontology, it should be possible for a client to query that data using exactly the same SPARQL queries it would use to query an RDF store of FOAF data.</p>

<p>We have called this project TMSPARQL.</p>

<h2 id="approach">Approach</h2>

<p>A SPARQL query is expressed as a graph pattern that (in its most basic form) consists of a set of triples where the subject, predicate, or object of those triples may be either an RDF node or a variable. The query result returns the collection of bindings of values to the variables that result in a match of the pattern against the data store. TMSPARQL takes a SPARQL query and converts it into a set of matches against a topic map data store. It is important to point out that the data being queried is stored using a conventional topic maps data model - no conversion or intermediate form of data is required nor is any configuration or mapping of identifiers.</p>

<p>For the purpose of explanation I'm going to use some very simple sample data. This is the data being queried in CTM notation:</p>

<pre>

person http://www.networkedplanet.com/ontology/employment/person .

company http://www.networkedplanet.com/ontology/employment/company .

worksFor http://www.networkedplanet.com/ontology/employment/worksFor .

employer http://www.networkedplanet.com/ontology/employment/employer .

employee http://www.networkedplanet.com/ontology/employment/employee .

hourlyWage http://www.networkedplanet.com/ontology/employment/hourlyWage .

alf

isa person

hourlyWage 14.50 .

bert

isa person

hourlyWage 25.40 .

xyz isa company .

worksFor(employee: alf, employer: xyz)

worksFor(employee: bert, employer: xyz)

</pre>

<h3>Mapping URIs to Topics</h3>

<p>The first stage of the TMSPARQL process is to bind all URIs in the triples of the graph pattern to topics. The URI may be one of a small number of special predefined URIs (primarily used as predicates for explicit traversals of the topic map data model), otherwise the URI is used to look up topic map items by item identifier or subject identifier (for topic items). Under this rule it is possible for a single topic to be referenced by different resource URIs in a SPARQL query, but this has no negative effect on the construction or execution of queries. If a topic map item cannot be found for a particular URI, then the triple containing that URI cannot be matched. For example given the query:</p>

<pre>

PREFIX ont: <http://www.networkedplanet.com/simpleOntology/>

SELECT ?person ?employer ?wage WHERE {

?person ont:employer ?employer .

?person ont:hourlyWage ? wage

}

</pre>

<p>only the predicates of the triples in the graph pattern are bound to URIs. The TMSPARQL engine must, then, find the topic map items identified by the URIs <code>http://www.networkedplanet.com/simpleOntology/hourlyWage</code> and <code>http://www.networkedplanet.com/simpleOntology/employer</code>.</p>

<h3>Implicit Data Model Traversals</h3>

<p>If the predicate of a triple in the SPARQL graph pattern does not match any of the predefined URIs for the explicit data model traversals, then there are a number of possible traversal options that the TMSPARQL processor must consider. In each case, the predicate specifies a typing topic that acts as a filter on the traversal.</p>

<h4>Related Topics Traversal</h4>

<p>The related topics traversal binds topic items to the subject and object of the triple. The predicate of the triple must be a role type and specifies the type of the role played by the topic bound to the object of the triple in an association in which the subject of the triple plays a role of any type other than the type bound to the predicate. In our example query the triple <code>?person ont:employer ?employer</code> executes a Related Topics Traversal because the topic with subject identifier <code>http://www.networkedplanet.com/simpleOntology/employer</code> is used as a role type in two associations in our sample data set.</p>

<p>At first glance it may be unclear why the predicate is a role type and not an association type. The reason for this is that a topic map association potentially groups more than two topics together. Using the association type as a filter implies no specific "direction" to the triple meaning that any role player could be bound to either the subject or object of the triple and that all possible combinations would have to be returned by the match (in our example if we used association type as the predicate <code>?person ont:worksFor ?employer</code> and would result in the following matches:</p>

<table border=1 cellpadding=3 cellspacing=3>

<tr><td>?person</td><td>?employer</td></tr>

<tr><td>alf</td><td>xyz</td></tr>

<tr><td>xyz</td><td>alf</td></tr>

<tr><td>bert</td><td>xyz</td></tr>

<tr><td>xyz</td><td>bert</td></tr>

</table>

<p>The predicate is specified to be the type of the role played by the topic that binds to the object of the triple to make queries read more naturally. If we had said that  the predicate should be a filter on the type of role played by the subject of the triple then our sample query triple would have to be rewritten as <code>?person ont:employee ?employer</code> - which doesn't quite read correctly.</p>

<p>This implied traversal is really tuned specifically for the case of binary associations (as our experience is that the vast majority of all associations are binary). It also neatly handles the case of grouping associations where one player plays a specific "parent" role type and all other players play the same "child" role type. It doesn't quite so neatly handle associations that contain more than two types of role as the subject of the predicate must bind to all players of roles other than the role type specified in the predicate. This problem can often be mitigated by introducing other filtering triples into the query (e.g. adding a ?person a ont:person triple to the query pattern), or if all else fails by falling back on a more verbose use of the explicit traversals.</p>

<p>Using our example data, the query:</p>

<pre>SELECT ?person, ?employer { ?person ont:employer ?employer }</pre>

<p>will result in the following variable bindings:</p>

<table border=1 cellpadding=3 cellspacing=3>

<tr><td>?person</td><td>?employer</td></tr>

<tr><td>alf</td><td>xyz</td></tr>

<tr><td>bert</td><td>xyz</td></tr>

</table>

<h4>Topic Property Value Traversal</h4>

<p>The Topic Property Value Traversal binds topic items to the subject of the triple and literals to the object of the triple. The triple predicate must be a name or occurrence type and specifies the type of name or occurrence that must be present on the topic bound to the subject with a literal value equal to that bound to the object. </p>

<p>In our example query the triple <code>?person ont:hourlyWage ?wage</code> executes as a Topic Property Value Traversal because the topic with the subject identifier <code>http://www.networkedplanet.com/simpleOntology/hourlyWage</code> is used as an occurrence type in our sample data set.</p>

<p>Using our example data again, the query:</p>

<pre>SELECT ?person, ?wage { ?person ont:hourlyWage ?wage }</pre>

<p>will result in the following variable bindings:</p>

<table border=1 cellpadding=3 cellspacing=3>

<tr><td>?person</td><td>?wage</td></tr>

<tr><td>alf</td><td>14.50</td></tr>

<tr><td>bert</td><td>25.40</td></tr>

</table>

<h4>Handling Traversal Options</h4>

<p>It should be noted that it is not possible to determine from the predicate URI of a triple which implicit data model traversal should be followed. Our current implementation uses the other triples in the query to help narrow down the traversal options. For example the single triple in the query:</p>

<pre>

SELECT ?person ?wage WHERE {  ?person ont:hourlyWage ?wage }

</pre>

<p>Could be either a related topics traversal (in which case ?wage must bind to a topic) or a topic property value traversal (in which case ?wage must bind to a literal). However the query:

</p>

<pre>

SELECT ?person ?wage WHERE {

?person ont:hourlyWage ?wage .

?wage a ont:monetaryValue

}

</pre>

<p>has a second triple that implies that ?wage cannot be a literal value (because it has a type specified by the topic referenced by ont:monetaryValue) so only a related topics traversal is appropriate. Alternatively the query:</p>

<pre>

SELECT ?person ?wage WHERE {

?person ont:wage ?wage .

FILTER (?wage > 50)

}

</pre>

<p>uses ?wage in a filter comparison with a numeric which therefore implies that ?wage must be bound to a literal value and so the traversal in the first triple must be a topic property value traversal.</p>

<p>If the predicate is already bound to a topic at query time, it is also possible to handle this problem by inspection (looking at the topic map to see how the topic that binds to the predicate is used for typing purposes) or by reference to a TMCL schema (by looking at how the predicate topic is declared for use in the schema). However these approaches do not help when the predicate of a triple is itself a variable. In some cases it may be necessary to execute both traversal options and combine the results.

</p>

<h4>Explicit Data Model Traversals</h4>

<p>TMSPARQL predefines a number of URI identifiers for specific traversals of the topic maps data model. Whenever a triple is encountered in the SPARQL query that uses one of these URIs as the predicate of the triple, then the corresponding data model traversal is invoked. Each of these traversals also imply a restriction on the type of item referenced by the subject and object of the triple. The table below summarises these predicates using CURIEs where the prefix <code>rdf</code> maps to the URI <code>http://www.w3.org/1999/02/22-rdf-syntax-ns#</code> and the prefix <code>tms</code> maps to the URI <code>http://www.networkedplanet.com/tmsparql.</code>

</p>

<table border=1 cellpadding=3 cellspacing=3>

<tr><td>Identifier (CURIE)</td><td>Traversal Description</td><td>Subject Item Type</td><td>Object Item Type</td></tr>

<tr><td>rdf:type</td><td>The type-instance traversal. From a typed topic map item to the topic(s) that specify its type(s).</td><td>Topic, Association, Role, Name, Occurrence</td><td>Topic</td></tr>

<tr><td>tms:reifier</td><td>Item -> Reifier traversal. From a topic map item to the topic that reifies that item.</td><td>Association, Role, Name, Occurrence</td><td>Topic</td></tr>

<tr><td>tms:role</td><td>Association -> role traversal. From an association item to its child role items.</td><td>Association</td><td>Role</td></tr>

<tr><td>tms:player</td><td>Role -> player traversal. From a role item to the topic item that is the value of the role player property</td><td>Role</td><td>Topic</td></tr>

<tr><td>tms:topicProperty</td><td>Topic -> occurrence or name traversal. From a topic item to its child name and occurrence items</td><td>Topic</td><td>Name, Occurrence</td></tr>

<tr><td>tms:scope</td><td>Scoped item -> themes traversal. From a scoped topic map item to the topics in its scope property.</td><td>Association, Name, Occurrence</td><td>Topic</td></tr>

<tr><td>tms:value</td><td>Property -> value traversal. From a name or occurrence item to its value literal.</td><td>Name, Occurrence</td><td>Literal</td></tr>

</table>

<p>It is important to note that these traversals also carry implications on the type of object referenced by the subject and object of the triple. If a variable is present in multiple triples in the pattern its actual item type must be the intersection of all item types implied by the triples it is in. If that intersection is the empty set, the query cannot bind the variable at all.

</p>

<h4>Importing RDF and Querying with TMSPARQL</h4>

<p>One of the goals of this design has been to make it possible to import RDF into a topic map store and then execute the same SPARQL query against it as you would if the data had been stored in an RDF store. This is the reason behind the choice of the implicit traversals described above. A number of papers on importing RDF into topic map data stores have been written (and many of which are summarised in the W3C Working Group Note "A Survey of RDF/Topic Maps Interoperability Proposals") and it is not the purpose of this paper to rehash those issues. However our design of the implicit traversals does impose some restrictions on how RDF properties map to types in the topic map data store. If the object of the RDF triple is a resource, then the assumption is that the subject and object of the triple both map to topics in the topic map store, and the predicate URI must be the subject (or item) identifier of the topic that defines the role played by the topic mapped to the triple object in an association with the topic mapped to the triple's subject. If the object of the RDF triple is a property, then the assumption is that the subject of the triple must be imported as a topic in the topic map store, the predicate URI must be the subject (or item) identifier of the topic that defines the type of a new property on the topic mapped to the subject of the predicate and the object of the triple must be used as the value of that new property. An ontology-based mapping approach such as Ontopia's RTM should have no difficulty in meeting these requirements.</p>

<p>It should also be noted that TMSPARQL doesn't care about any reverse mapping from the topic map back out to RDF, as SPARQL results sets are simple tabular values. Where a variable binds to a topic map item, the TMSPARQL implementation simply returns a suitable identifier for the item (typically a system-specific item identifier). Of course those identifiers should then be resolvable to return RDF data, but how that RDF data is generated is not constrained by TMSPARQL itself. It should also be noted that the CONSTRUCT form of SPARQL query can be used by SPARQL clients to define exactly what RDF the SPARQL endpoint returns.

</p>

<h2 id="limitation">Limitations of TMSPARQL</h2>

<p>Many of the limitations of TMSPARQL are actually limitations in SPARQL itself. For example, querying for the non-presence of specific topics is not terribly easy requiring some contortions with the bound() filter. Reification isn't handled natively (because it isn't handled natively in SPARQL despite the fact that RDF makes heavier use of reification than topic maps). As we chose not to extend SPARQL syntax, if you want to do more with your topic map than traverse related topics and filter on / retrieve type and property information you are force to use some "magic" identifiers - but we feel this is a worthwhile trade-off for interoperability.

</p>

<p>

The TMSPARQL language as presented here does not have direct support for variants (this is due to the mapping performed in our underlying topic map system that converts names, occurrences and variants into "topic property" items). A truly TMDM-compliant version of the language might add support for variants by adding a tms:variant predicate type and defining an appropriate traversal (from name item or variant item to variant item).

</p>

<h2 id="conclusion">Conclusion</h2>

<p>

TMSPARQL shows some promise for helping topic map repositories easily act as full citizens on the Linked Data Web providing a SPARQL query endpoint which, with only a little careful ontology mapping can be made to appear exactly like an RDF data store. The advantages here are primarily for the consumers of linked data - giving them only one query language to learn (SPARQL) and the ability to combine query results from both topic maps and RDF repositories as well as the various databases and other data stores that now expose SPARQL endpoints.

As well as the obvious interoperability benefits, TMSPARQL is also a clean small query language that is relatively easy to learn to write and to reason about which, we hope, should be able to cope with the majority of real-world topic map query use cases.

</p>

<h2 id="examples">Further Examples</h2>

<p>Here are a few additional sample queries to give a feel for how SPARQL can be used to query a topic map. For compactness I haven't included the PREFIX declarations.</p>

<h3>Filtering Values</h3>

<p>The FILTER construct in SPARQL can be used to restrict the results set in various ways. E.g.</p>

<pre>

SELECT ?person ?age WHERE {

?person ont:age ?age .

FILTER ((?age<40 && ?age > 18) || (?age = 50))

}

</pre>

<p><em>Find all people aged between 18 and 40 or exactly 50 years old.</em></p>

<p>SPARQL includes a number of predefined filter functions including URI validation and regular expression pattern matching. E.g.</p>

<pre>

SELECT ?person ?website WHERE {

?person ont:web ?website .

FILTER isuri(?website)

}

</pre>

<p><em>Find all ont:person topics with an ont:web property whose value is a URI.</em></p>

<pre>

SELECT ?person ?site WHERE {

?person a ont:person

OPTIONAL {

?person ont:website ?site

}

FILTER (regex(?site, "^http://"))

}

</pre>

<p><em>Find all ont:person topics with an ont:web property whose value starts with the string "http://".</em></p>

<h3>Optional Matches</h3>

<p>The OPTIONAL construct in SPARQL means that not all variables need to be bound by a pattern match:</p>

<pre>

SELECT ?person ?site WHERE {

?person a ont:person

OPTIONAL {

?person ont:website ?site

}

}

</pre>

<p><em>Find all topics of type ont:person and return the value of their ont:website property if they have one.</em></p>

<p>The OPTIONAL construct can also be combined with the bound() FILTER function:</p>

<pre>

SELECT ?person ?site WHERE {

?person a ont:person

OPTIONAL {

?person ont:web ?site

}

FILTER (!bound(?site))

}

</pre>

<p><em>Find all topics of type ont:person that do not have an ont:website property.</em></p>

<h3>TMDM Queries</h3>

<p>Using the special predefined TMSPARQL predicates it is possible to query the topic map data model at a more detailed level. </p>

<h4>Reification</h4>

<pre>

SELECT ?ageProperty ?ageValue ?ageReifier WHERE {

?ageProperty a ont:age .

?ageProperty tms:value ?ageValue

OPTIONAL { ?ageProperty tms:reifier ?ageReifier }

}

</pre>

<p><em>Find all names and occurrences of type ont:age, returning the item itself, the value and the reifying topic of the property if it is reified.</em></p>

<h4>Associations</h4>

<pre>

SELECT ?assoc, ?assocType, ?roleType WHERE {

?assoc a ?assocType .

?assoc tms:role ?rolePlayed .

?rolePlayed tms:player inst:12345 .

?rolePlayed a ?roleType

}

</pre>

<p><em>Find all associations in which the topic identified by the CURIE inst:12345 is a role player, returning the association item, the association type and the type of role played by the inst:12345 topic.</em></p>

<h4>Scope</h4>

<pre>

SELECT ?place, ?name WHERE {

?place a ont:place .

?place tms:topicProperty ?prop .

?prop a tm:displayName .

?prop tms:scope lang:de

}

</pre>

<p><em>Find all topics of type ont:place that have a property of type tm:displayName scoped by lang:de.</em></p>


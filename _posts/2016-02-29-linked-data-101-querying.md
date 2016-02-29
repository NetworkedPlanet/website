---
layout: post
title: Linked Data 101 - Querying data with SPARQL
tags:
  - LD101 series
  - linked data
  - sparql
comments: true
imgdir:	/assets/images/blog/linkeddata101/
excerpt: In the fourth part of our Linked Data 101 series we'll have a quick look what queries look like.
author: Jen
---

{: .well .text-center}
This article is part of the [Linked Data 101 series](/blog/tags/ld101-series/)

Previously...
------------

So far in the Linked Data 101 series, we looked first at [why we use URIs as identifiers](/blog/2016/02/16/linked-data-101-identifiers.html), and then moved on to looking at [predicates](/blog/2016/02/17/linked-data-101-predicates.html) in the second article. The third article had a walk-through of taking CSV data and [using Level Up online CSV to RDF converter](/blog/2016/02/18/linked-data-101-making-data-linkable-tutorial.html) to structure the data ready for the Web of Data.

Now that we've got some RDF from Level Up, I'll show you how to get started with some simple queries on that data. 

BrightstarDB
---------
 
There are various RDF data stores available for different platforms and with various offerings in terms of management tools. For the purpose of this article I'm going to use [BrightstarDB](http://brightstardb.com/) as it's a native .NET triple store (and cross-platform friendly), it's open source, and also it's [ours](http://networkedplanet.com/#products)! 

Installing BrightstarDB is very simple, grab the [latest release](http://brightstardb.codeplex.com/) and then fire up the installer.

![BrightstarDB installation]({{page.imgdir}}pol-install2.png){: width="550px" .img-medium .img-responsive .center-block .bordered-image}

{: .alert .alert-info}
Full documentation about installing and developing with BrightstarDB as well as using Polaris, is available online at [BrightstarDB documentation](http://brightstardb.readthedocs.org/en/latest/).

Polaris
---------

![Polaris icon]({{page.imgdir}}pol-icon.png){: width="120px" .img-medium .img-responsive .pull-left .gap-right-dbl .bordered-image}

Polaris is a Windows desktop application that allows a user to manage various aspects of local and remote BrightstarDB servers. Using Polaris you can:

- Create and delete stores on the server
- Import N-Triples or N-Quads files into a store
- Run a SPARQL query against a store
- Run an update transaction against a store

We're going to concentrate on creating a store, importing our triples and then doing simple queries on it.

Create a connection
-----

We can use different protocols - Embedded and REST - for connecting to the BrightstarDB server now installed on our machine. We're going to use the embedded protocol*:

1. Select File > New Connection
2. Enter "Embedded" as the Connection Name
3. Select "Embedded" as the Connection Type
4. Select a file path to use as the stores directory**
5. Click OK

\* If you prefer to run the BrightstarDB service a different way, you can [read more in the documentation here](http://brightstardb.readthedocs.org/en/latest/Running_BrightstarDB/#)

\** Make sure you have enough security access rights to read and write to that location

Create a data store
----

To create a data store select the new *"Embedded"* connection and select Server > New Store.

![Create a data store in Polaris]({{page.imgdir}}pol-newstore.png){: width="550px" .img-medium .img-responsive .center-block .bordered-image}

The Store Name field is pre-filled with a randomly generated name, so let's change it to something more memorable - Allotments.

Then we're going to take the [RDF data produced in the last article](/blog/2016/02/18/linked-data-101-making-data-linkable-tutorial.html) (a download is available on that page) and upload it to our store.

Importing data
---

As we've got BrightstarDB installed on our local machine, we're going to run a Local Import. However there are [more options for importing data](http://brightstardb.readthedocs.org/en/latest/Using_Polaris/#importing-data) depending on your server set up.

Unzip the data download produced by the Level Up converter - this gives you the same data in three different formats - N-Triples, RDF-XML and Turtle. Polaris can import any of these formats (along with N-Quads, RDF/JSON and Notation3), so I'm choosing to import the N-Triples file.

Select the *Allotments* store from the connections list, then choose Store > New > Import Job.

We're not concerned about specific graph names at this point so we simply select our N-Triples file using the file explorer dialog and click Start.

![Import data using Polaris]({{page.imgdir}}pol-import.png){: width="550px" .img-medium .img-responsive .center-block .bordered-image}

{: .alert .alert-info}
**Note:** Local import is not recommended for large data files. If the file you try to import exceeds 50MB in size a warning will be displayed. [Read more information in the docs](http://brightstardb.readthedocs.org/en/latest/Using_Polaris/#importing-data).

Select All
---------

The first query we're going to do is a simple "Select All" so that we can view all the triples in Polaris. Right-click the *"Allotments"* store and select New > SPARQL query.

Enter the query below in the Query field and then press F5 (or hit the "Run" icon button)

<pre>SELECT *
WHERE
{ ?s ?p ?o }</pre>

![SPARQL Select All query]({{page.imgdir}}pol-selectall1.png){: width="750px" .img-medium .img-responsive .center-block .bordered-image}

I've chosen <code>?s</code>, <code>?p</code> and <code>?o</code> for my variable names for the three parts of the triples - subject, predicate and object - you may choose to use different variable names. For example the below is the exact same query:

<pre>SELECT *
WHERE
{ ?id ?property ?value }</pre>

Flipping the tabs we can view the data in a results table or an XML view.

![SPARQL Select All results table]({{page.imgdir}}pol-selectall2.png){: width="750px" .img-medium .img-responsive .center-block .bordered-image}

![SPARQL Select All results XML]({{page.imgdir}}pol-selectall3.png){: width="750px" .img-medium .img-responsive .center-block .bordered-image}

Query: all triples for a particular resource
----
To view all the triples for a particular resource, we enter its identifier into the query, like so:

<pre>SELECT *
WHERE
{ <http://data.contoso.com/environment/allotments/358> ?p ?o }</pre>

This is similar to saying "Get me all the predicates and objects that have this identifier as their subject.

![SPARQL Get triples for a particular resource]({{page.imgdir}}pol-filter-id.png){: width="750px" .img-medium .img-responsive .center-block .bordered-image}

Query: all resources using a particular predicate
-----

Similarly, we can view all the resources that use a particular predicate and their values by entering the query below.

<pre>
SELECT *
WHERE
{ ?s <http://data.contoso.com/environment/ontology/facilities> ?o }
</pre>

![SPARQL Get triples for a particular predicate]({{page.imgdir}}pol-filter-pred.png){: width="750px" .img-medium .img-responsive .center-block .bordered-image}

As you can see, not all resources had properties using this predicate and so only 18 rows of triples are returned.

Query: all resources using a particular value
-----

Let's look up some resources that have entered a certain value as the object of their "suppliedPostcode" triple.

<pre>
SELECT *
WHERE
{ ?s <http://data.contoso.com/environment/ontology/suppliedPostcode> "E17" }
</pre>

![SPARQL Get triples using a particular value]({{page.imgdir}}pol-filter-val1.png){: width="750px" .img-medium .img-responsive .center-block .bordered-image}

This brings back 12 records, but as you can see we only have their identifiers, in order to return more information about those resources we need to specify more in the query.

<pre>
SELECT *
WHERE
{ 
?s <http://data.contoso.com/environment/ontology/suppliedPostcode> "E17" .
?s ?p ?o
}
</pre>

The first line of our query retrieves subjects using "E17" with the <code><http://data.contoso.com/environment/ontology/suppliedPostcode></code> predicate, and the second retrieves all triples that match those subjects.

![SPARQL Get triples using a particular value]({{page.imgdir}}pol-filter-val2.png){: width="750px" .img-medium .img-responsive .center-block .bordered-image}

Perhaps we don't want **all** the triples associated with the given subjects, but instead want to simply return one other value - we can modify the query like so:

<pre>
SELECT *
WHERE
{ 
?s <http://data.contoso.com/environment/ontology/suppliedPostcode> "E17" .
?s <http://www.w3.org/2000/01/rdf-schema#label> ?o .
}
</pre>

![SPARQL Get triples using a particular value]({{page.imgdir}}pol-filter-val3.png){: width="750px" .img-medium .img-responsive .center-block .bordered-image}

Ordering results
----

We can order those results by using the <code>ORDER BY</code> phrase:

<pre>
SELECT *
WHERE
{ 
?s <http://data.contoso.com/environment/ontology/suppliedPostcode> "E17" .
?s <http://www.w3.org/2000/01/rdf-schema#label> ?label .
}
ORDER BY ?label
</pre>

![SPARQL Order by]({{page.imgdir}}pol-order.png){: width="750px" .img-medium .img-responsive .center-block .bordered-image}

Learning more SPARQL
------

The queries above are probably the most straightforward (and useful!) queries to learn to get started with SPARQL and so this is where we'll leave it for our Linked Data 101 series. 

As with any data querying language there's various levels you may want to take your SPARQL skills up to. A good place to start is our [free 1 hour SPARQL 101 webinar](/blog/2016/01/18/linked-data-webinars-season-2.html) - the next one is being held on March 10th. As always [look our for posts](/blog/tags/sparql/) right here on the blog!

{: .well .text-center}
This article is part of the [Linked Data 101 series](/blog/tags/ld101-series/)

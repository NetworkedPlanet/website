---
layout: post
title: Linked Data 101 - Querying data with SPARQL
tags:
  - LD101 series
  - linked data
  - sparql
comments: true
imgdir:	/assets/images/blog/linkeddata101/
external_css: http://cdn.leafletjs.com/leaflet/v0.7.7/leaflet.css
external_js: http://cdn.leafletjs.com/leaflet/v0.7.7/leaflet.js
custom_css: /assets/stylesheets/ld101.css
custom_js: /assets/javascripts/ld101.js
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

{: .alert .alert-info .text-center}
Full documentation about installing and developing with BrightstarDB as well as using Polaris, is available online at [BrightstarDB documentation](http://brightstardb.readthedocs.org/en/latest/).

Polaris
---------

![Polaris icon]({{page.imgdir}}pol-icon.png){: width="120px" .img-medium .img-responsive .pull-left .gap-right-dbl .gap-bottom .bordered-image}

Polaris is a Windows desktop application that allows a user to manage various aspects of local and remote BrightstarDB servers. Using Polaris you can:

- Create and delete stores on the server
- Import N-Triples or N-Quads files into a store
- Run a SPARQL query against a store
- Run an update transaction against a store

{: style="clear:both;"}
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

The Store Name field is pre-filled with a randomly generated name, so let's change it to something more memorable - *Allotments*.

Then we're going to take the [RDF data produced in the last article](/blog/2016/02/18/linked-data-101-making-data-linkable-tutorial.html) (a download is available on that page) and upload it to our store.

Importing data
---

As we've got BrightstarDB installed on our local machine, we're going to run a Local Import (there are [more options for importing data](http://brightstardb.readthedocs.org/en/latest/Using_Polaris/#importing-data) depending on your server set up).

Unzip the data download produced by the Level Up converter. This gives you the same data in three different formats - N-Triples, RDF-XML and Turtle. Polaris can import any of these formats (along with N-Quads, RDF/JSON and Notation3), so I'm choosing to import the N-Triples file.

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

This is similar to saying "Get me all the predicates and objects that have this identifier as their subject."

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

As you can see, not all resources had properties using this predicate and so only 18 results are returned - showing the subject and object parts of the triples.

Query: all resources using a particular value
-----

Let's look up some resources that have entered a certain value as the object of their "supplied postcode" triple.

<pre>
SELECT *
WHERE
{ ?s <http://data.contoso.com/environment/ontology/suppliedPostcode> "E17" }
</pre>

![SPARQL Get triples using a particular value]({{page.imgdir}}pol-filter-val1.png){: width="750px" .img-medium .img-responsive .center-block .bordered-image}

This brings back 12 records, but as you can see we only have their identifiers (the predicate and object part of the triples have been supplied in the query), in order to return more information about those resources we need to ask for more in the query.

<pre>
SELECT *
WHERE
{ 
?s <http://data.contoso.com/environment/ontology/suppliedPostcode> "E17" .
?s ?p ?o
}
</pre>

The first line of our query retrieves subjects using "E17" with the <code><http://data.contoso.com/environment/ontology/suppliedPostcode></code> predicate, and the second retrieves all triples that link to those subjects.

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

Limiting the number returned
----

Only want the top 5? We simply add a <code>LIMIT</code> phrase to the SPARQL statement:

<pre>
SELECT *
WHERE
{ 
?s <http://data.contoso.com/environment/ontology/suppliedPostcode> "E17" .
?s <http://www.w3.org/2000/01/rdf-schema#label> ?label .
}
ORDER BY ?label
LIMIT 5
</pre>

![SPARQL Limit the number of results returned]({{page.imgdir}}pol-limit.png){: width="750px" .img-medium .img-responsive .center-block .bordered-image}


Only returning particular values
----

If we only want or need particular values, we can replace the <code>SELECT *</code> and be more specific:

<pre>
SELECT ?label ?lat ?long
WHERE
{ 
?s <http://data.contoso.com/environment/ontology/suppliedPostcode> "E17" .
?s <http://www.w3.org/2000/01/rdf-schema#label> ?label .
?s <http://www.w3.org/2003/01/geo/wgs84_pos#lat> ?lat . 
?s <http://www.w3.org/2003/01/geo/wgs84_pos#long> ?long . 
}
ORDER BY ?label
</pre>

![SPARQL Select which values to include]({{page.imgdir}}pol-values.png){: width="750px" .img-medium .img-responsive .center-block .bordered-image}

Making use of the data
------

You can see by the returned values how easily they can be visualised. Using [OpenStreetMap](https://www.openstreetmap.org/) (a free editable map of the world available as open data) and the open source [Leaflet.js](http://leafletjs.com) we can quickly place the pinpoints to view on a map using the javascript code:

<div id="map">

</div>

<pre>
var markers = [
    {"label":"Cheshire Fields", "long":-0.038715, "lat":51.576236},
	{"label":"Chestnuts Farm", "long":-0.014994, "lat":51.592189},
	{"label":"Forest Road", "long":0.005339, "lat":51.591496},
	{"label":"Hale End Road", "long":-0.000226, "lat":51.596406},
	{"label":"Higham Hill Common", "long":-0.02978, "lat":51.593777},
	{"label":"Honeybone", "long":-0.033135, "lat":51.577039},
	{"label":"Low Hall Farm", "long":-0.033687, "lat":51.571343},
	{"label":"Low Hall Lane", "long":-0.032928, "lat":51.576619},
	{"label":"Markhouse Common", "long":-0.026112, "lat":51.576161},
	{"label":"Sinnott Road", "long":-0.041737, "lat":51.598899},
	{"label":"Trencherfield", "long":-0.040005, "lat":51.596741},
	{"label":"Willow Tree", "long":-0.018091, "lat":51.605109}
];

var map = L.map('map').setView([51.58693, -0.0333882], 12);

var tiles = L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
	maxZoom: 19,
	attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
}).addTo(map);

for(var i = 0; i < markers.length; i++) {
	var m = markers[i];
	var marker = L.marker([m.lat, m.long]).addTo(map);
    marker.bindPopup(m.label);
}
</pre>

Learning more SPARQL
------

The queries above are probably the most straightforward (and useful!) queries to learn to get started with SPARQL and so this is where we'll leave it for our Linked Data 101 series. 

As with any data querying language there's various levels you may want to take your SPARQL skills up to. A good place to start is our [free 1 hour SPARQL 101 webinar](/blog/2016/01/18/linked-data-webinars-season-2.html) - the next one is being held on March 10th. As always [look our for posts](/blog/tags/sparql/) right here on the blog!

{: .well .text-center}
This article is part of the [Linked Data 101 series](/blog/tags/ld101-series/)

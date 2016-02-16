---
layout: post
title: Linked Data 101 - What's a predicate?
tags:
  - LD101 series
  - linked data
  - predicates
comments: true
imgdir:	/assets/images/blog/linkeddata101/
excerpt: In the second of our Linked Data 101 series, we'll talk about predicates and how shared vocabularies make published data more reusable.
author: Jen
---

Heading 1
-----

Yesterday we took a look at [the use of URIs in linked data](/blog/2016/02/16/linked-data-101-identifiers.html), we left off just as we were getting to a really interesting part - **predicates**! 

When we look at two disparate sources of information on the web, how do we decide that the two pieces have overlapping meanings, even when they are talking about different subjects, how do we know they contain information relevant to each other? Currently we need to do that process manually, or have extremely complex linguistic programs to try and do the work for us. Ever since the initial vision of the World Wide Web was dreamt of, the idea of being able to provide context and meaning to published information has been part of that plan. It was put on a back-burner for the initial versions of the web, but that goal has never been forgotten. 

With linked data (or as I like to think about it - *linkable* data) we explicitly describe the link between a Thing and its properties with a unique identifier, and what unique identifiers do we use on the web? You guessed it - [URIs](/blog/2016/02/16/linked-data-101-identifiers.html). Why the need for identifiers? Well, let's say I have some information that contains details about Wards, depending on the *context* that information could be about rooms in a hospital, a division of a geographical area governed by councillors, or even a young person who has been appointed a guardian by a court. By using unique identifiers we have a way of making these differences in meaning explicit - and these identifiers are known as predicates.

Heading 2
-----

Now that we're all caught up about WHY predicates, let's look at the HOW. Here's some simple CSV data and its presentation when structured as triples: 

<pre>
ID,Event,Location - Lat,Location - Long,Date & Time
EV890,Introduction To Linked Data,53.3957985,-1.5694953,13/7/2016 11:00:00 AM
EV891,Query the Web of Data with SPARQL,53.2205365,-4.1601993,20/4/2016 7:00:00 PM
EV892,Better data means easier collaboration,55.8555367,-4.3024977,3/8/2016 6:30:00 PM
</pre> 

{: .alert .alert-info}
For an explanation of the structure of a triple, please read the [first part in this Linked Data 101 series](/blog/2016/02/16/linked-data-101-identifiers.html)

For my predicates I've chosen descriptive URIs much in the same way that I'd choose a table's column heading.

<pre>
&lt;http://example.org/events/EV890&gt; &lt;http://example.org/events/title&gt; "Introduction To Linked Data" .
&lt;http://example.org/events/EV890&gt; &lt;http://example.org/events/latitude&gt; "53.3957985" .
&lt;http://example.org/events/EV890&gt; &lt;http://example.org/events/longitude&gt; "-1.5694953" .
&lt;http://example.org/events/EV890&gt; &lt;http://example.org/events/date&gt; "2016-07-13T11:00:00.0000000+00:00"^^&lt;http://www.w3.org/2001/XMLSchema#dateTime&gt; .
&lt;http://example.org/events/EV891&gt; &lt;http://example.org/events/title&gt; "Query the Web of Data with SPARQL" .
&lt;http://example.org/events/EV891&gt; &lt;http://example.org/events/latitude&gt; "53.2205365" .
&lt;http://example.org/events/EV891&gt; &lt;http://example.org/events/longitude&gt; "-4.1601993" .
&lt;http://example.org/events/EV891&gt; &lt;http://example.org/events/date&gt; "2016-04-20T19:00:00.0000000+00:00"^^&lt;http://www.w3.org/2001/XMLSchema#dateTime&gt; .
&lt;http://example.org/events/EV892&gt; &lt;http://example.org/events/title&gt; "Better data means easier collaboration" .
&lt;http://example.org/events/EV892&gt; &lt;http://example.org/events/latitude&gt; "55.8555367" .
&lt;http://example.org/events/EV892&gt; &lt;http://example.org/events/longitude&gt; "-4.3024977" .
&lt;http://example.org/events/EV892&gt; &lt;http://example.org/events/date&gt; "2016-08-03T18:30:00.0000000+00:00"^^&lt;http://www.w3.org/2001/XMLSchema#dateTime&gt; .
</pre>

As it is the data would be fine to publish on your internal or external data portal (using your portal's address rather than example.org of course!). It's 4 star data, meaning that not only is it in a non-proprietary format but that you've used URIs to denote your resources. Your data is ***linkable***, regardless of whether you choose to share it outside of your organisation. 

{: .alert .alert-info}
Given the way the levels of *open* data are promoted, it's unsurprising that many see linked data as a subsequent step that can only be taken after you've made a choice about whether to publish your data publicly - this could not be further from the truth! 
Rather than focus on how you plan to publish the data - think of how you need to *use* your data. Linked data makes it easier to consume external linked open datasets as well as merge and share data across departments whilst staying private to your organisation, making it easier to spot trends and perform data analysis.

Heading 3
----

A vocabulary collects together sets of predicates that are useful in describing specific types of things (they can also contain more information about describing types and how types relate to one another but that's beyond the scope of this article). 



The most used vocabulary at this point in time is the [Dublin Core vocabulary](http://semanticweb.org/wiki/Dublin_Core). This is a vocabulary published by the Dublin Core Metadata Initiative used to describe information about documents - such as Title, Description, Creator, and so on - so you can see why it would be such a well used vocabulary. Another useful vocabulary is from [Geonames](http://www.geonames.org/ontology/documentation.html), containing properties for describing places such as Name, Alternative Name, Population and suchlike. It's worthwhile to note that while Geonames has many properties for describing places, for latitude and longitude it reuses the [W3C Basic Geo vocabulary](https://www.w3.org/2003/01/geo/). 

A hugely popular vocabulary (due to its support in Google, Microsoft and Yahoo) is [Schema.org](http://schema.org). Many plugins for CMS website use the terms defined in Schema.org in order to embed the information in their webpages that they are talking about (for example) dates of events, and therefore when they appear on the search result they have additional useful information about upcoming events under their site name and description. 

Using published vocabularies
----

To make use of a published vocabulary, simply replace your predicate with the predicate from the published vocabulary. I've chosen to use the [Basic Geo Vocab](https://www.w3.org/2003/01/geo/) to describe my latitude and longitude, and [Schema.org](https://schema.org/Event) to describe the other details of my event. This changes my RDF to:


<pre>
&lt;http://example.org/events/EV890&gt; &lt;http://schema.org/name&gt; "Introduction To Linked Data" .
&lt;http://example.org/events/EV890&gt; &lt;http://www.w3.org/2003/01/geo/wgs84_pos#lat&gt; "53.3957985" .
&lt;http://example.org/events/EV890&gt; &lt;http://www.w3.org/2003/01/geo/wgs84_pos#long&gt; "-1.5694953" .
&lt;http://example.org/events/EV890&gt; &lt;http://schema.org/startDate&gt; "2016-07-13T11:00:00.0000000+00:00"^^&lt;http://www.w3.org/2001/XMLSchema#dateTime&gt; .
&lt;http://example.org/events/EV891&gt; &lt;http://schema.org/name&gt; "Query the Web of Data with SPARQL" .
&lt;http://example.org/events/EV891&gt; &lt;http://www.w3.org/2003/01/geo/wgs84_pos#lat&gt; "53.2205365" .
&lt;http://example.org/events/EV891&gt; &lt;http://www.w3.org/2003/01/geo/wgs84_pos#long&gt; "-4.1601993" .
&lt;http://example.org/events/EV891&gt; &lt;http://schema.org/startDate&gt; "2016-04-20T19:00:00.0000000+00:00"^^&lt;http://www.w3.org/2001/XMLSchema#dateTime&gt; .
&lt;http://example.org/events/EV892&gt; &lt;http://schema.org/name&gt; "Better data means easier collaboration" .
&lt;http://example.org/events/EV892&gt; &lt;http://www.w3.org/2003/01/geo/wgs84_pos#lat&gt; "55.8555367" .
&lt;http://example.org/events/EV892&gt; &lt;http://www.w3.org/2003/01/geo/wgs84_pos#long&gt; "-4.3024977" .
&lt;http://example.org/events/EV892&gt; &lt;http://schema.org/startDate&gt; "2016-08-03T18:30:00.0000000+00:00"^^&lt;http://www.w3.org/2001/XMLSchema#dateTime&gt; .
</pre>

How to choose a vocab
----

It's all very well for me to talk about how I chose to use a couple of popular vocabularies and then plonked them in my data, but how are you going to know about these vocabularies and which to use? Well, there are websites out there that help you find existing published vocabularies, such as [LOV](http://lov.okfn.org/dataset/lov), another good starting point is to reach out to the publishers of the Open Data that you are consuming and ask them about their preferred vocabularies, and of course we would also suggest [getting in touch with your friendly Linked Data experts](http://networkedplanet.com/#contact) to ask for advice too (yes, that is indeed a link to our contact detail page, it had to be done!).


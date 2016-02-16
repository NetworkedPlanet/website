---
layout: post
title: Linked Data 101 - What's a predicate?
tags:
  - LD101 series
  - linked data
  - predicates
  - vocabularies
  - ontologies
comments: true
imgdir:	/assets/images/blog/linkeddata101/
excerpt: In the second of our Linked Data 101 series, we'll talk about predicates and how shared vocabularies make published data more reusable.
author: Jen
---

Identifiers for context
-----

Yesterday we took a look at [the use of URIs in linked data](/blog/2016/02/16/linked-data-101-identifiers.html), we left off just as we were getting to a really interesting part - **predicates**! 

When we look at two disparate sources of information on the web, how do we decide that the two pieces have overlapping meanings, even when they are talking about different subjects, how do we know they contain information relevant to each other? Currently we need to do that process manually, or have extremely complex linguistic programs to try and replicate that work for us. 

Ever since the initial vision of the World Wide Web was dreamt of, the idea of being able to embed context and meaning into that published information has been part of that plan. It was put on a back-burner for the initial versions of the web, but that goal has never been forgotten. 

With linked data (or as I like to think about it - *linkable* data) we use a unique identifier to explicitly describe the link between a Thing and its properties, and what unique identifiers do we use on the web? You guessed it - [URIs](/blog/2016/02/16/linked-data-101-identifiers.html). 

Let's say I have some data that contains information about Wards, depending on the *context* that information could be about rooms in a hospital, a division of a geographical area governed by councillors, or even a young person who has been appointed a guardian by a court. By using unique identifiers we have a way of making these differences in meaning explicit - and these identifiers are known as predicates.

Building your vocabulary
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
Given the way the levels of *open* data are promoted, it's unsurprising that many people see linked data as a subsequent step that can only be taken after you've made a choice about whether to publish your data publicly - **this could not be further from the truth**! 
Rather than focus on how you plan to *publish* your data - think of how you need to *use* your data. Linked data makes it easier to consume external linked open datasets as well as merge and share data across departments whilst staying private to your organisation, making it easier to spot trends and perform data analysis.

Of course you want the set of predicates used in your data to be consistent across your organisation - and to do this you build a list of the predicates you use (along with some other useful terms) and put them in a **vocabulary** which you can choose to keep private to your organisation, or - like the raw data itself - you can choose to publish these sets of terms to a wider audience.

Using shared vocabularies
----

So how do we know that data from two different sources are talking about the same concepts? We do this by making use of **shared vocabularies** - simply replace your predicate with the predicate from the published vocabulary. 

A few examples of published open vocabularies are 

 -  [Dublin Core vocabulary](http://semanticweb.org/wiki/Dublin_Core). This is a vocabulary published by the Dublin Core Metadata Initiative used to describe information about documents - such as Title, Description, Creator, and so on - so you can see why it would be such a well used vocabulary. 
 -  [Geonames](http://www.geonames.org/ontology/documentation.html). This contains properties for describing places such as Name, Alternative Name, Population and suchlike. It's worthwhile to note that while Geonames has many properties for describing places, for latitude and longitude it reuses the [W3C Basic Geo vocabulary](https://www.w3.org/2003/01/geo/). 
 -  [Schema.org](http://schema.org). A hugely popular vocabulary (due to its support in Google, Microsoft and Yahoo) is  Many plugins for CMS website use the terms defined in Schema.org in order to embed the information in their webpages that they are talking about (for example) dates of events, and therefore when they appear on the search result they have additional useful information about upcoming events under their site name and description.
 -  [Ordnance Survey ontologies](http://data.ordnancesurvey.co.uk/ontology). A set of vocabularies for describing administrative areas of Great Britain, spatial relations, and more. 

I've chosen to use the [Basic Geo Vocab](https://www.w3.org/2003/01/geo/) to describe my latitude and longitude, and [Schema.org](https://schema.org/Event) to describe the other details of my event. This changes my RDF to:

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

Now when I merge my data with other data sources using the same vocabulary, our events and locations merge with ease.

Where to start?
------

It's all very well for me to talk about how I chose to use a couple of popular vocabularies and then plonked them in my data, but how are you going to know about these vocabularies in the first place, and what should influence your decision on which to use? Fear not, there are websites out there that help you find existing published vocabularies, such as [LOV](http://lov.okfn.org/dataset/lov), you can reach out to the publishers of open data that you are consuming (such as local or national government) and ask them about their preferred vocabularies, and of course we would also suggest [getting in touch with your friendly linked data experts](http://networkedplanet.com/#contact) to ask for advice too (yes, that is indeed a link to our contact detail page, it had to be done!). 

Can't find a shared vocabulary that matches your needs? Consider taking your private vocabulary and publishing it as open data. That's exactly what the Ordnance Survey company chose to do, why wait for someone else to do it when you can lead the field?

----------

I hope you've found this article informative! Please feel free to use the comments section with any feedback or questions. Next up in the series we're going to take what we've learnt about identifiers and triples and use our [Level Up Csv to RDF converter](http://levelup.networkedplanet.com) to grab some boring flat data and give it a semantic boost. 

{: .well .text-center}
This article is part of the [Linked Data 101 series](/blog/tags/ld101-series/)







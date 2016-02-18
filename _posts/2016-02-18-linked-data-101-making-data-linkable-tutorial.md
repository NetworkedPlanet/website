---
layout: post
title: Linked Data 101 - Making data linkable - tutorial
tags:
  - LD101 series
  - linked data
  - level up
  - csv conversion
comments: true
imgdir:	/assets/images/blog/linkeddata101/
excerpt: A walk-through in using our Level Up converter to go from 3-star to 4-star data using the theory learnt in parts 1 and 2 of this series.
author: Jen
---


{: .well .text-center}
This article is part of the [Linked Data 101 series](/blog/tags/ld101-series/)

Now that we're a lot more comfortable with [identifiers](/blog/2016/02/16/linked-data-101-identifiers.html) and [predicates](/blog/2016/02/17/linked-data-101-predicates.html), let's have a play around with some old-school CSV and give it a linked data boost with [Level Up](http://levelup.networkedplanet.com) - our free online converter.

Easy-peasy upload
----

For the purpose of this walkthrough I'm going to grab a dataset from the [London Datastore](http://data.london.gov.uk/) - the dataset I chose contains allotment details, which is published under an [Open License](http://www.nationalarchives.gov.uk/doc/open-government-licence/version/2/) and is in CSV format. To get started, [download the dataset](http://data.london.gov.uk/dataset/allotment-locations) and open the [Level Up homepage](http://levelup.networkedplanet.com).

Uploading the CSV file is a simple case of either dragging the file into the upload area, or clicking the upload area to open a file selection window.

![upload a CSV dataset to the Level Up converter]({{page.imgdir}}lu-upload.png){: width="600px" .img-medium .img-responsive .center-block .bordered-image}

Default configuration
----

As we saw on the previous blog posts in the [series](/blog/tags/ld101-series/), the basic steps in structuring flat data into semantic data is the use of URIs as identifiers and predicates. Level Up automatically sets up the converter with a set of URIs, so if you want to skip ahead and hit "Convert your CSV" then go for it! In the rest of this post we'll take a look at changing those URIs to make them a bit more useful.

<div class="well text-center">
    <div class="row">
        <div class="col-md-6">
            <a href="#"><img src="{{page.imgdir}}lu-map1.png" alt="Automatically generated identifiers and predicates" width="450px" class="img-medium img-responsive bordered-image"></a>
        </div>
        <div class="col-md-6">
            <a href="#"><img src="{{page.imgdir}}lu-map2.png" alt="Automatically generated identifiers and predicates" width="450px" class="img-medium img-responsive bordered-image"></a>
        </div>
    </div>
</div>

Choosing a prefix
----

The default prefix uses our good friend, example.org, along with the uploaded filename. Whilst useful, my data portal is going to sit on an intranet for the fictional company - contoso - so I'm going to tweak it a little so that my prefix for the predicates becomes <code>http://data.contoso.com/environment/ontology/</code>. As I update the prefix, all the predicate URIs and the main identifier URI are updated too.

![Update the prefix]({{page.imgdir}}lu-prefix.PNG){: width="800px" .img-medium .img-responsive .center-block .bordered-image}

Which column shall I use as the identifier?
----

I can see from both the column name and the preview data at the bottom of the page that the <code>GLA_ID</code> column contains a numeric identifier for each record, so I select the "ID" radio button next to <code>GLA_ID</code> and as that column contains a number rather than a valid URI I scroll down to check out what my identifier template is looking like.

Currently it's using the prefix <code>http://data.contoso.com/environment/ontology/</code> and a row number tag <code>{rn}</code>. Firstly, I don't want my resources to sit in the <code>/ontology/</code> namespace so I change that to <code>/allotments/</code>, given that I want to use my ID <code>GLA_ID</code> I edit the template to include a tag for <code>GLA_ID</code> instead. To protect myself against typos I use the <code>Tags</code> link to show me a drop down list of all available tags and select <code>GLA_ID</code>, which adds it to the end of my identifier template:

![Update the identifier template]({{page.imgdir}}lu-identifiertemplate.PNG){: width="800px" .img-medium .img-responsive .center-block .bordered-image}

Choosing predicates for columns
---

Now we move on to the predicates, Level Up has chosen some default predicates for me based on my prefix and the column name, but I'm going to have a quick scan through my columns and see if anything obvious jumps out at me. Here's a list of the columns shown:

 - GLA_ID 
 - Borough_Ref
 - Name
 - Location
 - SuppliedPostcode
 - NearestPostcode
 - Borough
 - Organisation
 - Facilities
 - Grade
 - Comments
 - Easting
 - Northing
 - Latitude
 - Longitude

Straight off I can see that we can use the [Basic Geo Vocab](https://www.w3.org/2003/01/geo/) for the lat/long values, and the [OS Spatial Relations Ontology](http://data.ordnancesurvey.co.uk/ontology/spatialrelations/) for the easting and northing values. Let's pop those in, and set their data types to whole number for easting/northing values and decimal number for latitude/longitude values.

![Choosing geo predicates]({{page.imgdir}}lu-geo.PNG){: width="800px" .img-medium .img-responsive .center-block .bordered-image}

Now let's have a look through the other columns, apologies in advance as I will jump around the list slightly rather than working top to bottom.

##### **Name** #####
The next "easiest" column I can see is <code>Name</code>. In most cases when choosing a predicate for a label or name of a Thing (when we're not working from a specific vocabulary that defines a label predicate) we tend to choose between the [RDF Schema](https://www.w3.org/TR/2004/REC-rdf-schema-20040210/)'s "label" and [Dublin Core](http://dublincore.org/documents/2012/06/14/dcmi-terms/)'s "title" (or [FOAF](http://xmlns.com/foaf/spec/) for people, group or organisation names). I believe label is more accurate than title in this case, so I'm using <code>http://www.w3.org/2000/01/rdf-schema#label</code>. 

##### **Organisation** #####
Looking through the raw data I can see that it's not always filled out, and when it is it's in an inconsistent manner. The context is also not fully clear and so I'm going to keep it within my domain for now and change the predicate to <code>http://data.contoso.com/environment/ontology/associatedOrganisation</code> - if it's needed in the future we can clarify whether the organisations are the owners, managers or similar and update our data at a later date. 

##### **Borough_Ref and Borough** #####

These look like some likely candidates to appear in a shared vocabulary, and yep - the OS Admin Geo Ontology comes back with a hit - both for [Borough](http://data.ordnancesurvey.co.uk/ontology/Borough) and [London Borough](http://data.ordnancesurvey.co.uk/ontology/admingeo/LondonBorough)*. However, the hits are **classes** rather than properties (more on this in an upcoming blogpost) so I don't want to use those identifiers as predicates. As with Organisation, I'm going to tweak the default predicates very slightly to use the more common practise of writing property URIs using camel case: <code>http://data.contoso.com/environment/ontology/boroughRef</code> and <code>http://data.contoso.com/environment/ontology/borough</code>. As the <code>Borough_Ref</code> is a numerical value in the raw data I set the datatype for that column to whole number.

{: .small .well}
\* Whilst outside the scope of this walkthrough, we would want to check that this is accurate based on the *contents* of the raw data, quite often a column heading will give the impression that all of its contents are, for example, London Boroughs, when in reality the data may be a mix of Wards, Boroughs and other administrative breakdowns of areas.

##### **Location / SuppliedPostcode / NearestPostcode / Facilities / Grades / Comments** #####

The rest of the columns I leave the predicates as they are (whilst tweaking into camel case). <code>Location</code>, <code>Features</code>, and <code>Comments</code> often contain text content in English e.g. "between the railway tracks north of Thayers Farm Road" so I'm going to set the data type to text and select UK English by using the typeahead language selector.

To summarise, we now have a set of predicates that looks like this:

{: .table}
|-----------------+------------+-----------------+----------------|
|   Column       |         Predicate            |    Data Type      |
|-----------------|------------|-----------------|----------------|
|	GLA_ID (ID)	|	http://data.contoso.com/environment/ontology/GLA_ID **	|	*default*	|
|	Borough_Ref	|	http://data.contoso.com/environment/ontology/boroughRef	|	Whole number	|
|	Name	|	http://www.w3.org/2000/01/rdf-schema#label	|	*default*	|
|	Location	|	http://data.contoso.com/environment/ontology/location	|	Text - English (United Kingdom)	|
|	SuppliedPostcode	|	http://data.contoso.com/environment/ontology/suppliedPostcode	|	*default*	|
|	NearestPostcode	|	http://data.contoso.com/environment/ontology/nearestPostcode	|	*default*	|
|	Borough	|	http://data.contoso.com/environment/ontology/borough	|	*default*	|
|	Organisation	|	http://data.contoso.com/environment/ontology/associatedOrganisation	|	*default*	|
|	Facilities	|	http://data.contoso.com/environment/ontology/facilities	|	Text - English (United Kingdom)	|
|	Grade	|	http://data.contoso.com/environment/ontology/grade	|	*default*	|
|	Comments	|	http://data.contoso.com/environment/ontology/comments	|	Text - English (United Kingdom)	|
|	Easting	|	http://data.ordnancesurvey.co.uk/ontology/spatialrelations/easting	|	Whole number	|
|	Northing	|	http://data.ordnancesurvey.co.uk/ontology/spatialrelations/northing	|	Whole number	|
|	Latitude	|	http://www.w3.org/2003/01/geo/wgs84_pos#lat	|	Decimal number	|
|	Longitude	|	http://www.w3.org/2003/01/geo/wgs84_pos#long	|	Decimal number	|


{: .small .well}
\** The column set as the ID will not be added as a property, so we don't need to concern ourselves with this predicate. If you want to use it in the identifier and have it as a property in the raw data, do not select it as the primary ID - simply use its tag in the identifier template.

Convert!
---

That's everything set up - all that's left now is to hit the "Convert your CSV" button and let Level Up do its magic.

![Convert CSV to RDF]({{page.imgdir}}lu-convert.PNG){: width="800px" .img-medium .img-responsive .center-block .bordered-image}

Bam! We can now download our data ->

![Download your converted data]({{page.imgdir}}lu-congrats.PNG){: width="800px" .img-medium .img-responsive .center-block .bordered-image}

The downloaded zip file contains RDF in three different formats: N-Triples, Turtle and RDF-XML. Going into the various formats is outside the scope of this article, so here's some segments of what to expect, plus a download of the zip file itself. 

** N-Triples - .nt **

![N-Triples Preview]({{page.imgdir}}lu-nt.PNG){: width="800px" .img-medium .img-responsive .center-block .bordered-image}

** Turtle - .ttl**

![Turtle Preview]({{page.imgdir}}lu-ttl.PNG){: width="800px" .img-medium .img-responsive .center-block .bordered-image}

** RDF-XML - .rdf**

![RDF-XML Preview]({{page.imgdir}}lu-rdf.PNG){: width="800px" .img-medium .img-responsive .center-block .bordered-image}

<p class="text-center">
<a class="btn btn-default" href="/assets/downloads/gla-allotment-locations-160218101935.zip">
<span class="glyphicon glyphicon-download-alt">
Download zip file
</span>
</a>
</p>

All done! 
-----

This article has guided you through the process of using [Level Up](http://levelup.networkedplanet.com) to convert CSV into 4-star linked data. In a real world scenario, this would be one step in a project which would start by looking at your data and first mapping out your own vocabulary of predicates.

Level Up is in beta release so please do let us know if you have [suggestions or feedback](http://levelup.networkedplanet.com/feedback) or [a copy of the converter software to run in house](/#contact) (important if you are working with personal data).

<p class="text-center">
<a class="btn-lg btn-primary" href="http://levelup.networkedplanet.com">Try it yourself at Level Up!</a>
</p>

Next in the series we'll be taking a quick look at a few more linked data concepts - such as Types, and don't forget we also run webinars and training throughout the year. See you next time!


{: .well .text-center}
This article is part of the [Linked Data 101 series](/blog/tags/ld101-series/)

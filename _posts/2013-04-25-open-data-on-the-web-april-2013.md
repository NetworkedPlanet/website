---
layout: post
title: Open Data On The Web  - April 2013
category: Linked Data
tag: linked data
tag: open data
tag: sparql
category: Theory and Practice
author: kal
---
I was privileged to be one of the attendees of the Open Data on the Web workshop organized by W3C and hosted by Google in London this week. I say privileged because the gathering brought together researchers, developers and entrepreneurs from all around the world together in a unique mix that I'm sure won't be achieved again until Phil Archer at W3C organizes the next one.

In the following I have not used direct quotes from those named as I didn't make many notes of direct quotations. I hope that I have not misrepresented anyone, but if I have, please let me know and I will fix the text. This is not a journalistic report, its more a reflection of my concerns through the prism of a lot of people way smarter than me saying a lot of interesting things.



<strong>Sustainability</strong>



The workshop was kicked off by John Sheridan reminding us that to build anything of permanence one needs to get the fundamentals right - providing for discovery (a topic that was to come up again and again during the workshop); cementing our offerings so that people can have confidence not only in the data itself but also in our commitment to sustaining that data.



Sustained data publishing was another topic that came up in several talks. In John's talk he asked us if we would be willing to mortgage our house to start a business based on the current crop of open data. While some brave souls have done just that, there is a general feeling that there just is not the confidence in the sustained availability and maintenance of open data. As Alvaro Graves commented later in the day, publishing data is like having children, you can't just push it out of the door and leave it to get on with its life, you have a commitment to it (another analogy that resonates more with geeks like me is to open source - a successful project involves far more effort than simply putting source on GitHub; you have a commitment to documentation, updates, support for your users and development of new features).



One of the issues highlighted, again by Alvaro, is the current trend of releasing data created through hackathons, which tends to promote the one-off data dump model that makes the data less suitable for building on. Possible solutions to this problem were a little thin on the ground. John Sheridan suggested that there probably exists a spectrum of solutions from a community-driven data publishing effort at one end, through institutional commitment and contracts, to legislative / statutory backing at the other end. There was much talk of the role that government has to play in getting this commitment to sustainability off the ground. Governments tend to have control over critical information infrastructure (mapping data, data about core service provision, address data etc); and tend to have data that needs to be updated or reported on on a regular cycle. Both of these factors make governments amongst the first institutions that should be leaned on to make a sustained commitment to publishing open data. I feel it is our responsibility as a community of evangelists and developers to get the right tools into the hands of potential consumers of that data, and those tools should have some means of providing feedback to the data publishers - there needs to be a virtuous circle, where data publishers are recognized for their contribution and get visibility on the value they enable as a means to encourage them to continue publishing data.



<strong>Make It Simpler ?</strong>



Another key theme that took me somewhat by surprise was a number of speakers advocating for open data to be published in simpler formats: by which I think all meant CSV. For Mark Birbeck, the challenge was not so much getting data into RDF but getting data that aligns consistently (in terms of the coding for time frames, geospatial references etc). Mark also pointed out that tabular data such as CSV is far easier to process with line-oriented tools and also with data analytics tools such as Hadoop. Rufus Pollock from the Open Knowledge Foundation and Omar Benjelloun from Google both presented data packaging formats (Simple Data Format and DSPL) both of which seek to make collections of tabular data available in a downloadable package that includes metadata. Meanwhile on the same panel Stuart Williams of Epimorphics was valiantly putting the point that in some cases the metadata, especially provenance metadata can not only dwarf the data itself, but is fundamental in determining the confidence that can be placed in the data.



In the two days of the workshop I saw as much effort expended on the question of "simply" publishing CSV data as on almost any other aspect of linked open data on the web. I find that a bit disheartening, it feels like the community is actively making a retrograde step. I have nothing against the publication of CSV as a stop-gap measure to address the need for open data, but I worry that the amount of attention this issue receives from the Linked Open Data (LOD) community detracts from other, equally important issues and will send the message that CSV is OK for LOD. There are undoubtedly some who believe this to be the case, but I am totally unconvinced that CSV is a suitable format for *linked* open data.



<strong>Data As A Service</strong>



This discussion around CSV packaging and publication and other discussions during the workshop raised another interesting question that I haven't really spent a lot of time considering and that is the tension between offering data as a resource and offering data as a service. When I'm putting together demos or looking for data to hack I often want to get a data dump, pull all the data onto my machine where I can run it through the processes I want to apply to it. When I just want to look something up (say in MusicBrainz or DBPedia) however, I'll use SPARQL - I don't want gigabytes of RDF data on my machine to answer a query like "who played in the Grateful Dead". There seemed to be some doubt about whether data that sits behind a service can be trusted to be as sustainably available as data available as a dump. In fact it was a question put to me after my presentation on OData / SPARQL interoperability. The fact that the data is accessed by a query API means that the consumer is dependent on the server for continued access to data. It was suggested that if you are building a business based on using data behind a service you don't control you may feel nervous about that. However, I feel that there are two strong counter arguments:

<ol>

	<li>There are well-understood mechanisms for reducing that nervousness - distribution / mirroring of popular services is one; service level agreements for commercial access to data services is another.</li>

	<li>The web already consists of any number of applications that depend on big third-party APIs such as Flickr and Twitter. The fact that you can't get a data dump of tweets or photo metadata doesn't seem to have prevented people building applications and even businesses on these APIs.</li>

</ol>

In fact, this issue with data services is basically just a reformulation of the need for sustainability and the points made by John Sheridan that I outlined at the top of this piece. I don't see the "download it all to my machine" as a scalable solution - it doesn't scale up to handle terabyte science data and it doesn't efficiently scale down to enable true semantic web applications for smaller devices. Effective distributed query *has* to be the way that LOD moves to ubiquitous consumption - we aren't there yet, but if we want to keep our eyes five or ten years forwards then we can't be thinking of solutions that rely on local mash-ups of data dumps. Even in the here and now, we heard from a number of presenters that providers of open data want to be able to measure the impact and usage of their data. This, I think, could tend to preference data services over data dumps due to the quality of usage data that monitoring service API accesses can provide. That said, there is a role for both properly packaged data dumps and open data services and perhaps publishers should be considering more carefully if their data dump should be accompanied by a SPARQL and/or OData endpoint, and if their data services should be accompanied by raw data dumps. I detected a undercurrent of insistence that data behind a service API is not "open" - I believe that is wrong, and dangerously so.



<strong>Discoverability</strong>



Omar Benjelloun from Google in his presentation also made the point that data sets need good web pages. To which I can only say "amen" - too many data sets that are near impossible to find through web search engines and despite the efforts of CKAN a directory of open data is always going to be hard to maintain and to scale. If we are publishing data on the web, lets make sure that it is discoverable. Aggregators such as CKAN help to some extent but web-scale discoverability can only be quickly achieved by leveraging the existing web-scale search infrastructure. Christopher Gutteridge from Southampton University raised some interesting concerns around the trustworthiness of data discovered through uncritical web crawling, but I think that adopting the sort of practices he advocates for double checking whether data found within a domain is truly sanctioned by the domain owner may prove to be critical, especially when applications are automatically discovering data sets.



<strong>Attribution &amp; Licensing</strong>



This is one of those can of worms areas that (a) is more a social issue than a technical one and (b) is probably not going to get a lot of attention because, quite frankly most people find it boring. However its a critical component of LOD that will only cause greater problems the longer it is left to fester. Leigh Dodds has already done some initial research and thinking in this area and outlined some of the issues. The issues in this area that interest me are:

<ul>

	<li>Would it be possible to simplify open data licensing through a Creative Commons-style approach of defining a set of licenses with a well-defined set of attributes to them that can be used to govern how data is attributed and linked to and uses to which it can be put ?</li>

	<li>What does it mean when a consumer of LOD publishes another data-set derived from one or more source data-sets. Are data licenses viral ? What level of remixing is sufficient for a work to count as a new unique work ? I am sure that there is precedent in offline publishing and online content publishing - the question is are such precedents appropriate ? Will we need to test this in case law (as was suggested by Bob Schloss from IBM in a different session).</li>

	<li>What does it mean when a consumer of LOD publishes an application that internally makes use of one or more data sets or a data set synthesized from one or more data sets, but does not display the data (for example using Wordnet in a natural language interface)</li>

	<li>How can we make a solution scale for:

<ul>

	<li>Applications that make use of hundreds or thousands of data sets</li>

	<li>Applications that discover data sets at run-time</li>

</ul>

</li>

</ul>

<strong>And there was so much more</strong>



Writing up the last of these notes on the train on the way home from the workshop I am both frazzled and buzzing. In the last 48 hours I have learned about stuff that I want to emulate, things that I need to make sure go into our products and things that are just going to worry me for years to come. In these 2000 words, I feel I have really only scraped the surface and I'm sure that there was a load of stuff that just went completely over my head. I'll leave it to others to fill in all the gaps I have left in my truly partial account of an amazing event.



The agenda for the day, along with links to the papers and presentations are all available <a href="http://www.w3.org/2013/04/odw/">here on the W3C website</a>. My own presentation on OData/SPARQL interoperability is also available <a href="http://www.slideshare.net/NetworkedPlanet/o-data-sparqlinterop">here on Slideshare</a>.
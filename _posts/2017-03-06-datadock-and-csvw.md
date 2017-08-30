---
layout: post
title: DataDock and CSVW
excerpt: Getting into the technical breakdown of how DataDock works, first we'll take a look at its use of "CSV on the Web" (CSVW)
date:   2017-03-01 10:00:00
author: Jen
imgdir:	/assets/images/blog/datadock/
image: /assets/images/blog/datadock.png
imagealt: DataDock Logo
comments: true
tags:
  - datadock
  - free data publishing
  - standards
  - csvw
  - datadock-intro
---

When we publish anything on the web it should go without saying that in order for that distributed information to be usable, we must adhere to standards when we publish it. If everyone had their own way of marking some text in a web page to be **bold**, web page browsers would have an impossible task of displaying that text in the way it was meant to be shown. That's why we have the standard markup language of [HTML](https://www.w3.org/html/) to enable everyone to publish web pages.

Similarly, when we publish data on the web we should look to standards to ensure consistency and interoperability between distributed data publishers and any applications that need to pull that data into their systems. DataDock currently makes use of two main recommended approaches to publishing data on the web - "CSV on the Web" (CSVW) and Linked Data. This blog post will concentrate on CSVW and there will be a follow up for those interested in Linked Data.

The first stage in [DataDock](http://datadock.io)'s processing pipeline is to take a <abbr title="Comma Separated Values">CSV</abbr> file of tabular data, and open it to allow the DataDock user some basic control over how that data should be processed. Whilst the current amount of user control over the CSV processing is straightforward datatype selection of the different columns, we will be rapidly expanding DataDock's abilities to allow more user control over defining the structure of the CSV they are publishing.
 
![CSV columns list]({{page.imgdir}}csvw/columns.png){: .img-medium .img-responsive .center-block .bordered-image}

The W3C's [CSV on the Web Working Group](https://www.w3.org/2013/csvw/wiki/Main_Page) developed specifications relating to describing tabular data. This makes it the obvious choice for us to adopt this standard when we pull the CSV into the DataDock processing pipeline. There is now a [W3C CSV on the Web Community Group that is open to all](https://www.w3.org/community/csvw/), where there is a focus on discussion and support for implementors, publishers and spec developers to share experience with CSVW and related ideas. 

Using the CSVW specification, DataDock takes the information entered by the user (e.g. title / description / selected license) and combines it with the list of columns to produce a metadata JSON file. An example of one of the [metadata JSON files](https://github.com/jennet/odcamp-demo/blob/gh-pages/csv/Bristol_Monuments.csv/Bristol_Monuments.csv-metadata.json) produced during the import of a CSV into DataDock is shown below (the example below only shows the first four of the columns for brevity):

<script src="https://gist.github.com/jennet/1b681faa594f86a2a417302c96600575.js"></script>

In its current release, DataDock auto-creates the column definitions, creating the machine-friendly <code>name</code>, and <code>property_url</code> from each column's header value, which is set as the initial value in <code>titles</code>. DataDock currently asks for user input only when it comes to the column's <code>datatype</code>, although it does make a simple guess at the datatype based on the values of the first non-header row of the selected CSV. Future upgrades to the DataDock platform will make use of the more extended definitions of the CSVW standard.

After the CSVW metadata file has been created, DataDock's conversion process uses the metadata file to generate <abbr title="Resource Description Framework">RDF</abbr> linked data. The DataDock then uses the linked data to generate the pages for the data portal, and publishes all this to the user's target GitHub repository.

Each DataDock repository has a "csv" directory that contains a sub-directory for each dataset. This contains the original CSV upload along with its CSVW metadata JSON file. You can find the CSV and CSVW metadata relating to the examples from the [previous blog post](/blog/2017/03/01/connecting-the-dots.html) on [my GitHub repo here](https://github.com/jennet/odcamp-demo/tree/gh-pages/csv/Bristol_Monuments.csv).
 
 For those who want to learn a bit more about CSVW, [a more in-depth blog post is available by Gregg Kellogg](http://greggkellogg.net/%3Fp%3D293), or if you're a documentation geek then feel free to dive into the [recommendations and notes published by the CSVW working group](https://www.w3.org/2013/csvw/wiki/Main_Page).
 
 It's possible that future versions of the DataDock will include an API layer, and that this may handle more complex CSV processing using supplied metadata files. If that's something that you would be interested in, [make it known as a feature request](https://github.com/NetworkedPlanet/datadock/issues) on our support site.
 
 The next blog post will dive into the linked data part of the publishing pipeline. It's that side of things that the most exciting for me personally, because as we add enhancements to the CSVW <code>property_url</code> definition user control, we can add features to publish and reuse standard vocabulary terms to define the data published from disparate sources - whilst keeping this standard of data publishing free and as easy as possible for non-technical people to use.



<hr />

![DataDock logo]({{page.imgdir}}DataDock_ColourTrans.png){:height="149px" width="400px" .img-medium .img-responsive .center-block .bordered-image}


{: .well .text-center}
This article is part of the [Data Dock Intro series](/blog/tags/datadock-intro/)
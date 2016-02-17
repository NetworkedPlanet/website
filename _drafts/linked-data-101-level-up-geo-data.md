---
layout: post
title: Linked Data 101 - Improving CSV data
tags:
  - LD101 series
  - linked data
  - level up
  - geo data
comments: true
imgdir:	/assets/images/blog/linkeddata101/
excerpt: In the third of our Linked Data 101 series, we'll use Level Up to take some CSV containing geo data and get it ready for publishing on the Web of Data
author: Jen
---

Now that we're a lot more comfortable with [identifiers]() and [predicates](), let's have a play around with some old-school CSV and give it a linked data boost with [Level Up](http://levelup.networkedplanet.com) - our free online converter.

Easy-peasy upload
----

For the purpose of this walkthrough I'm going to grab a dataset from the [London Datastore](http://data.london.gov.uk/) - the dataset I chose contains allotment details, which is published under an [Open License](http://www.nationalarchives.gov.uk/doc/open-government-licence/version/2/) and is in CSV format. To get started, [download the dataset](http://data.london.gov.uk/dataset/allotment-locations) and open the [Level Up homepage](http://levelup.networkedplanet.com).

Uploading the CSV file is a simple case of either dragging the file into the upload area, or clicking the upload area to open a file selection window.

![upload a CSV dataset to the Level Up converter]({{page.imgdir}}lu-upload.png){: width="600px" .img-medium .img-responsive .center-block .bordered-image}

Default configuration
----

As we saw on the previous blog posts in the [series](/blog/tags/ld101-series/), the basic steps in structuring flat data into semantic data is the use of URIs as identifiers and predicates. Level Up automatically sets up the converter with a set of URIs, so if you want to skip ahead and hit "Convert your CSV" then go for it! In this post we'll look at changing those URIs to make them a bit more useful.

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




---
layout: post
title: Don't Forget Metadata!
tags:
  - open data
  - metadata
  - VoID
comments: true
image: /assets/images/blog/card_catalog.jpg
imagealt: Card Catalog by http://www.flickr.com/photos/mamsy/ [CC BY 2.0 (http://creativecommons.org/licenses/by/2.0)], via Wikimedia Commons
excerpt: When publishing your open data it can be easy to forget that for it to be useful it needs to be discoverable...
---

I have many fond memories as a kid of our local libraries. I was fortunate to grow up a short walk away from
what was at the time the [largest non-national library in Europe](https://en.wikipedia.org/wiki/Birmingham_Central_Library) 
as well as a closer local library in a [grand
red-brick Victorian building](https://en.wikipedia.org/wiki/Spring_Hill_Library). 
One of those memories is the card indexes. I loved the card index (yes,
I was a metadata geek from an early age). Armed only with a question and some idea about keywords to 
use you could riffle through wooden drawers full of pink, blue and beige cards and then wander off 
to the stacks to find the answers. Magic stuff.

One of the great things about publishing data using RDF is that the structure is flexible enough
to make each of your individual datasets completely self-describing. You can use RDF 
to express the data, the schema (or ontology) of that data and the metadata all in one package.
There are a number of existing RDF ontologies that touch on the area of metadata, but probably the
most well-known and widely used one for describing dataset metadata is [VoID](https://www.w3.org/TR/void/).
VoID provides you with the means to identify and describe datasets as well as to provide metadata
ranging from contact and licensing information to example dataset resource URIs and patterns for accessing
the content of the dataset.

The question then is where to place this metadata. One obvious answer is to add the metadata in to 
the RDF dataset that it describes. This is great for the user that has chosen to access that data; 
but in this loose book / dataset analogy metadata that is contained inside your dataset is equivalent to 
that US Library of Congress metadata that you find inside the front cover of a book. 

Dataset metadata should be the card index to all that open data you publish. 
Without it being in a single central location, your users must aimlessly wander the shelves, pulling down dataset after 
dataset in search of what they want.  

A better solution is to treat the metadata about datasets as a separate dataset in its own right. 
Think of this as the downloadable / queryable card-index to your data library. Indeed the VoID recommendation
goes as far as to [suggest](https://www.w3.org/TR/void/#discovery) that you use a "well-known" URL for the location of that dataset - sort of
the equivalent of having your virtual card-index always just on the left as you come through the door (that was 
the sound of an analogy getting pushed to breaking point).

Metadata management doesn't have to be hard. Our [Data Platform](http://dataplatform.co.uk/) product has VoID 
metadata management built-in so every dataset you publish has an entry in a metadata dataset that is automatically
updated when you update the dataset itself through the UI. But regardless of what method you use to publish
open data, it is important to recognize that your metadata is the key to your data.

Image by [http://www.flickr.com/photos/mamsy/](http://www.flickr.com/photos/mamsy/), [CC BY 2.0](http://creativecommons.org/licenses/by/2.0), via Wikimedia Commons
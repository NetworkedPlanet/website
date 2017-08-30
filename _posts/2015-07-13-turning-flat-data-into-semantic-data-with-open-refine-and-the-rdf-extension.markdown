---
layout: post
title:  "Turning flat data into semantic data with Open Refine and the RDF extension"
date:   2015-07-13 15:21:38
author: JW
imgdir:	/assets/images/csv_to_rdf/
status: live
excerpt: Most of the data that organisations hold will be in some form of flat data, either in spreadsheets or relational databases. In order for the data to achieve either 4 or 5 star levels of Open Data, this data must be changed to not only use non-proprietary formats but it must also use URIs so that each object can be linked with other data across the World Wide Web.
tags:
  - open refine
  - rdf
  - tutorial
---
Most of the data that organisations hold will be in some form of flat data, either in spreadsheets or relational databases. In order for the data to achieve either [4 or 5 star levels of Open Data][5-star] this data must be changed to not only use non-proprietary formats but it must also use URIs so that each object can be linked with other data across the World Wide Web.

For ongoing data management purposes, organisations would choose to either input data directly into semantic data storage, or write custom programs to output standardised semantic data as a scheduled job, but for smaller amounts of data or one off jobs, there are free tools available that we can use, such as [Open Refine][open-refine] with the [RDF Extension from DERI][rdf-refine].

## Some background – What is RDF? ##

The accepted best practise language for describing web resources and associated information is the Resource Description Framework (RDF). RDF syntax is made up of statements known as triples; which are made up of:

* a **subject** – a URI that is used as a consistent addressable identity for the resource
* a **predicate** – a URI that describes the relationship between the resource and the value of the triple. A lot of the time predicate URIs are chosen from known vocabularies to make collaboration easier between disparate datasets.
* an **object** – this is the value of the statement made in the triple, it could be a literal value such as a date or number (in which case a datatype is included in the statement) or it could be another URI when the value of the resource is another resource.

A triple describing a book has the title of “The Hobbit” would look something like:

{: .table .table-striped}
| Subject 	| Predicate    	| Object   	|
| `http://www.thebookshop.com/tolkein-jrr/hobbit-the` 	| `http://purl.org/dc/terms/title`  	| `“The Hobbit”`	|

## Open Refine and GRefine - the RDF Extension ##

Open Refine is a free downloadable tool for working with data, and along with the RDF extension written by DERI we can quickly change some flat spreadsheet data to RDF ready for use in the Data Platform.

1. Download and install Open Refine using the correct installer for your system.
2. Download the RDF Extension and install it into the extensions directory of your Open Refine installation.
3. Start Open Refine.

{:.bg-info}
For this walkthrough I downloaded a set of data from the [National Public Transport Access Nodes (NaPTAN) available on data.gov.uk][naptan-data]


### Create a new project ###

Create a new project, select your spreadsheet and click **Next**

{:.img-large}
![Create a new Open Refine project]({{page.imgdir}}createproj.png)

This then shows you a preview of the data; depending on the content, you may need to set the encoding to a content type such as UTF-8 so that special characters are displayed correctly. Most of the default values are sufficient to confirm the creation of the project, so once you’ve checked these you can amend the name of the project if you wish and then click **Create Project**

{:.img-large}
![Preview the spreadsheet data]({{page.imgdir}}preview.png)

This then loads up all the data in Open Refine. From this point on, most of the magic happens using the RDF extension to map the values in the columns of the spreadsheet into RDF triple formats. 

### Editing the RDF Skeleton ###

To edit the RDF mappings select **Edit RDF Skeleton** in the RDF drop down menu at the top right of the Open Refine screen.

{:.img-small}
![Edit the RDF Skeleton]({{page.imgdir}}editrdfskeleton.png)

This opens the RDF Schema Alignment pop up window, where we can set up how the semantic data will be produced from the flat grid data imported into the project.

#### URI Identities ####

The first step is to set up how each resource in your data will be addressable. Every resource must have a URI that can be used to link that resource to other resources both within this dataset and others anywhere on the web.

Assuming that we are hosting our human readable data interface on a website at the (example only) web address http://mytravelsite.com, we would want to build up URIs that are unique to each of the resources so that when someone visits the address of a resource they would be able to view all the properties of that resource. In the RDF Schema Alignment window, first click the edit link next to the Base URI. Set this to be the same base address as your data website. 

{:.img-medium}
![Edit the Base URI of your data]({{page.imgdir}}base_uri.png)

In our example data we can see that there are a couple of columns that look promising, AtcoCode and NaptanCode, to use as unique values in identity URIs. A sort on the columns show that all rows have AtcoCodes whilst some NaptanCodes are blank, and there are no duplicates in the AtcoCode column either, so we can use this column as a base for our URI identities. 

To set up the URI used as the identity for each of your resources, select the AtcoCode column heading and check that the cell’s content is used “as a URI”.

{:.img-medium}
![Set up the value to use as part of the resource URI]({{page.imgdir}}id_uri.png)

If the data in the cell is not already a valid URI, the RDF Skeleton uses the Base URI to create a URI identity. You can preview the URIs by clicking the preview/edit link.

{:.img-medium}
![Preview the resource URI]({{page.imgdir}}id_uri_preview.png)

#### Predicate Prefixes ####

The next step is to set up a few prefixes that we’ll be using for this example. As we’ll mostly be concerned with places and locations, we’ll set up prefixes for well-known vocabularies such as the W3C Basic Geo ontology, Geonames and Ordnance Survey Spatial Relations. We’ll also add a prefix for an ontology that will point to our own hosting, to be used when a value does not fit with those found in known ontologies.

{: .table .table-striped}
| Prefix 	| URI    	|
| [gn][gn]{:target="_blank" .external} 	| `http://www.geonames.org/ontology#` |
| [geo][geo]{:target="_blank" .external}	| `http://www.w3.org/2003/01/geo/wgs84_pos#`	|
| [spacerel][spacerel]{:target="_blank" .external}	| `http://data.ordnancesurvey.co.uk/ontology/spatialrelations/` 	|
| [mts][mts]{:target="_blank" .external}	| `http://mytravelsite.com/data/ont/` 	|

{:.img-large}
![Predicate prefixes]({{page.imgdir}}prefixes.png)

To add a prefix, click *manage prefixes* to bring up the pop up window and then *Add Prefix* to enter the extra prefixes. If the prefix chosen matches those found on prefix.cc then tabbing out of the prefix field will auto-fill the URI field.

{:.img-medium }
![Add a prefix]({{page.imgdir}}prefixes_gn.png)

#### Setting up predicates and values ####

To set up a mapping between a column’s value and a predicate from an ontology, click the *add property* link and then click on the property itself to bring up a text field to enter the predicate. A type-ahead search helps with searching for known predicates from the loaded vocabularies entered in the previous step. Select `geo:lat` and then hit the **Add It** button.

{:.img-large }
![Add a predicate]({{page.imgdir}}lookup.png)

After the predicate has been set, select **Configure** to select the `Latitude` column and set the cell’s content to mark it as a non-integer number.

{:.img-medium }
![Set the predicate data type]({{page.imgdir}}lat.png)

We can then repeat this step to add in a few more properties to the mapping skeleton and select the RDF Preview tab to see how the mapping is taking shape.

{: .table .table-striped}
|	Predicate	|	Cell 	|	Cell Content 	|
|	`spacerel:easting`	|	`Easting`	|	Integer number	|
|	`spacerel:northing`	|	`Northing`	|	Integer number	|
|	`gn:colloquialName`	|	`CommonName`	|	Text	|
|	`gn:locatedIn`	|	`ParentLocalityName`	|	Language Based Text (en)	|
|	`mts:stopType`	|	`StopType`	|	Text	|

{:.img-large }
![RDF Preview]({{page.imgdir}}rdf_preview.png)

#### Exporting Semantic Data ####

Exporting the data in a semantic data format is straightforward, simply select one of the “RDF as” options from the *Export* menu.

{:.img-small }
![Export semantic data]({{page.imgdir}}export.png)

{:.bg-warning}
Note: On large datasets the RDF Extension can struggle when it comes to exporting data as RDF. As mentioned earlier, for ongoing data management or very large datasets, it is far better to have a custom programme written to translate flat data to semantic data. However by working with a subset of your data in Open Refine, you can play around with the mappings to get a proper feel for semantic version of your data.

Exporting as Turtle opens a new tab in the browser showing the contents of the TTL file which you then save to your computer; exporting as RDF automatically downloads the RDF file.

{:.img-large }
![Exported Turtle data]({{page.imgdir}}ttl.png)

### Summary ###

This post walks us through a very simple way of changing flat CSV data into semantic RDF data made up of subject URIs, along with predicates and objects that describe a resource’s properties and their values.

The RDF extension can also be used to link your resources to resources on other Linked Open Data sites using their reconciliation service. Whilst that is outside the scope of this post, you can find more information about [how to link to external SPARQL Endpoints][rdf-refine-docs] on the DERI website and this [youtube tutorial also runs through the basics to pull Linked Data into Open Refine][rdf-refine-recon].

Given that Open Refine and the RDF extension runs into memory issues when working with datasets of a few hundred thousand records, it is definitely recommended to only use this approach when first working out the proper mappings between your flat data and the final outline of the semantic RDF that you’ll be using to published your Open Data. For this purpose however, Open Refine and the RDF Extension is invaluable in the toolset for becoming more comfortable with working with semantic data.

[5-star]:	http://5stardata.info/
[open-refine]:		http://openrefine.org/
[rdf-refine]:		http://refine.deri.ie/
[naptan-data]:	http://data.gov.uk/dataset/naptan
[rdf-refine-docs]:	http://refine.deri.ie/docs
[rdf-refine-recon]:	https://www.youtube.com/watch?v=kn-YeDXR4R8
[gn]:	http://www.geonames.org/ontology#
[geo]:	http://www.w3.org/2003/01/geo/wgs84_pos#
[spacerel]:	http://data.ordnancesurvey.co.uk/ontology/spatialrelations/
[mts]:	http://mytravelsite.com/data/ont/

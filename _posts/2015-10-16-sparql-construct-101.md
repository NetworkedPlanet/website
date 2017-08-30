---
layout: post
title: SPARQL CONSTRUCT 101
excerpt: The CONSTRUCT form of SPARQL is a really useful when working with large RDF datasets as it makes it easy to pull out a small graph that you can then work on locally. This post goes through the basics of using SPARQL CONSTRUCT and shows some "stupid SPARQL tricks" you can achieve with CONSTRUCT.
date: 2015-10-16 13:41:38
author: KA
comments: true
tags:
  - rdf
  - sparql
  - tutorial
---

A SPARQL query can be written to return one of three things - SELECT returns a tabular set of results, ASK returns a simple boolean (true or false), and CONSTRUCT returns an RDF graph. For most human interaction with SPARQL endpoints we tend to prefer tables as they are just easier for us to grok, but if you are working with code that has an RDF parser available to it, then CONSTRUCT can really be your best friend and it is worth spending some time to understand how CONSTRUCT works and what cool sorts of things you can do with it.

I'm going to walk through a few features of SPARQL CONSTRUCT using a really simple made-up sample file. If you would like to follow along, you can get the sample file I'm using from [this gist on GitHub](https://gist.github.com/kal/ee1260ceb462d8e0d5bb). You will need a triple-store to query too - if you don't have one installed (and if you are on Windows), why not try out [BrightstarDB](http://brightstardb.codeplex.com/)? BrightstarDB comes with a management application called Polaris which makes it easy to create a new store, import the file and run SPARQL queries. You can read about Polaris [here in the BrightstarDB documentation](http://brightstardb.readthedocs.org/en/latest/Using_Polaris/).

The sample dataset I've produced is really simple, it lists 13 imaginary server transaction logs. Each transaction log records the server that processed the transaction, the date/time that the transaction was processed and the status code of the transaction (just for fun there are some failed transactions in there).

***

Lets start with a really simple query to just list out the transactions in a table. For a table result we use a SELECT query::

    PREFIX log: <http://example.org/ont/transaction-log/>
    SELECT ?txn WHERE { ?txn a log:Transaction . }
    
SPARQL is based on matching patterns in the graph, so this simple query finds all triples
that match a pattern ``{something} rdf:type log:Transaction`` (``a`` is just short-hand for rdf:type, you will see it is also used in the sample file). Then all of the values that match
{something} are assigned (in SPARQL-parlance **bound**) to the variable ?txt. Each match found
results in a separate row in our results table. As this sample file contains 13 transaction logs,
the query will return a table with a single column and 13 rows like this:

{: .table .table-striped}
| ?txn |
|---
| http://example.org/data/transaction/134 |
| http://example.org/data/transaction/135 |
| http://example.org/data/transaction/130 |
| http://example.org/data/transaction/131 |
| http://example.org/data/transaction/132 |
| http://example.org/data/transaction/133 |
| http://example.org/data/transaction/129 |
| http://example.org/data/transaction/128 |
| http://example.org/data/transaction/125 |
| http://example.org/data/transaction/124 |
| http://example.org/data/transaction/127 |
| http://example.org/data/transaction/126 |
| http://example.org/data/transaction/123 |


You can see that the results are not in the same order that they were specified in the source file, or even in order of their value - to order our results we would need to explicitly specify that in our query.

Let's suppose our challenge is to list transactions grouped together by the server that they are processed on. First we need to add the server itself to our triple pattern in the query:

    PREFIX log: <http://example.org/ont/transaction-log/>
    SELECT * WHERE { 
        ?txn a log:Transaction . 
        ?txn log:processedBy ?server
    }

I'm still using a ``SELECT`` at the moment so that you can see more easily what is going on, but notice that I've changed the bit after the ``SELECT`` to be ``*``. ``SELECT *`` simply selects all of the variables in the pattern part of the query. Often in a query you will have variables in the pattern that are not useful in the results; but when exploring data and when debugging queries that are not returning the expected results I often switch from ``SELECT ?v1 ?v2`` to ``SELECT *`` so that I can see all of the variables.

Now we have two columns in our results:

{: .table .table-striped}
| ?txn | ?server |
|---
| http://example.org/data/transaction/130   | http://example.org/data/server/B |
| http://example.org/data/transaction/135   | http://example.org/data/server/A |
| http://example.org/data/transaction/134   | http://example.org/data/server/C |
| http://example.org/data/transaction/129   | http://example.org/data/server/A |
| http://example.org/data/transaction/131   | http://example.org/data/server/C |
| http://example.org/data/transaction/128   | http://example.org/data/server/C |
| http://example.org/data/transaction/125   | http://example.org/data/server/C |
| http://example.org/data/transaction/124   | http://example.org/data/server/B |
| http://example.org/data/transaction/127   | http://example.org/data/server/B |
| http://example.org/data/transaction/126   | http://example.org/data/server/A |
| http://example.org/data/transaction/123   | http://example.org/data/server/A |
| http://example.org/data/transaction/132   | http://example.org/data/server/A |
| http://example.org/data/transaction/133   | http://example.org/data/server/B |

If we were sticking with SELECT I would go for using a SORT now to sort by server which effectively gives us a form of grouping:

    PREFIX log: <http://example.org/ont/transaction-log/>
    SELECT * WHERE { 
        ?txn a log:Transaction . 
        ?txn log:processedBy ?server
    } ORDER BY ?server

Resulting in:

{: .table .table-striped}
| ?txn | ?server |
|---
| http://example.org/data/transaction/135   | http://example.org/data/server/A |
| http://example.org/data/transaction/132   | http://example.org/data/server/A |
| http://example.org/data/transaction/129   | http://example.org/data/server/A |
| http://example.org/data/transaction/126   | http://example.org/data/server/A |
| http://example.org/data/transaction/123   | http://example.org/data/server/A |
| http://example.org/data/transaction/130   | http://example.org/data/server/B |
| http://example.org/data/transaction/133   | http://example.org/data/server/B |
| http://example.org/data/transaction/124   | http://example.org/data/server/B |
| http://example.org/data/transaction/127   | http://example.org/data/server/B |
| http://example.org/data/transaction/134   | http://example.org/data/server/C |
| http://example.org/data/transaction/131   | http://example.org/data/server/C |
| http://example.org/data/transaction/128   | http://example.org/data/server/C |
| http://example.org/data/transaction/125   | http://example.org/data/server/C |

To process this sort of result I would still need to do some basic grouping work on the client - I would loop through the rows checking when the ``?server``.

But if my client code can handle RDF then I can instead use a CONSTRUCT with these results to build a little RDF graph that I can process. CONSTRUCT works by defining a second pattern 
that looks a lot like the pattern in the WHERE part of the query. Here is a simple example:

    PREFIX log: <http://example.org/ont/transaction-log/>
    CONSTRUCT {
        ?server log:processed ?txn .
    }
    WHERE { 
        ?txn a log:Transaction . 
        ?txn log:processedBy ?server
    }
    
 The best way to visualize how CONSTRUCT works is to imagine that the SPARQL query processor first executes the WHERE part with a SELECT * so that it has a table of all the matches and access to all of the variables you used in the WHERE pattern. Then it loops through those rows one at a time and it generates triples by replacing the value found for each variable into the pattern you have provided in the CONSTRUCT.
 So when processing this sample query above it might find that the first row of the results table is:
 
| ?txn | ?server |
|---
| http://example.org/data/transaction/135   | http://example.org/data/server/A |


Resulting in the generation of a single triple:

    <http://example.org/data/server/A> log:processed <http://example.org/data/transaction/135>
    
And here is our first cool thing about CONSTRUCT.

> **You are not restricted to using the predicates and types that you are querying**

Effectively this means in CONSTRUCT you can build exactly the shape of RDF data that you want to process on the client. In my example, if I want to group the transactions together by the server that they are on, then the way that information is presented in the data is "backwards". Sure I can query it backwards if I want to, but its more intuitive (to me at least) to restructure the results so that the server is the subject and the transaction log the object of the triples in my result graph.

As the rest of the results are processed more triples get added to the result graph. And this is the second cool thing about CONSTRUCT.

> **Duplicates get merged**

So at the end of processing the results, my RDF graph looks like this (excuse the ASCII art):

               log:processed
    server:A +----------------> txn:132
             | log:processed
             +----------------> txn:135
             |
            ...
             
               log:processed
    server:B +----------------> txn:130
             | log:processed
             +----------------> txn:133
             |
            ...
    
               log:processed
    server:C +----------------> txn:134
             | log:processed
             +----------------> txn:131
             |
            ...
    
If you are using Polaris to follow along here, you will find the results in RDF/XML on the ``Results XML`` tab in the query window.

When processing these results on the client we may have a little problem though. How do we know which servers are included in our results ? If we know beforehand the full list of servers we might expect in the results then we could just iterate that list and ask for the log:processed triples for each one, but that's not going to work if we have no prior knowledge (or if someone
adds another server). What we need instead is some way to mark our "entry points" into the results graph. As this is just RDF, the answer is of course "add another triple". One way to tackle this would be to mark the servers out by adding an rdf:type to them:

    PREFIX log: <http://example.org/ont/transaction-log/>
    CONSTRUCT {
        ?server a log:Server .
        ?server log:processed ?txn .
    }
    WHERE { 
        ?txn a log:Transaction . 
        ?txn log:processedBy ?server
    }

Again we are using the ability to define types and predicates in our CONSTRUCT pattern that do not (necessarily) exist in the source data. We are also taking advantage of the fact that RDF automatically eliminates duplicate statements, so our results will only actually contain one ``rdf:type`` statement for each server, and not 13 as you might think at first glance. The final RDF graph would be something like:


    log:Server
        ^  rdf:type           log:processed
        |<-------  server:A +----------------> txn:132
        |                   | log:processed
        |                   +----------------> txn:135
        |                   |
        |                  ...
        |    
        |  rdf:type            log:processed
        +<--------- server:B +----------------> txn:130
        |                    | log:processed
        |                    +----------------> txn:133
        |                    |
        |                   ...
        |           
        |  rdf:type            log:processed
        +<--------- server:C +----------------> txn:134
                             | log:processed
                             +----------------> txn:131
                             |
                            ...
							
So now our code to process this result can just look for ``log:Server`` and find all resources connected to it by an rdf:type predicate to list out the servers, then follow the ``log:processed`` predicate for each server to list out the transactions for that server.

Hopefully what you can also see is that the graph view of results also makes it inherently far easier to work with queries that return items with lists of values for a given property. Because the SPARQL SELECT is restricted to a tabular result, you end up with one row for every possible combination of values which can lead to a massive explosion in the number of rows if you are dealing with complex data structures with several repeated properties. CONSTRUCT gets you out of that hole quite nicely because you are generating a graph from a graph rather than having to try and flatten everything out into a table.

One issue that does come up with the use of CONSTRUCT however is that of sorting. The RDF graph created by a CONSTRUCT query is, just like any other RDF graph, an unordered collection of triples. So if you need your results in sorted order, you will need to do that on the client. So this is the third really cool thing about using CONSTRUCT.

> **You can use SPARQL on the client-side to slice and dice results from the server**

 Personally I find the easiest way to do this is to use a secondary SPARQL query on the client that queries just the RDF graph that is returned from the server. It may sound odd to do this, but in effect you are using the server to deliver you a chunk of data as an RDF graph and then the client to extract the final results from that chunk. Sometimes you will want to do the sorting on both the client and the server - a good example of this would be asking for ordered, paged results. As an example, lets say that we want the first 10 transaction logs sorted by date/time. On the server we would need a CONSTRUCT query like this:

	PREFIX log: <http://example.org/ont/transaction-log/>
    CONSTRUCT {
        ?server a log:Server .
        ?server log:processed ?txn .
		?txn log:processedAt ?procTime
    }
    WHERE { 
        ?txn a log:Transaction . 
        ?txn log:processedBy ?server .
		?txn log:processedAt ?procTime .
    } ORDER BY ?procTime LIMIT 10
	
The ORDER BY is needed on the server side because we want to ensure a consistent sort order when paging through the results. The LIMIT restricts us to the first 10 results. If you replace the ``CONSTRUCT { ... }`` with ``SELECT *`` and re-run the query you will see that the results table is sorted but because CONSTRUCT is generating a graph, that sorting gets lost. To reconstruct the correct order on the client we could just grovel through the RDF graph and do the sorting using standard programming language constructs; but if we have SPARQL capability on the client we can make life easy for ourselves by using a SELECT to pull out our results in the required order. On the client we might use a query like this:

	PREFIX log: <http://example.org/ont/transaction-log/>
	SELECT ?txn, ?time, ?server WHERE {
		?server log:processed ?txn .
		?txn log:processedAt ?time .
	} ORDER BY ?time

Note: we don't need the LIMIT here because we only pulled 10 results from the server.

OK, for this simple example data using a CONSTRUCT in this way is just overhead; but if you imagine needing to retrieve more complex data where each transaction has one or more repeated properties then CONSTRUCT really is the way to go.

This sort of pattern of pulling a graph from the server and querying it on the client can become really useful in a variety of circumstances. It allows you to hit the server up once for a bunch of data and then selectively extract slices of that data on the client side in response to user input or other UI requirements rather than having to constantly hit the server with lots of smaller queries; it also allows you to incrementally build up a local in-memory cache of data from the server - again with the potential to reduce the number of server round-trips you need to make.

I hope this post has given you a bit of an insight into CONSTRUCT and has you hunting around for an RDF processing library for your chosen programming language! If you are on .NET, check out [DotNetRDF](http://dotnetrdf.org/); Pythonistas should use [rdflib](https://pypi.python.org/pypi/rdflib?); libraries are also available for many other languages that I don't personally use - [DuckDuckGo is your friend](https://duckduckgo.com/?q=rdf+library)!

If you have any thoughts or questions or would like to share your own cool CONSTRUCT tips, hit us up in the comments below!

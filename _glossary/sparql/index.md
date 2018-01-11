---
layout: page
title: SPARQL
slug: sparql
---

SPARQL is the query language for RDF. SPARQL can be used to express queries across diverse data sources, whether the data is stored natively as RDF or viewed as RDF via middleware.
{:.lead}

The SPARQL query language is based on the concept of matching patterns in a graph. These patterns can be combined to produce complex match criteria that consist of the conjunction (AND) and disjunction (OR) of many simpler patterns. SPARQL also supports extensible value testing for filtering matches.

The implementation of SPARQL provided by the [Web3 Platform](/solutions/web3/) makes it easy to query across the association relationships and properties of topics but also supports querying all aspects of the ISO Topic Maps Data Model. Our implementation also adds support for full-text search against topic labels, names and occurrences.

SPARQL is also the principal query language supported by [BrightstarDB](/solutions/brightstardb/), which also provides a binding for converting LINQ queries into SPARQL; allowing access to RDF data stores without needing to learn another query language.
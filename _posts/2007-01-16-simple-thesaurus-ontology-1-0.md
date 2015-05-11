---
layout: post
title: Simple Thesaurus Ontology 1.0
category: Ontologies
tag: ontology
author: kal
---
This ontology provides a simple concept-based thesaurus structure for use in your projects. The ontology implements most of the Topic Per Concept Thesaurus Pattern described in the <a href="http://www.techquila.com/tmsinia_5.html">Techquila article on Topic Maps Design Patterns</a>.

Under this pattern, the thesuarus is represented as a collection of topics representing Concepts. Each Concept topic should have one base name in the unconstrained scope giving the preferred term for the topic (additional non-preferred terms can be added as base names scoped by the Non-Preferred Term scoping topic). Concepts are related to one another using the Concept Relationship association (for related concepts) or the Broader-Narrower association (for parent-child relationships).

This simple version of the Techquila ontology omits the Part-Whole association type. The types presented in this version are:

<dl>

<dt>Concept</dt>

<dd>Topic Type. A thesaurus entry representing a concept. Concepts can be connected together using the Broader/Narrower association (to create hierarchical relationships) or the Concept Relationship association (to create cross-cutting relationships). Each concept can have any number of Warrant, Scope Note, Editor Note, General Note, History Note or Hierarchy Note occurrences.</dd>

<dt>Warrant</dt>

<dd>Occurrence Type that holds information about the source warrant for the concept. The warrant usually refers to the authoritative source document that the concept and its preferred term was taken from.</dd>

<dt>Scope Note</dt>

<dd>An Occurrence Type that holds information about the concept. Several subclasses are defined for specific types of scope note.

<dl>

<dd>History Note</dd>

<dt>A note providing historical information about the entry - e.g. when it was first added or last updated.</dt>

<dd>Hierarchy Note</dd>

<dt>A note providing information about the hierarchical placement of the entry in the thesaurus hierarchy.</dt>

<dd>General Note</dd>

<dt>A note providing general information about the thesaurus entry.</dt>

<dd>Editor Note</dd>

<dt>A note providing editors with information about the entry. For example, a note indicating that the entry should be reviewed.</dt>

</dl>

</dd>

<dt>Non-Preferred Term</dt>

<dd>A Scoping Topic that can be used to scope base names on Concept topics that define the non-preferred terms for the concept.</dd>

</dl>

<a href="http://www.networkedplanet.com/download/npcl/TechquilaThesaurus.npcl">Download Simple Thesaurus NPCL file</a>


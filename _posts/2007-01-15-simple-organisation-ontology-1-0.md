---
layout: post
title: Simple Organisation Ontology 1.0
category: Ontologies
tag: ontology
author: kal
---
The Simple Organisation Ontology is a starter ontology designed to allow you to learn more about how NPCL works and to use as a starter for your own projects. The ontology has been designed around a simple intranet application. The ontology records the following topic types:

<dl>

<dt>Organisational Entity</dt>

<dd>A high-level type for departments, teams and people in an organisation. This class has the following three subclasses:

<dl>

<dt>Organisational Unit</dt>

<dd>Part of an organisation. Organisational units can be organised into a Parent Unit / Child Unit hierarchy.</dd>

<dt>Cross Functional Team</dt>

<dd>A team within an organisation that operates across the normal organisational hierarchy.</dd>

<dt>Person</dt>

<dd>An individual within an organisation. A Person can be leader of one Organisational Unit, a member of one Organisational Unit and a member of any number of Cross Functional Teams.</dd>

</dl>

</dd>

<dt>Content Item</dt>

<dd>This is an abstract base class for representing content such as documents, articles, memos and so on. Content Items can have any number of Project, Skill, Product or Concept topics associated as a Primary Subject or Secondary Subject. A Content Item can be an Input To or Output From a Task. A Content Item is the Responsibility Of a Person.<br/>

The Content Item class is marked as abstract, so users should choose one of the concrete base classes when creating their topics. The concrete subclasses defined in this ontology are:

<dl>

<dt>Document</dt>

<dd>Used to represent an internal document such as an MS Word document or Excel spreadsheet.</dd>

<dt>Article</dt>

<dd>Used to represent short content items that are intended for wider consumption. Typically these will be items written for public dissemination (e.g. content published on a website).</dd>

</dl>

<dt>Concept</dt>

<dd>Represents any concept that is relevant to the business. This topic type is taken from

the Techquila definition for thesaurus construction. If you wish to arrange concepts into a thesaurus structure, you may want to add our Simple Thesaurus Ontology to your topic map.</dd>

<dt>Product</dt>

<dd>A product used or created by the organisation. A Product is the Responsibility Of an Organisational Entity</dd>

<dt>Project</dt>

<dd>A project carried out by the organisation or some part of it. A Project is the Responsibility Of an Organisational Entity. A Project Works On a Product. A Project Has zero or more Tasks. </dd>

<dt>Task</dt>

<dd>Work carried out by an individual or group of individuals. A Task can be Assigned To zero or more People. A Task can have any number of Input Documents and any number of Output Documents. A Task can be Part Of a Project.</dd>

<dt>Skill</dt>

<dd>A Person Has any number of Skills. Skills can be arranged in a Parent Skill/Child Skill hierarchy.</dd>

</dl>

<a href="http://www.networkedplanet.com/download/npcl/SimpleOrganisationOntology.zip">Download the Simple Organisation Ontology NPCL file.</a>


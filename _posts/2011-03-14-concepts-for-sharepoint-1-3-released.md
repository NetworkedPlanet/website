---
layout: post
title: Concepts for SharePoint 1.3 released
category: Concepts for SharePoint
tag: concepts for sharepoint
tag: releases
author: jen
---
Version 1.3 of Concepts for SharePoint is now available. This package introduces a number of features and enhancements. The full change list and upgrade instructions can be found below. New users can <a href="http://www.networkedplanet.com/contact/request-evaluation/" title="Request Evaluation">request an evaluation</a>, if you are an existing customer with a valid support contract please contact support@networkedplanet.com for a download link.





<strong>Upgrading instructions</strong>

------------------



Unzip the download package and run the STSADM -upgradesolution command.  The exact command-line you use will depend on how you want to schedule the upgrade, but will be similar to:



stsadm -o upgradesolution -name ConceptsForSharePoint.wsp -filename ConceptsForSharePoint.wsp -allowgacdeployment -local



Restart IIS and the SharePoint 2010 Timer Service



If running CfS on a separate server to that of the Web3 Platform, you will also need to upgrade the additional web3.wsp file contained in the upgrade package and restart the services.



For full upgrade and usage instructions, please refer to the documentation contained in the downloaded package



<strong>Change Log</strong>

----------



FEATURE: Setting a Site Page to be about a particular topic : by adding a column to the Site Pages library columns collection (and adding the internal name of the field to the CfsServerConfig file, that Site Page can then be set to a particular term in the CfS Term Store. Web Parts placed on that page will then use the topic for that term as their starting topic, unless specifically overridden.



FEATURE: New Abstract Xml SPARQL Web Part class for use by developers to do server side processing of SPARQL queries.



FEATURE: New Abstract Xml One Hop Web Part class for use by developers to do server side processing of the results of a one hop query.



FEATURE: New Abstract Xml Two Hop Web Part class for use by developers to do server side processing of the results of a two hop query.



FEATURE: New Ajax SPARQL Web Part to display the results of a SPARQL query with all processing done client-side and no server-side processing of the query.



FEATURE: New Ajax One Hop Web Part to display the results of a one hop query with all processing done client-side and no server-side processing of the query.



FEATURE: New Ajax Two Hop Web Part to display the results of a two hop query with all processing done client-side and no server-side processing of the query.



FEATURE - New Topic Connector Web Part which loads the full topic representation of a topic (includes all associations)



FEATURE: New daily synchronisation timer job that performs a full synchronisation between the topic map and the SharePoint Managed Metadata Store.



ENHANCEMENT - Changed the profile scraper so that different user topic types can be used for different topic maps that may be in use on SharePoint Site Collections



ENHANCEMENT: External content types can now be created for multiple topic maps in SharePoint Search.
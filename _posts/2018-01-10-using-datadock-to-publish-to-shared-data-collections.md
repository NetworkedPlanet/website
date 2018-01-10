---
layout: post
title: Using DataDock to publish to shared data collections
excerpt: Allow multiple people to publish data on your data portal by making use of organisations on DataDock. Administer publishing access for colleagues and collaborators to your data collections. 
date:   2018-01-10 17:00:00
author: Jen
imgdir:	/assets/images/blog/datadock/
image: /assets/images/blog/datadock.png
imagealt: DataDock Logo
comments: true
tags:
  - datadock
  - free data publishing
  - collaboration
  - organisations
  - datadock-intro
---

Using GitHub as the backend to your data storage has a few obvious benefits straight off the bat:

* All the files produced by DataDock --- the original spreadsheets, the RDF triples making up the Linked Data, the dataset metadata, and the static HTML files that display your data portal --- are hosted on your own GitHub account.
* Each update to a dataset via DataDock produces a new "commit" in the GitHub history, producing over time a full revision history of that dataset.
* It has secure authentication which can be used for logging in to your DataDock management portal, meaning you don't have to remember yet another username and password combination!

But there's another great feature of GitHub that we can leverage on DataDock for use in data publishing, and that's **Organizations**.

> Organizations are shared accounts where groups of people can collaborate across many projects at once. Owners and administrators can manage member access to the organization's data and projects with sophisticated security and administrative features. - GitHub

Our last release of DataDock completely rebuilt the dashboard structure to be able to make use of the way in which GitHub user accounts can be added to organizations. This means that as you create organizations on GitHub, or are added to someone else's, you will see them appear as options on your DataDock dashboard ready to publish data to.

A GitHub "organization" does not need to be a company you work for, you can set up organizations for projects, meet-up groups, or crowdsourcing pushes. As [GitHub states](https://help.github.com/articles/differences-between-user-and-organization-accounts/#organizations), even on the free GitHub plan you can have "unlimited collaborators on unlimited public repositories" - fantastic!

If you don't see your organization pop up on your dashboard, that's most likely because you set your DataDock-GitHub access permissions before you created the organization, simply check your access settings and allow DataDock access to the new organization. 

Due to the built-in data portal page building, each project / group / organization set up in this way has a data portal automatically, with catalog lists and navigation along with the deep dive into the Linked Data as is standard on all DataDock published data.
 
That's all for now, but I'll be writing a few more DataDock related blog posts over the next few months as we draw near to the end of our Preview Release. Watch this space!

<div class="text-center">
    <a class="pointer-button arrow text-left sp-selectable" href="http://manage.datadock.io">Go To DataDock.io</a>
</div>

<hr />

![DataDock logo]({{page.imgdir}}DataDock_ColourTrans.png){:height="149px" width="400px" .img-medium .img-responsive .center-block .bordered-image}


{: .well .text-center}
This article is part of the [Data Dock Intro series](/blog/tags/datadock-intro/)
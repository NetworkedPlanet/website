---
layout: post
title: SharePoint Module User Scraping
tag: sharepoint module
tag: tip
category: TMCore SharePoint Module
author: kal
---
Over the last couple of weeks I've had a lot of queries from developers about the "scraping" that we do to create topics for users in a SharePoint Module topic map. Some confusion has been caused by the fact that we have two ways of doing this and also some concern has been expressed about the amount of logging activity generated in particular by the AddSiteUsers task. This post is a copy of a support response I wrote for the last developer to enquire and I'm posting it here in the hope that it might be useful to others too.

We have two ways of scraping users from SharePoint into the topic map. There is a Topic Map Timer Task called AddSiteUsers, and a feature called NPProfileScraper.

The AddSiteUsers timer task is activated once on each site (SPWeb) where you activate the NPClassification feature. Its job is to ensure that there is a topic for each user that has access to the site, so when it wakes up it checks the SPWeb.AllUsers property and goes through it checking that each user has a topic in the topic map and creating a new user topic if needed. This task is run by the Topic Map Timer Job which you can see when you look at the farm timer jobs in the SharePoint Central Administration app. The Topic Map Timer Job wakes periodically and looks for Topic Map Timer Task topics in the topic map and then runs them one by one.

The NPProfileScraper feature does something similar but instead of using the SPWeb.AllUsers property on each SPWeb, it communicates with the MOSS Profile Service - this is why it is a separate feature (because you cannot install it on WSS 3.0).

In 3.0 and the current 3.1 beta, NPProfileScraper is much more configurable than AddSiteUsers. For example you can set NPProfileScraper to run once every X hours (default is 24) and you can specify the type to assign to the new user topics. AddSiteUsers tasks just run as frequently as the Time Job and because you have one per SPWeb that can be a lot of activity. Currently the only way to stop AddSiteUsers tasks from running is to go into the topic map (the default one you have named in NPSharePoint.xml) and delete all topics that have the name "AddSiteUsers - xxx" where xxx is a site name. Its not pretty but it does work, until someone activates NPClassification again, when the task topic gets created and the whole thing starts again.

In 3.1 we have fixed this by allowing you to configure AddSiteUsers to also run once every X hours (per SPWeb) and to also configure AddSiteUsers to never run.

The logging is another issue. In 3.0 and the early 3.1 betas there was no support for throttling logging like you can with the standard SharePoint logging (e.g. restrict it to logging only Error level messages and above). In the 3.1 release this will be fixed and you will be able to use the SharePoint Central Administration site to set the throttling for a number of different SharePoint Module-specific log categories.

If you are working on a 3.1 beta AND you have your users in the MOSS Profile Service (so NPProfileScraper gets them), then my advice is that you delete all the AddSiteUsers topics from the topic map now and when you get the final 3.1 release make sure that you set the configuration in NPSharePoint.xml to never allow those tasks to run.

If you are working on 3.0 and need a better fix than the workaround described above, please let me know and I'll try and get a new Hotfix out that includes some of the changes we already made in the main development branch of the code.


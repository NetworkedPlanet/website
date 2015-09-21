---
layout: post
title: Sharing Data In The Third Sector
excerpt: Some thoughts about the reluctance of sharing data.
date:   2015-09-21 13:17:38
author: Jen
imgdir:	/assets/images/blog/
status: draft
comments: true
tags:
  - linked data
  - open data
  - opinion
  - third sector
  - charities
---

Last week [Bristol Girl Geek Dinners](http://bristol.girlgeekdinners.com/) hosted another fantastic evening for nerds in the heart of Bristol. This month they brought Emma Prest of [DataKind UK](http://www.datakind.org/chapters/datakind-uk/) over from London to talk about their work. The first time I’d heard of DataKind was when BGG had published their event information, so I did some reading up on them. 

Data Dive events for charities
------------------------------

DataKind bring together charities and data science volunteers at hackathon style “Data Dives”. They work with the charities in the lead up to the event to set out clear goals and prep, then over the course of a weekend DataKind brings together all the volunteers and everyone works together to achieve those goals. Needless to say I was really looking forward to hearing what Emma had to say about it all and I wasn’t disappointed.

*What a great idea!* People with different specialisations coming together as a community for the social good is one I can utterly get behind. Charities collect a LOT of data about their cause - in order to show the social impacts of the problem and to try and better understand it to try and help eradicate the problem once and for all. Having these Data Dives gives the chance to look at this data in new and interesting ways, compare it to other datasets from overlapping sectors and see what new insights might be made. 

Of course my personal enthusiasm is with ongoing data collaboration by publishing datasets, and so a lot of my questions and conversations during the evening did tend to drift towards Open Data. As always though, when talking about Linked Open Data and charities in the same conversation I ran into a particular bugbear of mine. The fact that organisations are very dubious about actually publishing that data as raw datasets. Now, when I hear that from commercial enterprises I actually have more patience than when I hear it from charities, even though the answers are the same. It really irks me. Gets my goat. Bothers me. I was having trouble unpicking why this is so here are my thoughts on it:

Why the reluctance to publish Open Data?
----------------------------------------

First off, and let’s get this out of the way early, I’m not talking here about **personal** data or any data that could be linked to an individual. I’m talking about completely anonymised data that’s used by that charity to show that the problem exists, that it has knock on effects and that the work the charity does helps with the problem. Other charities (especially the smaller ones working at a more localised level with far less funds) will also find that information *incredibly useful* and will be able to better help people in turn. Those smaller charities also collect data that they could publish themselves and then all the charities in that sector can start looking across those datasets to see trends and what’s helping or exacerbating the problem. 

Not only does this mean that researchers and data scientists could look across the datasets supplied by charities from different sectors and ask new questions that wasn’t possible when the data was kept closed off, it also means that charities of all sizes can avoid wasting time and money duplicating analysis and research that has already been done.

The potential benefits of sharing data are really not difficult to see. So why the reluctance to publish all that raw data? One statement uttered last night has been ringing round my head “**charities are in competition with each other**”. 

![Animated gif of the seagulls from Finding Nemo standing on a rock in the sea all shouting "Mine!"]({{page.imgdir}}seagulls_mine.gif){: .img-medium .center-block .img-responsive}
	
And therein lies a real problem. There’s two parts to every charity - the side working to help with the problem, and the side that exists to find funding so that the organisation can continue to do the good work they’re doing. Obviously finding funding (whether it be through public donations, business sponsorships or government funding) is absolutely key to be able to continue the work that a charity does. But who wins when those two sides are in opposition to each other? One side wants to share information in order to better collaborate and advance the charity’s mission, after all that’s the raison d’etre of the charity itself. The other side spends every hour trying to find money to keep going and finds it difficult to imagine that sharing data doesn’t automatically mean lost revenue (or potential revenue).

Whilst I can understand this fear of loss of control, I still wondered why I feel so personally aggrieved by it in these cases. And then it struck me - when I donate money to a charity, buy merchandise or volunteer my time - it’s because I’m supporting their cause, not the charity. I believe that they are doing everything they can to meet their mission statement. I thought that collaborating with people both within and outside of their sector would be one of those things, and so I find it extra frustrating.

Tackling the common concerns
----------------------------

Of course we can see the benefits of sharing data, and I want to leave this post in a solution-focused way, so how do we address the fear that by publishing data they will lose funding? I’ll address some typical concerns:

### 1. The data is worth money and by publishing it we’re giving it away for free.

If your data is currently bringing in money and is a revenue stream for a charity then by all means continue to do that! Some open data publishers choose to make a subset of their data free and require a license fee to access the full set of data. 
However, if you are not making any money from it and it’s just sitting in your databases being queried for reports now and again, it’s possible that it’s worth far more in knowledge advancement than it is a viable source of income for your organisation. Charities should carefully weigh up the social cost of not publishing their data as well as the cost in terms of lost revenue, if in fact there was any revenue coming from it.

### 2. People could use the data to come up with "Bad Science" claims. We are the specialists and can avoid that.

The best way to negate this is to have the data public so that it’s instantly provable that someone has made an error. It’s also possible that people could discover correlations between your data and others that you can use to improve your service. Discoveries that were impossible to make when the data was kept closed off.

### 3. If someone else uses the data in some app that becomes popular, they get the publicity rather than us.

As mentioned earlier, you could choose to require people to pay for commercial access, but this is where we start getting into the grey area of what’s the purpose of the charity. If by publishing data you enable someone to develop a great app, visualisation or research paper that furthers the aim of your organisation then that’s money saved because you didn’t need to use any resources or money to do that. There are many data licenses you can choose from and my second favourite is the [Attribution license](http://creativecommons.org/licenses/by/4.0/) - which means that anyone using the data must credit you as the source of that information. At the end of the day, a popular app can raise more awareness and gain more support for the cause and increase donations to the charity.

### 4. People aren’t coming to *us* for the information.

Firstly, someone **is** still coming to you for the information - the developers. Secondly, your data isn’t static, you need to collect it over time and it’s up to you whether you release new data every hour, day, week, month or even year! Meaning that people *are* coming back to you for the information - it’s just in a different format than you’re used to. 

Final thoughts
--------------------

DataKind is doing a fantastic job of bringing charities and data scientists together to look at how more power can be leveraged by the data the charities already have. A lot of the projects they list show the use of Open Data from various sources as part of the work, so it was disappointing to hear that not many charities have embraced the idea of publishing data in order to feedback into that pool. However, I do get the feeling that the tide is turning - most worries stem from not understanding the specifics of publishing data; as more people take the time to investigate rather than dismiss out of hand, we are starting to see more charties be interested in leading the way into the Web of Data.
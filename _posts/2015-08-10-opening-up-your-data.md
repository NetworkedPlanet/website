---
layout: post
title: Opening Up Your Data Shouldn't Cost The Earth
excerpt: Data portals are a new drain on IT department budgets, but does it really need to be that way?
comments: true
tags:
  - linked data
  - open data
  - opinion
---

An [interesting article by KPCC](http://www.scpr.org/news/2015/06/24/52343/how-much-do-open-data-portals-cost-so-cal-governme/) compares the varying cost of open data portals for different districts in Southern California. Two things draw some attention. First is the price - these data portals are not cheap to run, and in one case costs as much as $700 per 1000 residents. The second thing that draws some attention is the variance in cost which does not seem to be directly correlated with the number of datasets published. Ironically there is not much open data about the pricing of these open data portals. Tom Levine has done [some stirling work](https://thomaslevine.com/!/socrata-products/) in digging into the data that is available to attempt to determine just what sort of portal features each customer is using, as it is clearly these features that are the primary reason for the variance in pricing.

The authorities involved are certainly getting some great portals built, and obviously must feel that the cost to their taxpayers is fully justified. But surely it must be possible to publish open data without incurring costs that can run to hundreds of thousands of dollars per year ?  Here are our tips to publishing open data on a budget:

Keep It Simple, Stupid
----------------------

It is tempting to go for the all-singing all-dancing fully featured data portal. But these features all add more development time and more cost to your solution. When the features are provided by a vendor they also tie you more closely to that vendor. Many of the Linked Open Data pioneers produce very simple, minimalist portals (take a look at the [British Library’s BNB pages](http://bnb.data.bl.uk/doc/resource/009455497) for example), but despite this minimalism, the data and the links provide real value. 

You Don’t Need To Build It All
------------------------------

A lot of the portals include snazzy visualizations and engaging interactivity allowing users to slice and dice and select data. However, by making your data open, and licensing it in a way that encourages independent development, it is equally possible to find that others are willing, and able to turn your raw data into a [useful application](http://findmeabook.herokuapp.com/) or a beautiful visualization.

Avoid Data Lock-In
------------------

Whatever solution you use for publishing should be independent of the data you produce. This is where open data standards such as RDF play an important role. If you convert your data to a standard format such as RDF it is much easier to move data between platforms.

It Is Not Magic
---------------

Most importantly, remember that no matter what the vendors tell you (us included!) if you can publish web pages, you can publish linked open data. True there are some technical differences and challenges; but this is true of all web publishing - no two projects are ever alike. But fundamentally you are taking data, converting it to a digestible form and putting it on the web. It’s not hard, and if done right you can have an inspirational, open data platform that you can be proud of for a fraction of the cost of a “data portal”.
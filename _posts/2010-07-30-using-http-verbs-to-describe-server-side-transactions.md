---
layout: post
title: Using HTTP Verbs to describe Server Side Transactions
tag: rest
category: Theory and Practice
tag: web3
category: Web3 Platform
author: gra
---
One of the challenges of putting together a REST service is how to let clients make transactional updates that involve two or more resources. One approach to this problem is to create a resource that is 'a collection of transactions'. A client can post a representation of a new transaction to this resource. The transaction becomes a 'child' of the 'transactions' resource and can be accessed via a returned URL.



Making the transaction explicit is good as it allows the transaction to be addressed and its status checked, it also allows for the service to return immediately and process the transaction in the background.



This basic pattern is good but it has a drawback in that for each different system you build you need to define the transaction language.



Our solution to this is to use HTTP verbs, URIs and resource representations as the building blocks of our transaction language. A transaction representation contains a number of operations. Each operation contains information about its Method, e.g. POST, PUT, DELETE, the resource URI to operate on and the request body.



&lt;transaction&gt;



&lt;operation id="a1" method="POST" Resource="http://...../somecollection"&gt;



&lt;body&gt;&lt;!-- resource representation --&gt;&lt;/body&gt;



&lt;/operation&gt;



.. more operations



&lt;/transaction&gt;



The server processes a transaction by looking at each operation construct and operating on it as though the request has come from a client. The only difference is that all of the operations listed occur in a single transaction.



Each operation has a local id. When an operation completes the return URL from the operation is bound to that identifier. The identifier can then be used later in the transaction. This is especially useful when you want to create two new resources and then associate them together all in the same transaction.



After a transaction is processed the representation can be retrieved. The representation contains the URLs of newly created resources, as well as an errors information that occurred when processing the transaction.



This is a very powerful model that removes the need to create a domain specific transaction language for different applications, can reuse  existing resource processing code and is very descriptive.



For more information about this approach, download and review the REST service documentation for the <a href="/solutions/web3-platform">Web3 Platform</a>
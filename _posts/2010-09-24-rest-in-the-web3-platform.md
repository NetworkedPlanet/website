---
layout: post
title: REST in the Web3 Platform
tag: rest
category: Theory and Practice
tag: web3
category: Web3 Platform
author: gra
---
One of the goals of the Web3 Platform was to adhere to as many of the architectural principles of REST that was possible. In our minds the key things were that:



1) Given a start URI and a description of all the content types and valid transitions a client could interact with the topic map store.



Yep, there is only that one point.  



Given the URI of a topic map a client that is aware of the different content types that can be returned can interact with the entire topic map without guessing at, or constructing URIs.



For the Web3 Platform we introduced a new syntactic representation for Topic Maps because XTM is an interchange syntax for Topic Maps and not an effective Hypertext representation for the TMDM.



I'll walk through some interactions starting from a topicmap URL to demonstrate why we introduced the new syntax and how a client behaves.



Starting with the topicmap URL:



[code]

GET http://localhost/web3/topicmaps/e518129d-b458-4171-99cc-5e4941dafc7b?format=xml

[/code]



When addressing Web3 Resources content negotiation can be done through accept headers or via  a format parameter. The above GET returns the following representation.



[code]



<?xml version="1.0" encoding="utf-8"?>

<TopicMap xmlns:xsd="http://www.w3.org/2001/XMLSchema" 

          xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 

          Id="e518129d-b458-4171-99cc-5e4941dafc7b" 

          Version="49" 

          LastModified="2010-09-22T08:44:56.65" 

          Address="http://localhost/web3/topicmaps/e518129d-b458-4171-99cc-5e4941dafc7b" 

          WebLabel="myfilms" 

          Reifier="http://localhost/web3/topicmaps/e518129d-b458-4171-99cc-5e4941dafc7b/topics/75746aa2-61a1-4303-9d4e-d9832e366e82"

          Schema="http://localhost/web3/schemas/0df562f3-f86b-4fbb-a4d3-66679f2df0fa" 

          Associations="http://localhost/web3/topicmaps/e518129d-b458-4171-99cc-5e4941dafc7b/associations" 

          Topics="http://localhost/web3/topicmaps/e518129d-b458-4171-99cc-5e4941dafc7b/topics">

  <Labels>

    <Label Lang="en-gb">Films</Label>

  </Labels>

</TopicMap>



[/code]



There are a couple of things to notice in this representation.

<ol>

	<li>We use full URLs for everything, no Ids that need turning into URLs based on some defined URL space.</li>

	<li>We are exposing the collections of Topics and Associations as resources in their own right. This allows clients to POST to these collections to create new Topics and Associations and also to fetch these collections. (The full representation documentation also specifies the allowed query parameters for these resources).</li>

</ol>

Now a client can navigate the topic collection using:



[code]

GET http://localhost/web3/topicmaps/e518129d-b458-4171-99cc-5e4941dafc7b/topics?format=xml

[/code]



This returns the following collection:



[code]



<?xml version="1.0" encoding="utf-8"?>

<TopicRefList xmlns:xsd="http://www.w3.org/2001/XMLSchema" 

              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 

              Start="0" Count="29" Length="25" 

              ListUrl="http://localhost/web3/topicmaps/e518129d-b458-4171-99cc-5e4941dafc7b/topics" 

              Next="http://localhost/web3/topicmaps/e518129d-b458-4171-99cc-5e4941dafc7b/topics?skip=25&amp;take=25" 

              Previous="http://localhost/web3/topicmaps/e518129d-b458-4171-99cc-5e4941dafc7b/topics?skip=-25take=25">

  <Items>

    <TopicRef Address="http://localhost/web3/topicmaps/e518129d-b458-4171-99cc-5e4941dafc7b/topics/2a8a2182-f8b7-427a-9f7f-ef206b775606">

      <Labels>

        <Label Lang="en-gb">Harrison Ford</Label>

      </Labels>

      <Identifiers />

    </TopicRef>

    <TopicRef Address="http://localhost/web3/topicmaps/e518129d-b458-4171-99cc-5e4941dafc7b/topics/dee5c82f-a6ab-4dcc-9e2b-4fbfcaefdc41">

      <Labels>

        <Label Lang="en-gb">Witness</Label>

      </Labels>

      <Identifiers />

    </TopicRef>

    <TopicRef Address="http://localhost/web3/topicmaps/e518129d-b458-4171-99cc-5e4941dafc7b/topics/fc914a45-915c-49b1-baa8-8cf523de3425">

      <Labels>

        <Label Lang="en-gb">Star Wars</Label>

      </Labels>

      <Identifiers />

    </TopicRef>

  </Items>

</TopicRefList>

[/code]



The interesting things in the snippet above are:



<ol>

<li>We have introduced a generic list container for topics, in fact topic refs. This gives us control over thing like collection size and paging.</li>

<li>We have introduced a lightweight topic reference structure for use in listing topics. This is a subset of the full topic representation and is used in many places.

<li>We are explicit about the topic's web address.</li>

<li>We provided explicit links to navigate through the collection</li>

</ol>



All of the above means that a client who understands this content type can navigate to a topic, and find more results or the previous page of results. 



Following a link to a topic using:



[code]

GET http://localhost/web3/topicmaps/e518129d-b458-4171-99cc-5e4941dafc7b/topics/2a8a2182-f8b7-427a-9f7f-ef206b775606?format=xml

[/code]



Returns the following XML



[code]

<?xml version="1.0" encoding="utf-8"?>

<Topic xmlns:xsd="http://www.w3.org/2001/XMLSchema"

       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"

       Id="2a8a2182-f8b7-427a-9f7f-ef206b775606" Version="54" LastModified="2010-09-22T08:46:34.36" 

       Address="http://localhost/web3/topicmaps/e518129d-b458-4171-99cc-5e4941dafc7b/topics/2a8a2182-f8b7-427a-9f7f-ef206b775606" 

       TopicMapAddress="http://localhost/web3/topicmaps/e518129d-b458-4171-99cc-5e4941dafc7b" 

       TopicAssociations="http://localhost/web3/topicmaps/e518129d-b458-4171-99cc-5e4941dafc7b/topics/2a8a2182-f8b7-427a-9f7f-ef206b775606/associations">

  <Labels>

    <Label Lang="en-gb">Harrison Ford</Label>

  </Labels>

  <Identifiers />

  <Types>

    <Type Address="http://localhost/web3/topicmaps/e518129d-b458-4171-99cc-5e4941dafc7b/topics/5c3c037f-0c13-457e-b177-fa3328d13370">

      <Labels>

        <Label Lang="en-gb">Person</Label>

      </Labels>

      <Identifiers>

        <Identifier Address="http://localhost/web3/topicmaps/e518129d-b458-4171-99cc-5e4941dafc7b/topics/5c3c037f-0c13-457e-b177-fa3328d13370/identifiers/32fafe54-0363-4e3a-bb3b-f8a565fc7e26" IdentifierType="ii">

          http://localhost/web3/schemas/0df562f3-f86b-4fbb-a4d3-66679f2df0fa/types/16f22191-5fd7-4f15-8014-f4fc28b1563e

        </Identifier>

        <Identifier Address="http://localhost/web3/topicmaps/e518129d-b458-4171-99cc-5e4941dafc7b/topics/5c3c037f-0c13-457e-b177-fa3328d13370/identifiers/5ab286fc-3e7b-43bd-949f-1766860fb2f3" IdentifierType="si">

          http://www.myfilms.com/types/person

        </Identifier>

      </Identifiers>

    </Type>

  </Types>

  <Properties>

    <Property Id="526c5a91-302c-4138-b8cb-35e5b7b19d2e" Version="54" LastModified="2010-09-22T08:46:34.36" Address="http://localhost/web3/topicmaps/e518129d-b458-4171-99cc-5e4941dafc7b/topics/2a8a2182-f8b7-427a-9f7f-ef206b775606/properties/526c5a91-302c-4138-b8cb-35e5b7b19d2e" TopicAddress="http://localhost/web3/topicmaps/e518129d-b458-4171-99cc-5e4941dafc7b/topics/2a8a2182-f8b7-427a-9f7f-ef206b775606">

      <Type Address="http://localhost/web3/topicmaps/e518129d-b458-4171-99cc-5e4941dafc7b/topics/cb3832ab-7c9b-4ec7-a20e-112dd9b133c3">

        <Labels>

          <Label Lang="en-gb">Biography</Label>

        </Labels>

        <Identifiers>

          <Identifier Address="http://localhost/web3/topicmaps/e518129d-b458-4171-99cc-5e4941dafc7b/topics/cb3832ab-7c9b-4ec7-a20e-112dd9b133c3/identifiers/a2b3bb57-3313-4432-b485-bd08703f1495" IdentifierType="si">

            http://www.myfilms.com/types/biography

          </Identifier>

          <Identifier Address="http://localhost/web3/topicmaps/e518129d-b458-4171-99cc-5e4941dafc7b/topics/cb3832ab-7c9b-4ec7-a20e-112dd9b133c3/identifiers/a314af53-a940-4b7a-a92b-ad2d761ef2c7" IdentifierType="ii">

            http://localhost/web3/schemas/0df562f3-f86b-4fbb-a4d3-66679f2df0fa/types/45ba8b1a-a80c-40c6-8fb6-7d1692c0da7b

          </Identifier>

        </Identifiers>

      </Type>

      <Value xsi:type="xsd:string">Born in the 1940's</Value>

      <Scope />

    </Property>

  </Properties>

</Topic>

[/code]



Points of interest in the above snippet are:



<ol>

<li>The link to the associations for the topic. With this we have created a resource that can be navigated to return the associations in which the topic plays a role. (There are optional query parameters on this as well.)</li>

<li>We use inline topic ref elements to minimise round trips for common things, such as property types and topic types.</li>

<li>All contained resources, property (is name or occurrence) and identity expose their web address. </li>

<li>We have also included version information to help with ETag processing.</li>

</ol>



Finally, following the associations link using:



[code]

http://localhost/web3/topicmaps/e518129d-b458-4171-99cc-5e4941dafc7b/topics/2a8a2182-f8b7-427a-9f7f-ef206b775606/associations?format=xml

[/code]



We get back the following XML structure:



[code]

<?xml version="1.0" encoding="utf-8"?>

<AssociationList xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 

                 Start="0" Count="0" Length="3" 

                 ListUrl="http://localhost/web3/topicmaps/e518129d-b458-4171-99cc-5e4941dafc7b/topics/2a8a2182-f8b7-427a-9f7f-ef206b775606/associations?type=" 

                 Next="http://localhost/web3/topicmaps/e518129d-b458-4171-99cc-5e4941dafc7b/topics/2a8a2182-f8b7-427a-9f7f-ef206b775606/associations?type=&amp;skip=3&amp;take=3" 

                 Previous="http://localhost/web3/topicmaps/e518129d-b458-4171-99cc-5e4941dafc7b/topics/2a8a2182-f8b7-427a-9f7f-ef206b775606/associations?type=&amp;skip=-3take=3">

  <Items>

    <Association Id="033426d3-90fb-4501-9372-cafa7e46cc53" Version="53" LastModified="2010-09-22T08:45:44.507" 

                 Address="http://localhost/web3/topicmaps/e518129d-b458-4171-99cc-5e4941dafc7b/associations/033426d3-90fb-4501-9372-cafa7e46cc53" 

                 TopicMapAddress="http://localhost/web3/topicmaps/e518129d-b458-4171-99cc-5e4941dafc7b">

      <Type Address="http://localhost/web3/topicmaps/e518129d-b458-4171-99cc-5e4941dafc7b/topics/042c8aad-1d32-48d8-9d71-2ed5a9a30b04">

        <Labels />

        <Identifiers>

          <Identifier Address="http://localhost/web3/topicmaps/e518129d-b458-4171-99cc-5e4941dafc7b/topics/042c8aad-1d32-48d8-9d71-2ed5a9a30b04/identifiers/be689f59-e07a-4594-abd1-6d4d0457ee1d" IdentifierType="si">http://psi.topicmaps.org/iso13250/model/type-instance</Identifier>

        </Identifiers>

      </Type>

      <Scope />

      <Roles>

        <Role Id="6bb8e97c-ad0a-469f-8578-e77e2b383e27">

          <Player Address="http://localhost/web3/topicmaps/e518129d-b458-4171-99cc-5e4941dafc7b/topics/2a8a2182-f8b7-427a-9f7f-ef206b775606">

            <Labels>

              <Label Lang="en-gb">Harrison Ford</Label>

            </Labels>

            <Identifiers />

          </Player>

          <Type Address="http://localhost/web3/topicmaps/e518129d-b458-4171-99cc-5e4941dafc7b/topics/65239824-ebdb-4f14-bd10-7bc66ffb772e">

            <Labels />

            <Identifiers>

              <Identifier Address="http://localhost/web3/topicmaps/e518129d-b458-4171-99cc-5e4941dafc7b/topics/65239824-ebdb-4f14-bd10-7bc66ffb772e/identifiers/a9cbb6c7-7729-4834-bc0d-cba517ad4672" IdentifierType="si">http://psi.topicmaps.org/iso13250/model/instance</Identifier>

            </Identifiers>

          </Type>

        </Role>

        <Role Id="82cf9263-4951-4c0f-a536-e940ce9f17f0">

          <Player Address="http://localhost/web3/topicmaps/e518129d-b458-4171-99cc-5e4941dafc7b/topics/5c3c037f-0c13-457e-b177-fa3328d13370">

            <Labels>

              <Label Lang="en-gb">Person</Label>

            </Labels>

            <Identifiers>

              <Identifier Address="http://localhost/web3/topicmaps/e518129d-b458-4171-99cc-5e4941dafc7b/topics/5c3c037f-0c13-457e-b177-fa3328d13370/identifiers/32fafe54-0363-4e3a-bb3b-f8a565fc7e26" IdentifierType="ii">http://localhost/web3/schemas/0df562f3-f86b-4fbb-a4d3-66679f2df0fa/types/16f22191-5fd7-4f15-8014-f4fc28b1563e</Identifier>

              <Identifier Address="http://localhost/web3/topicmaps/e518129d-b458-4171-99cc-5e4941dafc7b/topics/5c3c037f-0c13-457e-b177-fa3328d13370/identifiers/5ab286fc-3e7b-43bd-949f-1766860fb2f3" IdentifierType="si">http://www.myfilms.com/types/person</Identifier>

            </Identifiers>

          </Player>

          <Type Address="http://localhost/web3/topicmaps/e518129d-b458-4171-99cc-5e4941dafc7b/topics/e3746d43-ce02-45c5-9d2d-c244fcbbd9e3">

            <Labels />

            <Identifiers>

              <Identifier Address="http://localhost/web3/topicmaps/e518129d-b458-4171-99cc-5e4941dafc7b/topics/e3746d43-ce02-45c5-9d2d-c244fcbbd9e3/identifiers/d3d79a3b-84fc-433a-8251-306a8bcc3e74" IdentifierType="si">http://psi.topicmaps.org/iso13250/model/type</Identifier>

            </Identifiers>

          </Type>

        </Role>

      </Roles>

      <Identifiers />

    </Association>

  </Items>

</AssociationList>

[/code]



So the key things we wanted to do was to create a set of content types that along with a description allowed a client to interact with a Topic Map without the need to refer to or know how to generate ANY URIs.



The examples above have shown how we have updated the core TMDM items, topic, association, occurrence etc to be better REST citizens, and we have also introduced new resources for collections of things in the topic map model. These collections are key to connecting together the basic topic map building blocks.



The full content type descriptions, including update semantics, are available as part of the documentation for the <a href="http://www.networkedplanet.com/solutions/web3-platform/" title="Web3 Platform">Web3 Platform</a>. You can request an evaluation copy of the software <a href="http://www.networkedplanet.com/contact/request-evaluation/" title="Request Evaluation">here</a>.



We also recently posted about <a href="http://www.networkedplanet.com/using-http-verbs-to-describe-server-side-transactions/" title="Using HTTP Verbs to describe Server Side Transactions">how we support transactions in a RESTful way</a>.
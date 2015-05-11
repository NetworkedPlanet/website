---
layout: post
title: EPiServer 5 CMS Web Services "not allowed"
tag: episerver module
tag: tip
category: TMCore EPiServer Module
author: gra
---
Some of our customers have reported problems with the EPiServer Module 3.1 BETA for EPiServer 5 CMS.  Namely whenever the TMCoreEPiDataService.asmx web service is invoked the following error is produced:

<code>2008-01-11 14:25:51,959 ERROR [18] EPiServer.Global.Global_Error - 1.2.5 Unhandled exception in ASP.NET

System.Web.HttpException: The HTTP verb POST used to access path '/NetworkedPlanet/EPiServerModule/Service/TMCoreEPiDataService.asmx/GetTopicNameAndType' is not allowed.

at System.Web.DefaultHttpHandler.BeginProcessRequest(HttpContext context, AsyncCallback callback, Object state)

at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()

at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean&amp; completedSynchronously)</code>

This error is caused by a bug in EPiServer that will be fixed in EPiServer CMS 5 SP1.

EPiServer's explanation of the problem and 2 workarounds are posted here: <del datetime="2013-04-03T14:53:55+00:00">http://www.episerver.com/en/EPiServer_Knowledge_Center/FAQ_EPiServer_4/956/Invoking-WebService-operations-in-IIS5-causes-an-HttpException/</del>

This problem does not affect users deploying EPiServer solutions in a local ASP.NET development server.



<strong>EDIT:</strong> The link to the EPiServer FAQ is no longer valid.
---
layout: post
title: Sharepoint Module - Adding Related Topic Name fields programmatically
tag: sharepoint module
category: Theory and Practice
tag: tip
author: jen
---
Related Topic Name and Related Topic Link Fields are custom fields which you may want to add to the site columns collection programmatically. However SharePoint sometimes returns exceptions when trying to use SPFieldCollection.CreateNewField(), the code below shows how to use an feature receiver to create the custom fields programmatically and add them to the site columns.

public override void FeatureActivated(SPFeatureReceiverProperties properties)

{

try

{

var site = properties.Feature.Parent as SPSite;

if (site != null)

{

SPWeb web = site.RootWeb;

const string typeName = "RelatedTopicName"; //important - the type name must be correct

const string displayName = "Related Themes";

const string internalName = "RTN_Related_Themes_001";

const string relatedTopicFieldSource = "37d6a246-0cd3-449c-8c06-6ccd75bc1c8c";

const string showDrafts = "true";

const string showVersionInfo = "false";

string customisation = String.Format(@"<Customization><ArrayOfProperty><Property><Name>SourceFieldId</Name><Value xmlns:q1=""http://www.w3.org/2001/XMLSchema"" p4:type=""q1:string"" xmlns:p4=""http://www.w3.org/2001/XMLSchema-instance"">{0}</Value></Property><Property><Name>ShowDrafts</Name><Value xmlns:q2=""http://www.w3.org/2001/XMLSchema"" p4:type=""q2:boolean"" xmlns:p4=""http://www.w3.org/2001/XMLSchema-instance"">{1}</Value></Property><Property><Name>ShowVersionInformation</Name><Value xmlns:q3=""http://www.w3.org/2001/XMLSchema"" p4:type=""q3:boolean"" xmlns:p4=""http://www.w3.org/2001/XMLSchema-instance"">{2}</Value></Property></ArrayOfProperty></Customization>", relatedTopicFieldSource, showDrafts, showVersionInfo);

string fldxml = String.Format(@"<Field Type=""{0}"" DisplayName=""{1}"" Name=""{2}"">{3}</Field>", typeName, displayName, internalName, customisation);

web.Fields.AddFieldAsXml(fldxml);

}

}

catch (Exception e)

{

//Log the error

throw;

}

}


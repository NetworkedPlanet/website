---
layout: post
title: Known Issue - TMCore07 SP4 - Display of non-ascii characters
tag: bug
category: TMCore
tag: tmcore
author: kal
---
<b>Description</b>

TMCore07 SP4 included a fix for the tm_displayName function in the TMCore database that provides the default display name for a topic. Prior to SP4, this function returned a varchar result which meant that non-ASCII characters would display as a ?. From SP4 the function was updated to return an nvarchar result, allowing any Unicode characters to be correctly displayed. Unfortunately the early release of the SP4 package did not include this updated function in the database upgrade script.

<b>Systems Affected</b>

This problem will show up only on databases that have been upgraded from a previous version of TMCore - clean database installations are not affected by this problem. In addition, the TMCore07 SP4 installer has been fixed so that downloads of the installer taken on or after the 21st August 2009 do not exhibit this problem either for new databases or for upgraded databases.

<b>Fix</b>

If you downloaded TMCore07 SP4 prior to 21st August 2009, you can apply the update  for the tm_displayName function by running the following SQL script against the TMCore database:

<pre>

-------------------------------------------------------------------

-- tm_displayName

-- Returns a display string for a topic selected from the topics variant names and topic names.

-- Since: 1.0

-- Last Updated: 2.4

if exists (select * from sysobjects

where id = object_id(N'[tm_displayName]') and

xtype in(N'FN',N'IF',N'TF'))

DROP FUNCTION [tm_displayName]

go

CREATE FUNCTION dbo.tm_displayName (@topic int)

RETURNS nvarchar(512)  AS

BEGIN

DECLARE @disp int

DECLARE @ret nvarchar(512)

SELECT @disp = (SELECT TOP 1 topic_id from tm_si

WHERE

tm_si.topicmap = (select topicmapref from topic where id = @topic) and

subj_id='http://www.topicmaps.org/xtm/1.0/core.xtm#display')

SET @ret = (SELECT TOP 1 variant_value FROM tm_nameVariantValue JOIN tm_variantScope ON tm_nameVariantValue.variant_id = tm_variantScope.variant_id

WHERE

tm_nameVariantValue.topic_id = @topic AND tm_variantScope.scoping_topic_id = @disp

ORDER BY tm_nameVariantValue.variant_id ASC)

IF (@ret IS NULL)

SET @ret = (SELECT TOP 1 name_value FROM tm_nameValue JOIN tm_nameScope ON tm_nameValue.name_id = tm_nameScope.name_id

WHERE

tm_nameValue.topic_id = @topic AND tm_nameScope.scoping_topic_id = @disp

ORDER BY tm_nameValue.name_id ASC)

IF (@ret IS NULL)

SET @ret = (SELECT TOP 1 name_value FROM tm_nameValue JOIN tm_nameScope ON tm_nameValue.name_id = tm_nameScope.name_id

WHERE

tm_nameValue.topic_id = @topic and ((tm_nameScope.scoping_topic_id IS NULL)  or (tm_nameScope.scoping_topic_id = -1))

ORDER BY tm_nameVALUE.name_id ASC)

IF (@ret IS NULL)

SET @ret = (SELECT TOP 1 name_value FROM tm_nameValue WHERE tm_nameValue.topic_id = @topic ORDER BY tm_nameValue.name_id)

RETURN @ret

END

GO

grant exec on tm_displayName to tm_reader, tm_writer

go

</pre>


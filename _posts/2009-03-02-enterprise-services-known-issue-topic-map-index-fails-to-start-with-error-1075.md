---
layout: post
title: Enterprise Services Known Issue - Topic Map Index fails to start with error 1075
tag: bug
category: TMCore Enterprise Services
tag: TMCore Enterprise Services
author: kal
---
A couple of customers have reported an error when starting up the Topic Map Index Service installed by the Enterprise Services 1.0 installer. When trying to start the service, the user will see a dialog displaying a message like:

"Could not start the TMCore Topic Map Index Service service on Local Computer

Error 1075: The dependency does not exist or has been marked for deletion"

What has happened is that the installer detected SQLServer installed on the machine and has inserted the dependency. The dependency it adds is against the normal SQLServer service name, but if you are running a different instance or are running SQLServer Express edition, you will need to modify that dependency.

WARNING: The fix to this problem involves changing registry keys. Please be very careful to change only the specified keys and ensure that you enter the correct values.

To fix this problem you need to first determine the name of the SQL Server Express service to add the dependency for. To do this, look for the server in the services list, then go to the Properties for the service. The service name is the value displayed as "Service Name" on the "General" tab of the Properties dialog. For example, on our own intranet server that uses SQL Server Express, the service name is "MSSQL$SQLEXPRESS".

Now go into the registry, go to the key HKEY_LOCAL_MACHINESYSTEMCurrentControlSetServicesTopicMapIndex and change the DependsOnService value to the name of the database service that the topic map index service should wait for before starting up.

NOTE: If you don't actually connect to a database service on the same machine then just delete this value completely.


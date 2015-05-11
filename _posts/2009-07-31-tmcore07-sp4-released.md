---
layout: post
title: TMCore07 SP4 Released
tag: releases
category: TMCore
tag: tmcore
author: kal
---
NetworkedPlanet today announces the release of latest version of the TMCore topic map engine. TMCore is the premiere toolkit for developers on .NET looking to harness the full power of Topic Maps in their applications. Built from the ground-up using .NET technologies, TMCore provides a flexible set of APIs and builds on the robustness, scalability, performance of Microsoft's SQL Server.

The new SP4 release of TMCore07 provides a number of bug fixes and performance enhancements and is a recommended upgrade for all customers. Customers having a current support contract receive TMCore07 SP4 free of charge. For download details please email us at contact@networkedplanet.com.

The following fixes and updates have been made in this release:

BUGFIX: TMEditor now properly displays non-latin characters in browsers that have support for rendering them correctly.

PERFORMANCE: Performance of the stored procedures for duplicate suppression has been greatly increased while also decreasing the amount of server memory required to complete the duplicate removal process on large topic maps.

BUGFIX: TMEditor now supports editing association role constraints for reflexive associations

BUGFIX: The NPCL import process now allows importing duplicate association role constraints on an association. This fix enables users to define reflexive associations using multiple association role constraints with the same role type.

BUGFIX: The tm_npcl* views have been fixed to eliminate duplicate entries and improve performance.

BUGFIX: tmimport.exe and tmexport.exe now return a non-zero status code when an error is encountered.

BUGFIX: XTM export has been fixed to not export associations with no roles in order to avoid generating invalid XTM output.

BUGFIX: The NPCL Forms export has been fixed to avoid generating invalid output when the NPCL schema contains inconsistencies.


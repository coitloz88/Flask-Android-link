DROP TABLE IF EXISTS `BASELINE_ScreenEvent_DailyStats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BASELINE_ScreenEvent_DailyStats` (
  `Idx` int(11) NOT NULL AUTO_INCREMENT,
  `User` varchar(150) NOT NULL,
  `EventType` varchar(20) NOT NULL,
  `EventTime` datetime NOT NULL,
  `Frame` tinyint(1) unsigned NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Idx`)
) ENGINE=InnoDB AUTO_INCREMENT=980464 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `BASELINE_UsageStats_DailyStats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BASELINE_UsageStats_DailyStats` (
  `Idx` int(11) NOT NULL AUTO_INCREMENT,
  `User` varchar(150) NOT NULL,
  `Date` date NOT NULL,
  `TimeSlot` tinyint(1) unsigned NOT NULL,
  `AppName` varchar(100) NOT NULL,
  `AppPackage` varchar(150) NOT NULL,
  `UsageTime` mediumint(3) unsigned NOT NULL,
  `UsageCount` smallint(2) unsigned NOT NULL,
  `Frame` tinyint(1) unsigned NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `BASELINE_UsageStats_RawData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BASELINE_UsageStats_RawData` (
  `Idx` int(11) NOT NULL AUTO_INCREMENT,
  `User` varchar(150) CHARACTER SET utf8 NOT NULL,
  `AppName` varchar(100) CHARACTER SET utf8 NOT NULL,
  `AppPackage` varchar(150) CHARACTER SET utf8 NOT NULL,
  `EventType` varchar(20) CHARACTER SET utf8 NOT NULL,
  `EventTime` datetime(4) NOT NULL,
  `Frame` tinyint(1) unsigned NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Idx`)
) ENGINE=InnoDB AUTO_INCREMENT=8184200 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `BASELINE_UsageStats_RawStats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BASELINE_UsageStats_RawStats` (
  `Idx` int(11) NOT NULL AUTO_INCREMENT,
  `User` varchar(150) NOT NULL,
  `Date` date NOT NULL,
  `TimeSlot` tinyint(1) unsigned NOT NULL,
  `AppName` varchar(100) NOT NULL,
  `AppPackage` varchar(150) NOT NULL,
  `StartTime` datetime NOT NULL,
  `EndTime` datetime NOT NULL,
  `UsageTime` mediumint(3) unsigned NOT NULL,
  `Frame` tinyint(1) unsigned NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `BASELINE_UsageTime_DailyStats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BASELINE_UsageTime_DailyStats` (
  `Idx` int(11) NOT NULL AUTO_INCREMENT,
  `User` varchar(150) NOT NULL,
  `Date` date NOT NULL,
  `TimeSlot` tinyint(1) unsigned NOT NULL,
  `UsageTime` smallint(2) unsigned NOT NULL,
  `Success` tinyint(1) unsigned NOT NULL,
  `Frame` tinyint(1) unsigned NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Idx`)
) ENGINE=InnoDB AUTO_INCREMENT=63538 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;



DROP TABLE IF EXISTS `BASELINE_UsageTime_TotalStats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BASELINE_UsageTime_TotalStats` (
  `Idx` int(11) NOT NULL AUTO_INCREMENT,
  `User` varchar(150) NOT NULL,
  `Date` date NOT NULL,
  `TimeSlot` tinyint(1) unsigned NOT NULL,
  `UsageTime` mediumint(3) unsigned NOT NULL,
  `Success` tinyint(1) unsigned NOT NULL,
  `Fail` tinyint(1) unsigned NOT NULL,
  `TotalSuccess` smallint(2) unsigned NOT NULL,
  `TotalFail` smallint(2) unsigned NOT NULL,
  `Frame` tinyint(1) unsigned NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Idx`)
) ENGINE=InnoDB AUTO_INCREMENT=2533 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `COMMON_UpdateTime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMMON_UpdateTime` (
  `Idx` int(11) NOT NULL AUTO_INCREMENT,
  `User` varchar(150) NOT NULL,
  `UpdateTime` varchar(10) NOT NULL,
  `UsageStatsUpdateTime` varchar(10) NOT NULL,
  `Frame` tinyint(1) NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Idx`)
) ENGINE=InnoDB AUTO_INCREMENT=569 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `DEBUG_LogMsg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEBUG_LogMsg` (
  `Idx` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `User` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  `Log` varchar(200) CHARACTER SET utf8mb4 NOT NULL,
  `Frame` tinyint(1) NOT NULL,
  `UpdateTime` timestamp(4) NOT NULL DEFAULT CURRENT_TIMESTAMP(4),
  PRIMARY KEY (`Idx`)
) ENGINE=InnoDB AUTO_INCREMENT=2798 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `DEBUG_LogMsg2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEBUG_LogMsg2` (
  `Idx` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `User` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  `Log` longtext CHARACTER SET utf8mb4 NOT NULL,
  `Frame` tinyint(1) NOT NULL,
  `UpdateTime` timestamp(4) NOT NULL DEFAULT CURRENT_TIMESTAMP(4),
  PRIMARY KEY (`Idx`)
) ENGINE=InnoDB AUTO_INCREMENT=4775 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



DROP TABLE IF EXISTS `FOLLOWUP_UsageStats_RawData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FOLLOWUP_UsageStats_RawData` (
  `Idx` int(11) NOT NULL AUTO_INCREMENT,
  `User` varchar(150) CHARACTER SET utf8 NOT NULL,
  `AppName` varchar(100) CHARACTER SET utf8 NOT NULL,
  `AppPackage` varchar(150) CHARACTER SET utf8 NOT NULL,
  `EventType` varchar(20) CHARACTER SET utf8 NOT NULL,
  `EventTime` datetime(4) NOT NULL,
  `Frame` tinyint(1) unsigned NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `INTERVENTION_ScreenEvent_DailyStats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INTERVENTION_ScreenEvent_DailyStats` (
  `Idx` int(11) NOT NULL AUTO_INCREMENT,
  `User` varchar(150) NOT NULL,
  `EventType` varchar(20) NOT NULL,
  `EventTime` datetime NOT NULL,
  `Frame` tinyint(1) unsigned NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Idx`)
) ENGINE=InnoDB AUTO_INCREMENT=2809574 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `INTERVENTION_UsageStats_DailyStats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INTERVENTION_UsageStats_DailyStats` (
  `Idx` int(11) NOT NULL AUTO_INCREMENT,
  `User` varchar(150) NOT NULL,
  `Date` date NOT NULL,
  `TimeSlot` tinyint(1) unsigned NOT NULL,
  `AppName` varchar(100) NOT NULL,
  `AppPackage` varchar(150) NOT NULL,
  `UsageTime` mediumint(3) unsigned NOT NULL,
  `UsageCount` smallint(2) unsigned NOT NULL,
  `Frame` tinyint(1) unsigned NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;



DROP TABLE IF EXISTS `INTERVENTION_UsageStats_RawData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INTERVENTION_UsageStats_RawData` (
  `Idx` int(11) NOT NULL AUTO_INCREMENT,
  `User` varchar(150) CHARACTER SET utf8 NOT NULL,
  `AppName` varchar(100) CHARACTER SET utf8 NOT NULL,
  `AppPackage` varchar(150) CHARACTER SET utf8 NOT NULL,
  `EventType` varchar(20) CHARACTER SET utf8 NOT NULL,
  `EventTime` datetime(4) NOT NULL,
  `Frame` tinyint(1) unsigned NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Idx`)
) ENGINE=InnoDB AUTO_INCREMENT=21398528 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;



DROP TABLE IF EXISTS `INTERVENTION_UsageStats_RawStats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INTERVENTION_UsageStats_RawStats` (
  `Idx` int(11) NOT NULL AUTO_INCREMENT,
  `User` varchar(150) NOT NULL,
  `Date` date NOT NULL,
  `TimeSlot` tinyint(1) unsigned NOT NULL,
  `AppName` varchar(100) NOT NULL,
  `AppPackage` varchar(150) NOT NULL,
  `StartTime` datetime NOT NULL,
  `EndTime` datetime NOT NULL,
  `UsageTime` mediumint(3) unsigned NOT NULL,
  `Frame` tinyint(1) unsigned NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `INTERVENTION_UsageTime_DailyStats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INTERVENTION_UsageTime_DailyStats` (
  `Idx` int(11) NOT NULL AUTO_INCREMENT,
  `User` varchar(150) NOT NULL,
  `Date` date NOT NULL,
  `TimeSlot` tinyint(1) unsigned NOT NULL,
  `UsageTime` smallint(2) unsigned NOT NULL,
  `Success` tinyint(1) unsigned NOT NULL,
  `Frame` tinyint(1) unsigned NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Idx`)
) ENGINE=InnoDB AUTO_INCREMENT=191549 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `INTERVENTION_UsageTime_TotalStats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INTERVENTION_UsageTime_TotalStats` (
  `Idx` int(11) NOT NULL AUTO_INCREMENT,
  `User` varchar(150) NOT NULL,
  `Date` date NOT NULL,
  `TimeSlot` tinyint(1) unsigned NOT NULL,
  `UsageTime` mediumint(3) unsigned NOT NULL,
  `Success` tinyint(1) unsigned NOT NULL,
  `Fail` tinyint(1) unsigned NOT NULL,
  `TotalSuccess` smallint(2) unsigned NOT NULL,
  `TotalFail` smallint(2) unsigned NOT NULL,
  `Frame` tinyint(1) unsigned NOT NULL,
  `Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Idx`)
) ENGINE=InnoDB AUTO_INCREMENT=6316 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;


# Projekt:
##<img src="http://www.deineschmerzgrenze.at/images/logo.png" width="75px" height="75px">Deine Schmerzgrenze.at

### Tables PollPool, PollCategories, UserPool, VotesPool
CREATE TABLE IF NOT EXISTS `PollPool` (
  `ID` int(10) unsigned NOT NULL,
  `CATEGORYID` tinyint(4) unsigned NOT NULL,
  `gender-dependency` enum('N','M','F','') NOT NULL DEFAULT 'N',
  `explicit` tinyint(1) NOT NULL DEFAULT '0',
  `question` varchar(255) NOT NULL,
  `flag` enum('normal','reported','waiting','blocked') NOT NULL DEFAULT 'waiting'
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `PollCategories` (
  `ID` tinyint(4) unsigned NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `UserPool` (
  `FBID` bigint(20) unsigned NOT NULL,
  `email` varchar(255) NOT NULL,
  `publicname` varchar(255) NOT NULL,
  `gender` enum('not defined','male','female','') CHARACTER SET latin1 NOT NULL DEFAULT 'not defined',
  `agegroup` varchar(96) NOT NULL,
  `country` varchar(128) NOT NULL,
  `_isadmin` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `VotesPool` (
  `UID` bigint(20) unsigned NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FBID` bigint(20) unsigned NOT NULL,
  `POLLID` int(10) unsigned NOT NULL,
  `votedvalue` int(10) unsigned NOT NULL,
  `denied` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=373 DEFAULT CHARSET=utf8;
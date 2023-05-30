
CREATE TABLE `autoresponder_group` (
  `autoresponder_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id_fk` int(11) DEFAULT NULL,
  `group_label` varchar(200) DEFAULT NULL,
  `list_id_fk` varchar(200) DEFAULT NULL,
  `search_options` char(1) DEFAULT NULL,
  `email_contains` varchar(200) DEFAULT NULL,
  `email_dont_contains` varchar(200) DEFAULT NULL,
  `opened` int(11) DEFAULT '0',
  `open_campaing_type` char(1) DEFAULT '0',
  `clicked` char(1) DEFAULT NULL,
  `clicked_campaing_type` char(1) DEFAULT '0',
  `click_email_campaign_id_fk` text,
  `clicked_links` text,
  `rules` text,
  `group_date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT '1',
  `send_existing` char(1) DEFAULT NULL,
  `list_type` tinyint(4) DEFAULT NULL,
  `segment_id_fk` text,
  `autoresponder_group_criteria_id_fk` text,
  `clicks` int(11) DEFAULT '0',
  `unique_clicks` int(11) DEFAULT '0',
  `opens` int(11) DEFAULT '0',
  `unique_opens` int(11) DEFAULT '0',
  PRIMARY KEY (`autoresponder_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `autoresponder_group_click_tracking` (
  `click_id` int(11) NOT NULL AUTO_INCREMENT,
  `email_id_fk` int(11) DEFAULT NULL,
  `autoresponder_group_id_fk` int(11) DEFAULT NULL,
  `autoresponder_group_criteria_id_fk` int(11) DEFAULT NULL,
  `click_time` datetime DEFAULT NULL,
  `click_ip` varchar(20) DEFAULT NULL,
  `click_link` varchar(500) DEFAULT NULL,
  `click_country` varchar(100) DEFAULT NULL,
  `click_region` varchar(50) DEFAULT NULL,
  `click_city` varchar(50) DEFAULT NULL,
  `click_zip` varchar(15) DEFAULT NULL,
  `browser` varchar(20) DEFAULT NULL,
  `os` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`click_id`),
  KEY `email_id_fk` (`email_id_fk`),
  KEY `campaign_id_fk` (`autoresponder_group_id_fk`),
  KEY `click_link` (`click_link`),
  KEY `click_country` (`click_country`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `autoresponder_group_criteria` (
  `autoresponder_group_criteria_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id_fk` int(11) DEFAULT NULL,
  `criteria_label` varchar(200) DEFAULT NULL,
  `smtp_id_fk` varchar(200) DEFAULT NULL,
  `compaign_id_fk` varchar(200) DEFAULT NULL,
  `send_type` char(1) DEFAULT NULL,
  `send_duration` int(11) DEFAULT NULL,
  `send_frequency` varchar(10) DEFAULT NULL,
  `track_opens` char(1) DEFAULT NULL,
  `track_clicks` char(1) DEFAULT NULL,
  `criteria_date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT '1',
  `sent` int(11) NOT NULL DEFAULT '0',
  `bounced` int(11) NOT NULL DEFAULT '0',
  `unsubscribed` int(11) NOT NULL DEFAULT '0',
  `opens` int(11) NOT NULL DEFAULT '0',
  `unique_opens` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `unique_clicks` int(11) NOT NULL DEFAULT '0',
  `sender_info` char(1) DEFAULT NULL,
  `from_name` varchar(300) DEFAULT NULL,
  `from_email` varchar(200) DEFAULT NULL,
  `bounce_email` varchar(200) DEFAULT NULL,
  `reply_email` varchar(200) DEFAULT NULL,
  `spamed_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`autoresponder_group_criteria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `autoresponder_group_logs` (
  `email_list_id_fk` int(11) NOT NULL,
  `autoresponder_group_id_fk` int(11) NOT NULL,
  `autoresponder_group_criteria_id_fk` int(11) NOT NULL,
  PRIMARY KEY (`email_list_id_fk`,`autoresponder_group_criteria_id_fk`,`autoresponder_group_id_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `autoresponder_group_open_tracking` (
  `open_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `email_id_fk` bigint(11) DEFAULT NULL,
  `open_ip` varchar(15) DEFAULT NULL,
  `open_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `open_country` varchar(100) DEFAULT NULL,
  `autoresponder_group_id_fk` int(11) DEFAULT NULL,
  `autoresponder_group_criteria_id_fk` int(11) DEFAULT NULL,
  `open_region` varchar(50) DEFAULT NULL,
  `open_city` varchar(50) DEFAULT NULL,
  `open_zip` varchar(15) DEFAULT NULL,
  `browser` varchar(20) DEFAULT NULL,
  `os` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`open_id`),
  KEY `campaign_id_fk` (`autoresponder_group_id_fk`),
  KEY `email_id_fk` (`email_id_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

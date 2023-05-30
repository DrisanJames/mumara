-- phpMyAdmin SQL Dump
-- version 4.0.10.14
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Oct 31, 2016 at 03:17 AM
-- Server version: 5.6.33
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `syncmuma_dbsync`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE IF NOT EXISTS `account` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(200) DEFAULT NULL,
  `address1` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `mobile` varchar(30) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE IF NOT EXISTS `activity_log` (
  `activity_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id_fk` int(11) DEFAULT NULL,
  `entity` varchar(30) DEFAULT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `activity_type` varchar(10) DEFAULT NULL,
  `activity_time` datetime DEFAULT NULL,
  `entity_label` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`activity_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `adknowledge_error_log`
--

CREATE TABLE IF NOT EXISTS `adknowledge_error_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_msg` longblob,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `adknowledge_setting`
--

CREATE TABLE IF NOT EXISTS `adknowledge_setting` (
  `adknowledge_setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `publisher_id` varchar(100) DEFAULT NULL,
  `token` varchar(100) DEFAULT NULL,
  `idomain` varchar(100) DEFAULT NULL,
  `cdomain` varbinary(100) DEFAULT NULL,
  `test` char(1) DEFAULT NULL,
  `account_id_fk` int(11) DEFAULT NULL,
  `adknowledge_list_id` text,
  `batch_size` int(11) DEFAULT '200',
  `click_timer` int(11) DEFAULT '120',
  `track_clicks` char(1) DEFAULT NULL,
  `slogan` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `our_services` varchar(200) DEFAULT NULL,
  `privacy_policy` varchar(200) DEFAULT NULL,
  `logo_path` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`adknowledge_setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `api_integration`
--

CREATE TABLE IF NOT EXISTS `api_integration` (
  `api_integration_id` int(11) NOT NULL AUTO_INCREMENT,
  `integration_label` varchar(200) DEFAULT NULL,
  `tokens` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`api_integration_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `autoresponder`
--

CREATE TABLE IF NOT EXISTS `autoresponder` (
  `autoresponder_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id_fk` int(11) DEFAULT NULL,
  `autoresponder_label` varchar(200) DEFAULT NULL,
  `list_id_fk` varchar(200) DEFAULT NULL,
  `search_options` char(1) DEFAULT NULL,
  `email_contains` varchar(200) DEFAULT NULL,
  `email_dont_contains` varchar(200) DEFAULT NULL,
  `opened` char(1) DEFAULT NULL,
  `open_campaing_type` char(1) DEFAULT '0',
  `open_email_campaign_id_fk` text,
  `clicked` char(1) DEFAULT NULL,
  `clicked_campaing_type` char(1) DEFAULT '0',
  `click_email_campaign_id_fk` text,
  `clicked_links` text,
  `rules` text,
  `smtp_id_fk` varchar(200) DEFAULT NULL,
  `send_type` char(1) DEFAULT NULL,
  `send_duration` int(11) DEFAULT NULL,
  `send_frequency` varchar(10) DEFAULT NULL,
  `track_opens` char(1) DEFAULT NULL,
  `track_clicks` char(1) DEFAULT NULL,
  `email_subject` varchar(200) DEFAULT NULL,
  `email_content` longblob,
  `text_content` longblob,
  `date_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT '1',
  `send_existing` char(1) DEFAULT NULL,
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
  PRIMARY KEY (`autoresponder_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `autoresponder_click_tracking`
--

CREATE TABLE IF NOT EXISTS `autoresponder_click_tracking` (
  `click_id` int(11) NOT NULL AUTO_INCREMENT,
  `email_id_fk` int(11) DEFAULT NULL,
  `autoresponder_id_fk` int(11) DEFAULT NULL,
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
  KEY `campaign_id_fk` (`autoresponder_id_fk`),
  KEY `click_link` (`click_link`),
  KEY `click_country` (`click_country`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `autoresponder_group`
--

CREATE TABLE IF NOT EXISTS `autoresponder_group` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `autoresponder_group_click_tracking`
--

CREATE TABLE IF NOT EXISTS `autoresponder_group_click_tracking` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `autoresponder_group_criteria`
--

CREATE TABLE IF NOT EXISTS `autoresponder_group_criteria` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `autoresponder_group_logs`
--

CREATE TABLE IF NOT EXISTS `autoresponder_group_logs` (
  `email_list_id_fk` int(11) NOT NULL,
  `autoresponder_group_id_fk` int(11) NOT NULL,
  `autoresponder_group_criteria_id_fk` int(11) NOT NULL,
  PRIMARY KEY (`email_list_id_fk`,`autoresponder_group_criteria_id_fk`,`autoresponder_group_id_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `autoresponder_group_open_tracking`
--

CREATE TABLE IF NOT EXISTS `autoresponder_group_open_tracking` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `autoresponder_logs`
--

CREATE TABLE IF NOT EXISTS `autoresponder_logs` (
  `email_list_id_fk` int(11) NOT NULL,
  `autoresponder_id_fk` int(11) NOT NULL,
  PRIMARY KEY (`email_list_id_fk`,`autoresponder_id_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `autoresponder_open_tracking`
--

CREATE TABLE IF NOT EXISTS `autoresponder_open_tracking` (
  `open_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `email_id_fk` bigint(11) DEFAULT NULL,
  `open_ip` varchar(15) DEFAULT NULL,
  `open_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `open_country` varchar(100) DEFAULT NULL,
  `autoresponder_id_fk` int(11) DEFAULT NULL,
  `open_region` varchar(50) DEFAULT NULL,
  `open_city` varchar(50) DEFAULT NULL,
  `open_zip` varchar(15) DEFAULT NULL,
  `browser` varchar(20) DEFAULT NULL,
  `os` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`open_id`),
  KEY `campaign_id_fk` (`autoresponder_id_fk`),
  KEY `email_id_fk` (`email_id_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auto_log`
--

CREATE TABLE IF NOT EXISTS `auto_log` (
  `auto_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_date` datetime DEFAULT NULL,
  `account_id_fk` int(11) DEFAULT NULL,
  `message` varchar(500) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`auto_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `blacklist`
--

CREATE TABLE IF NOT EXISTS `blacklist` (
  `blacklist_id` int(11) NOT NULL AUTO_INCREMENT,
  `smtp_id_fk` int(11) DEFAULT NULL,
  `blacklist` varchar(100) DEFAULT NULL,
  `ip` varchar(300) DEFAULT NULL,
  `listed_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`blacklist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `blacklist_checker`
--

CREATE TABLE IF NOT EXISTS `blacklist_checker` (
  `blacklist_checker_id` int(11) NOT NULL AUTO_INCREMENT,
  `blacklist` varchar(50) DEFAULT NULL,
  `account_id_fk` int(1) DEFAULT NULL,
  PRIMARY KEY (`blacklist_checker_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `blacklist_domain`
--

CREATE TABLE IF NOT EXISTS `blacklist_domain` (
  `blacklist_id` int(11) NOT NULL AUTO_INCREMENT,
  `mask_domain_id_fk` int(11) DEFAULT NULL,
  `blacklist` varchar(100) DEFAULT NULL,
  `ip_domain` varchar(300) DEFAULT NULL,
  `listed_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`blacklist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `blacklist_domain_checker`
--

CREATE TABLE IF NOT EXISTS `blacklist_domain_checker` (
  `blacklist_checker_id` int(11) NOT NULL AUTO_INCREMENT,
  `blacklist` varchar(50) DEFAULT NULL,
  `account_id_fk` int(1) DEFAULT NULL,
  PRIMARY KEY (`blacklist_checker_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bounce`
--

CREATE TABLE IF NOT EXISTS `bounce` (
  `bounce_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id_fk` int(11) NOT NULL,
  `bounce_host` varchar(200) NOT NULL,
  `bounce_username` varchar(200) NOT NULL,
  `bounce_password` varchar(200) NOT NULL,
  `bounce_label` varchar(200) NOT NULL,
  `bounce_method` tinyint(4) DEFAULT NULL,
  `pmta_ip` varchar(20) DEFAULT NULL,
  `pmta_port` varchar(10) DEFAULT NULL,
  `ssh_login` varchar(100) DEFAULT NULL,
  `ssh_password` varchar(300) DEFAULT NULL,
  `bounce_certificate` char(1) DEFAULT NULL,
  `bounce_tls` char(1) DEFAULT NULL,
  `bounce_ssl` char(1) DEFAULT NULL,
  `bounce_port` varchar(5) DEFAULT NULL,
  `bounce_folder` varchar(20) DEFAULT NULL,
  `delete_emails` char(1) DEFAULT '1',
  `pmta_empty_inbox` char(1) DEFAULT '1',
  `last_email_time` datetime DEFAULT NULL,
  `use_pmta` char(1) DEFAULT '0',
  `esp_server_id_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`bounce_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bounce_reason`
--

CREATE TABLE IF NOT EXISTS `bounce_reason` (
  `bounce_reason_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id_fk` int(11) DEFAULT NULL,
  `bounce_reason_label` varchar(100) DEFAULT NULL,
  `bounce_code` varchar(10) DEFAULT NULL,
  `bounce_reason` varchar(200) DEFAULT NULL,
  `bounce_type` varchar(10) DEFAULT NULL,
  `reason_status` char(1) DEFAULT '1',
  PRIMARY KEY (`bounce_reason_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_error_log`
--

CREATE TABLE IF NOT EXISTS `campaign_error_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id_fk` int(11) DEFAULT NULL,
  `campaign_type` int(11) DEFAULT NULL,
  `error_details` varchar(300) DEFAULT NULL,
  `error_time` datetime DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_type`
--

CREATE TABLE IF NOT EXISTS `campaign_type` (
  `campaign_type` int(11) NOT NULL,
  `campaign_label` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`campaign_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `credits_used`
--

CREATE TABLE IF NOT EXISTS `credits_used` (
  `credits_used_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id_fk` int(11) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `frequency` date DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`credits_used_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `credit_addons`
--

CREATE TABLE IF NOT EXISTS `credit_addons` (
  `credit_addons_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id_fk` int(11) DEFAULT NULL,
  `credits` int(11) DEFAULT NULL,
  `month_date` date DEFAULT NULL,
  `assign_date` date DEFAULT NULL,
  PRIMARY KEY (`credit_addons_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cronjob_log`
--

CREATE TABLE IF NOT EXISTS `cronjob_log` (
  `log_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `cronjob` varchar(20) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `manual` char(1) DEFAULT '0',
  `last_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cron_manual_run`
--

CREATE TABLE IF NOT EXISTS `cron_manual_run` (
  `cron_id` int(11) NOT NULL AUTO_INCREMENT,
  `cron_job` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`cron_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `custom_field`
--

CREATE TABLE IF NOT EXISTS `custom_field` (
  `custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(200) NOT NULL,
  `field_type` varchar(20) NOT NULL,
  `is_required` char(1) NOT NULL DEFAULT '0',
  `value_list` text NOT NULL,
  `account_id_fk` int(11) NOT NULL,
  `field_order` int(11) NOT NULL DEFAULT '0',
  `create_date` date NOT NULL,
  PRIMARY KEY (`custom_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `custom_header`
--

CREATE TABLE IF NOT EXISTS `custom_header` (
  `custom_header_id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_header_label` varchar(100) DEFAULT NULL,
  `custom_header_value` varchar(200) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  PRIMARY KEY (`custom_header_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dkim`
--

CREATE TABLE IF NOT EXISTS `dkim` (
  `dkim_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id_fk` int(11) DEFAULT NULL,
  `dkim_selector` varchar(200) DEFAULT NULL,
  `dkim_identity` varchar(200) DEFAULT NULL,
  `dkim_passphrase` varchar(200) DEFAULT NULL,
  `dkim_domain` varchar(200) DEFAULT NULL,
  `dkim_private` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`dkim_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `domain_blacklist_checker`
--

CREATE TABLE IF NOT EXISTS `domain_blacklist_checker` (
  `domainblacklist_checker_id` int(11) NOT NULL AUTO_INCREMENT,
  `blacklist` varchar(50) DEFAULT NULL,
  `account_id_fk` int(1) DEFAULT NULL,
  PRIMARY KEY (`domainblacklist_checker_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `double_opt_in`
--

CREATE TABLE IF NOT EXISTS `double_opt_in` (
  `double_opt_in_id` int(11) NOT NULL AUTO_INCREMENT,
  `created_email_id` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`double_opt_in_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dynamic_content`
--

CREATE TABLE IF NOT EXISTS `dynamic_content` (
  `dynamic_content_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id_fk` int(11) DEFAULT NULL,
  `dynamic_content_label` varchar(200) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `list_id_fk` varchar(300) DEFAULT NULL,
  `rules` longtext,
  PRIMARY KEY (`dynamic_content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `email_campaign`
--

CREATE TABLE IF NOT EXISTS `email_campaign` (
  `email_campaign_id` int(11) NOT NULL AUTO_INCREMENT,
  `email_subject` varchar(200) CHARACTER SET latin1 NOT NULL,
  `email_content` longtext NOT NULL,
  `text_content` longtext,
  `account_id_fk` int(11) NOT NULL,
  `campaign_label` varchar(200) CHARACTER SET latin1 NOT NULL,
  `create_date` date DEFAULT NULL,
  `campaign_group` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`email_campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `email_campaign_sch`
--

CREATE TABLE IF NOT EXISTS `email_campaign_sch` (
  `email_id_fk` int(11) NOT NULL,
  `campaign_id_fk` int(11) NOT NULL,
  PRIMARY KEY (`email_id_fk`,`campaign_id_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `email_click_tracking`
--

CREATE TABLE IF NOT EXISTS `email_click_tracking` (
  `click_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `email_id_fk` bigint(11) DEFAULT NULL,
  `campaign_id_fk` int(11) DEFAULT NULL,
  `click_time` datetime DEFAULT NULL,
  `click_ip` varchar(20) DEFAULT NULL,
  `click_link` varchar(500) DEFAULT NULL,
  `click_country` varchar(100) DEFAULT NULL,
  `click_region` varchar(50) DEFAULT NULL,
  `click_city` varchar(50) DEFAULT NULL,
  `click_zip` varchar(15) DEFAULT NULL,
  `browser` varchar(20) DEFAULT NULL,
  `os` varchar(20) DEFAULT NULL,
  `email_campaign_id_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`click_id`),
  KEY `email_id_fk` (`email_id_fk`),
  KEY `campaign_id_fk` (`campaign_id_fk`),
  KEY `click_link` (`click_link`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `email_fields`
--

CREATE TABLE IF NOT EXISTS `email_fields` (
  `email_id_fk` bigint(11) NOT NULL,
  `field_id_fk` int(11) NOT NULL,
  `field_value` text NOT NULL,
  PRIMARY KEY (`email_id_fk`,`field_id_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `email_list`
--

CREATE TABLE IF NOT EXISTS `email_list` (
  `email_list_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `list_id_fk` int(11) NOT NULL,
  `email` varchar(500) NOT NULL,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `unsubscribed` tinyint(4) NOT NULL DEFAULT '0',
  `bounced` tinyint(4) NOT NULL DEFAULT '0',
  `unssubcribed_date` datetime NOT NULL,
  `bounced_date` datetime NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_ip` varchar(25) DEFAULT NULL,
  `format` char(1) NOT NULL DEFAULT 'h',
  `confirmation_status` tinyint(1) NOT NULL DEFAULT '1',
  `verification_status` tinyint(1) DEFAULT '0',
  `birth_date` date NOT NULL,
  `city` varchar(200) NOT NULL,
  `country` varchar(200) NOT NULL,
  `post_code` varchar(15) NOT NULL,
  `state` varchar(100) NOT NULL,
  `mobile` varchar(40) NOT NULL,
  `phone` varchar(40) NOT NULL,
  `fax` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `account_id_fk` int(11) NOT NULL,
  `tag` varchar(100) DEFAULT NULL,
  `company` varchar(200) DEFAULT NULL,
  `geo_city` varchar(50) DEFAULT NULL,
  `geo_state` varchar(50) DEFAULT NULL,
  `geo_country` varchar(50) DEFAULT NULL,
  `geo_zip` varchar(10) DEFAULT NULL,
  `geo_ip` varchar(15) DEFAULT NULL,
  `relayed` char(1) DEFAULT NULL,
  `opened` char(1) DEFAULT NULL,
  `clicked` char(1) DEFAULT NULL,
  PRIMARY KEY (`email_list_id`),
  UNIQUE KEY `email_list_id_fk` (`email`,`list_id_fk`),
  KEY `list_id` (`list_id_fk`),
  KEY `account_id_fk` (`account_id_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `email_log`
--

CREATE TABLE IF NOT EXISTS `email_log` (
  `log_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `message_id` varchar(200) DEFAULT NULL,
  `email_id_fk` bigint(11) DEFAULT NULL,
  `schedule_campaign_id_fk` int(11) DEFAULT NULL,
  `email_campaign_id_fk` int(11) DEFAULT NULL,
  `smtp_id_fk` int(11) DEFAULT NULL,
  `info` varchar(500) DEFAULT NULL,
  `email_content` longblob,
  `sending_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `campaign_type` int(11) DEFAULT NULL,
  `bounced` char(1) DEFAULT '0',
  `unsubscribed` char(1) DEFAULT '0',
  `bounce_reason` varchar(500) DEFAULT NULL,
  `bounce_code` varchar(10) DEFAULT NULL,
  `bounce_detail` varchar(500) DEFAULT NULL,
  `dns_mta` varchar(255) DEFAULT NULL,
  `dlv_source` varchar(20) DEFAULT NULL,
  `dns_destination` varchar(20) DEFAULT NULL,
  `vmta` varchar(100) DEFAULT NULL,
  `vmta_pool` varchar(100) DEFAULT NULL,
  `pmta_status` varchar(20) DEFAULT NULL,
  `time_logged` datetime DEFAULT NULL,
  `segment_id_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `message_id` (`message_id`),
  KEY `email_id_fk` (`email_id_fk`),
  KEY `bounced` (`bounced`),
  KEY `unsubscribed` (`unsubscribed`),
  KEY `schedule_campaign_id_fk` (`schedule_campaign_id_fk`),
  KEY `email_campaign_id_fk` (`email_campaign_id_fk`),
  KEY `smtp_id_fk` (`smtp_id_fk`),
  KEY `bounce_code_reason` (`bounce_code`,`bounce_reason`(10)),
  KEY `pmta_status` (`pmta_status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `email_open_tracking`
--

CREATE TABLE IF NOT EXISTS `email_open_tracking` (
  `open_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `email_id_fk` bigint(11) DEFAULT NULL,
  `open_ip` varchar(15) DEFAULT NULL,
  `open_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `open_country` varchar(100) DEFAULT NULL,
  `campaign_id_fk` int(11) DEFAULT NULL,
  `open_region` varchar(50) DEFAULT NULL,
  `open_city` varchar(50) DEFAULT NULL,
  `open_zip` varchar(15) DEFAULT NULL,
  `browser` varchar(20) DEFAULT NULL,
  `os` varchar(20) DEFAULT NULL,
  `email_campaign_id_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`open_id`),
  KEY `email_id_fk` (`email_id_fk`),
  KEY `campaign_id_fk` (`campaign_id_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `email_spam_tracking`
--

CREATE TABLE IF NOT EXISTS `email_spam_tracking` (
  `spam_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `email_id_fk` bigint(11) DEFAULT NULL,
  `spam_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `campaign_id_fk` int(11) DEFAULT NULL,
  `list_id_fk` int(11) DEFAULT NULL,
  `campaign_type` int(11) DEFAULT NULL,
  `feedback_loop_id_fk` int(11) DEFAULT NULL,
  `email_address` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`spam_id`),
  KEY `email_id_fk` (`email_id_fk`),
  KEY `campaign_id_fk` (`campaign_id_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `email_split_campaign`
--

CREATE TABLE IF NOT EXISTS `email_split_campaign` (
  `email_split_campaign_id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_name` varchar(200) NOT NULL,
  `email_campaign_id_fk` text NOT NULL,
  `winner_option` int(11) DEFAULT NULL,
  `account_id_fk` int(11) NOT NULL,
  `result_type` int(11) NOT NULL,
  `per_contacts` int(11) DEFAULT NULL,
  `rem_sch_duration` int(11) DEFAULT NULL,
  `rem_sch_frequency` varchar(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`email_split_campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `email_template`
--

CREATE TABLE IF NOT EXISTS `email_template` (
  `email_template_id` int(11) NOT NULL AUTO_INCREMENT,
  `template_group` varchar(200) DEFAULT NULL,
  `template_label` varchar(200) DEFAULT NULL,
  `html_content` longtext,
  `text_content` longtext,
  `template_preview` longtext,
  `create_date` date DEFAULT NULL,
  PRIMARY KEY (`email_template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `error_log`
--

CREATE TABLE IF NOT EXISTS `error_log` (
  `error_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_msg` varchar(500) DEFAULT NULL,
  `error_time` datetime DEFAULT NULL,
  PRIMARY KEY (`error_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `esp_email_template`
--

CREATE TABLE IF NOT EXISTS `esp_email_template` (
  `esp_email_id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(50) DEFAULT NULL,
  `email_subject` varchar(500) DEFAULT NULL,
  `html_content` text,
  `text_content` text,
  `notify_admin` char(1) DEFAULT NULL,
  `admin_emails` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`esp_email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `esp_ip_list`
--

CREATE TABLE IF NOT EXISTS `esp_ip_list` (
  `esp_ip_list_id` int(11) NOT NULL AUTO_INCREMENT,
  `esp_server_id_fk` int(11) DEFAULT '1',
  `ip` varchar(20) DEFAULT NULL,
  `account_id_fk` int(1) NOT NULL DEFAULT '0',
  `fdns` varchar(150) DEFAULT NULL,
  `port` varchar(10) DEFAULT NULL,
  `smtp_id_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`esp_ip_list_id`),
  UNIQUE KEY `esp_ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `esp_masking_domains`
--

CREATE TABLE IF NOT EXISTS `esp_masking_domains` (
  `esp_masking_domains_id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_url` varchar(100) DEFAULT NULL,
  `listed` int(100) DEFAULT NULL,
  `listed_in` text,
  `last_check_date` date DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`esp_masking_domains_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `esp_server`
--

CREATE TABLE IF NOT EXISTS `esp_server` (
  `esp_server_id` int(11) NOT NULL AUTO_INCREMENT,
  `esp_server_label` varchar(200) DEFAULT NULL,
  `esp_smtp_host` varchar(100) DEFAULT NULL,
  `esp_smtp_port` varchar(30) DEFAULT NULL,
  `esp_server_ip` varchar(25) DEFAULT NULL,
  `esp_server_port` varchar(30) DEFAULT NULL,
  `esp_server_username` varchar(100) DEFAULT NULL,
  `esp_server_password` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `esp_fallback_domain` varchar(200) DEFAULT NULL,
  `esp_spf_domain` varchar(200) DEFAULT NULL,
  `esp_cname_selector` varchar(100) DEFAULT NULL,
  `esp_cname_domain` varchar(300) DEFAULT NULL,
  `esp_admin_iplist` varchar(300) DEFAULT NULL,
  `esp_no_of_users` int(11) DEFAULT NULL,
  `domain_list` varchar(500) DEFAULT NULL,
  `ip_list` mediumtext,
  `dns_panel` int(1) DEFAULT NULL,
  `dns_setting` text,
  `esp_ssh_port` varchar(10) DEFAULT NULL,
  `account_id_fk` int(11) DEFAULT '1',
  `pmta_log_path` varchar(100) DEFAULT NULL,
  `pmta_log_rotation` int(11) DEFAULT NULL,
  `pmta_spool_path` varchar(100) DEFAULT NULL,
  `pmta_acct_path` varchar(100) DEFAULT NULL,
  `pmta_acct_rotation` varchar(10) DEFAULT NULL,
  `pmta_diag_path` varchar(100) DEFAULT NULL,
  `pmta_diag_rotation` varchar(10) DEFAULT NULL,
  `pmta_local_dsn` varchar(3) DEFAULT 'yes',
  PRIMARY KEY (`esp_server_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `esp_setting`
--

CREATE TABLE IF NOT EXISTS `esp_setting` (
  `esp_setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `bounce_suspend` int(11) DEFAULT NULL,
  `spam_suspend` int(11) DEFAULT NULL,
  PRIMARY KEY (`esp_setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `esp_setup`
--

CREATE TABLE IF NOT EXISTS `esp_setup` (
  `esp_setup_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id_fk` int(11) DEFAULT NULL,
  `sender_email` varchar(100) DEFAULT NULL,
  `sender_domain` varchar(100) DEFAULT NULL,
  `reply_email` varchar(100) DEFAULT NULL,
  `domain_selector` varchar(50) DEFAULT NULL,
  `cname_selector` varchar(50) DEFAULT NULL,
  `public_key` varchar(500) DEFAULT NULL,
  `private_key` text,
  `dns_verified` char(1) DEFAULT '0',
  `spf_verified` char(1) DEFAULT '0',
  `cname_verified` char(1) DEFAULT '0',
  `status` char(1) DEFAULT '0',
  `approval_status` char(1) DEFAULT '0',
  `smtp_username` varchar(200) DEFAULT NULL,
  `smtp_password` varchar(200) DEFAULT NULL,
  `white_label` char(1) DEFAULT NULL,
  `bounce_username` varchar(100) DEFAULT NULL,
  `bounce_host` varchar(100) DEFAULT NULL,
  `bounce_port` varchar(10) DEFAULT NULL,
  `bounce_password` varchar(100) DEFAULT NULL,
  `bounce_method` varchar(1) DEFAULT NULL,
  `smtp_id_fk` int(11) DEFAULT NULL,
  `smtp_type` char(1) DEFAULT NULL,
  `last_rechecked_at` datetime DEFAULT NULL,
  `last_wizard_step` int(1) DEFAULT '1',
  PRIMARY KEY (`esp_setup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `feedback_loop`
--

CREATE TABLE IF NOT EXISTS `feedback_loop` (
  `feedback_loop_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id_fk` int(11) NOT NULL,
  `feedback_loop_host` varchar(200) NOT NULL,
  `feedback_loop_username` varchar(200) NOT NULL,
  `feedback_loop_password` varchar(200) NOT NULL,
  `feedback_loop_label` varchar(200) NOT NULL,
  `feedback_loop_method` tinyint(4) DEFAULT NULL,
  `feedback_loop_port` varchar(10) DEFAULT NULL,
  `feedback_loop_folder` varchar(20) DEFAULT NULL,
  `feedback_loop_certificate` char(1) DEFAULT NULL,
  `feedback_loop_tls` char(1) DEFAULT NULL,
  `feedback_loop_ssl` char(1) DEFAULT NULL,
  `delete_emails` char(1) DEFAULT '1',
  `spamed_count` int(11) DEFAULT '0',
  `last_email_time` datetime DEFAULT NULL,
  PRIMARY KEY (`feedback_loop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `forgot_password`
--

CREATE TABLE IF NOT EXISTS `forgot_password` (
  `forgot_password_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id_fk` int(11) DEFAULT NULL,
  `secret_key` varchar(50) DEFAULT NULL,
  `key_expiry` datetime DEFAULT NULL,
  `type` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`forgot_password_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `license`
--

CREATE TABLE IF NOT EXISTS `license` (
  `license_id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(500) DEFAULT NULL,
  `localkey` text,
  `product` varchar(30) DEFAULT NULL,
  `add_ons` text,
  PRIMARY KEY (`license_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

CREATE TABLE IF NOT EXISTS `links` (
  `link_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `link_url` varchar(1000) DEFAULT NULL,
  `account_id_fk` int(11) DEFAULT NULL,
  `campaign_id_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `link_index` (`link_url`(50),`account_id_fk`,`campaign_id_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `list`
--

CREATE TABLE IF NOT EXISTS `list` (
  `list_id` int(11) NOT NULL AUTO_INCREMENT,
  `list_name` varchar(200) NOT NULL,
  `list_owner_name` varchar(200) NOT NULL,
  `list_owner_email` varchar(200) NOT NULL,
  `list_bounceemail` varchar(200) NOT NULL,
  `list_replyemail` varchar(200) NOT NULL,
  `account_id_fk` int(11) NOT NULL,
  `list_fromemail` varchar(200) DEFAULT NULL,
  `list_fromname` varchar(200) DEFAULT NULL,
  `contacts` int(11) DEFAULT NULL,
  `list_group_name` varchar(200) DEFAULT NULL,
  `list_group_id` int(11) DEFAULT '0',
  `create_date` date DEFAULT NULL,
  `verify_list` tinyint(4) NOT NULL DEFAULT '0',
  `processed` int(11) DEFAULT '0',
  `verified` int(11) DEFAULT '0',
  `last_run` datetime DEFAULT NULL,
  `fetch_geo_details` char(1) DEFAULT NULL,
  `remove_duplicates` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `list_custom_field`
--

CREATE TABLE IF NOT EXISTS `list_custom_field` (
  `custom_field_id_fk` int(11) NOT NULL,
  `list_id_fk` int(11) NOT NULL,
  PRIMARY KEY (`custom_field_id_fk`,`list_id_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `list_group`
--

CREATE TABLE IF NOT EXISTS `list_group` (
  `list_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id_fk` int(11) DEFAULT NULL,
  `list_group_label` varchar(100) DEFAULT NULL,
  `parent_group_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`list_group_id`),
  UNIQUE KEY `NewIndex1` (`account_id_fk`,`list_group_label`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `list_visible_field`
--

CREATE TABLE IF NOT EXISTS `list_visible_field` (
  `visible_field_id_fk` int(11) NOT NULL,
  `list_id_fk` int(11) NOT NULL,
  `column_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`visible_field_id_fk`,`list_id_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mandrill_setting`
--

CREATE TABLE IF NOT EXISTS `mandrill_setting` (
  `mandrill_setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id_fk` int(11) DEFAULT NULL,
  `api_key` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`mandrill_setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mask_domain`
--

CREATE TABLE IF NOT EXISTS `mask_domain` (
  `mask_domain_id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(200) DEFAULT NULL,
  `account_id_fk` int(11) DEFAULT NULL,
  `masking_type` char(1) DEFAULT '1',
  `esp_server_id_fk` int(11) DEFAULT NULL,
  `listed_count` int(11) DEFAULT NULL,
  `listed_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`mask_domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `misc_options`
--

CREATE TABLE IF NOT EXISTS `misc_options` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id_fk` int(11) DEFAULT NULL,
  `option_type` varchar(10) DEFAULT NULL,
  `option_type_id` varchar(20) DEFAULT NULL,
  `option_value` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_unique` (`account_id_fk`,`option_type`,`option_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `notification_email`
--

CREATE TABLE IF NOT EXISTS `notification_email` (
  `notification_email_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id_fk` int(11) DEFAULT NULL,
  `notification_email_label` varchar(500) DEFAULT NULL,
  `notification_email_address` varchar(500) DEFAULT NULL,
  `notification_email_subject` varchar(500) DEFAULT NULL,
  `notification_email_html` text,
  `notification_text_content` text,
  `notification_smtp_id_fk` text,
  `notification_sender_info` char(1) DEFAULT NULL,
  `notification_from_name` varchar(500) DEFAULT NULL,
  `notification_from_email` varchar(500) DEFAULT NULL,
  `notification_bounce_email` varchar(500) DEFAULT NULL,
  `notification_reply_email` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`notification_email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `notification_smtp`
--

CREATE TABLE IF NOT EXISTS `notification_smtp` (
  `notification_smtp_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id_fk` int(11) NOT NULL,
  `smtp_host` varchar(200) NOT NULL,
  `smtp_username` varchar(200) NOT NULL,
  `smtp_password` varchar(200) NOT NULL,
  `smtp_port` int(11) NOT NULL,
  `smtp_label` varchar(200) NOT NULL,
  `smtp_fromname` varchar(200) DEFAULT NULL,
  `smtp_fromemail` varchar(200) NOT NULL,
  `smtp_bounceemail` varchar(200) NOT NULL,
  `smtp_replyemail` varchar(200) NOT NULL,
  `dkim_selector` varchar(200) DEFAULT NULL,
  `smtp_mask_domain` int(11) DEFAULT NULL,
  `smtp_group_name` varchar(200) DEFAULT NULL,
  `smtp_group_id` int(11) DEFAULT NULL,
  `smtp_status` char(1) DEFAULT '1',
  `listed_count` int(11) DEFAULT NULL,
  `listed_datetime` datetime DEFAULT NULL,
  `smtp_pool` varchar(300) DEFAULT NULL,
  `smtp_protocol` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`notification_smtp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pmta_bounce`
--

CREATE TABLE IF NOT EXISTS `pmta_bounce` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `pmta_ip` varchar(30) DEFAULT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `counter` int(11) DEFAULT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pmta_config`
--

CREATE TABLE IF NOT EXISTS `pmta_config` (
  `pmta_config_id` int(11) NOT NULL AUTO_INCREMENT,
  `placeholder` varchar(20) DEFAULT NULL,
  `configuration` text,
  `esp_server_id_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`pmta_config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pmta_log_files`
--

CREATE TABLE IF NOT EXISTS `pmta_log_files` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `esp_server_ip` varchar(30) DEFAULT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `counter` int(11) DEFAULT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pmta_server`
--

CREATE TABLE IF NOT EXISTS `pmta_server` (
  `pmta_server_id` int(11) NOT NULL,
  `pmta_server_ip` varchar(20) DEFAULT NULL,
  `pmta_server_login` varchar(50) DEFAULT NULL,
  `pmta_server_password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`pmta_server_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `schedule_campaign`
--

CREATE TABLE IF NOT EXISTS `schedule_campaign` (
  `schedule_campaign_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id_fk` int(11) NOT NULL,
  `campaign_label` varchar(200) DEFAULT NULL,
  `list_id_fk` text NOT NULL,
  `email_campaign_id_fk` text NOT NULL,
  `smtp_id_fk` text NOT NULL,
  `dkim_id_fk` int(11) DEFAULT NULL,
  `sch_datetime` datetime NOT NULL,
  `total` int(11) DEFAULT '0',
  `sent` int(11) NOT NULL DEFAULT '0',
  `last_run` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `sender_info` int(11) NOT NULL,
  `sch_fromname` varchar(200) DEFAULT NULL,
  `sch_fromemail` varchar(200) NOT NULL,
  `sch_bounceemail` varchar(200) NOT NULL,
  `sch_replyemail` varchar(200) NOT NULL,
  `opened` int(11) DEFAULT '0',
  `unique_opened` int(11) DEFAULT '0',
  `clicked` int(11) DEFAULT '0',
  `unique_clicked` int(11) DEFAULT '0',
  `show_unsub` char(1) DEFAULT NULL,
  `del_status` char(1) DEFAULT '0',
  `mask_domain_id_fk` varchar(500) DEFAULT NULL,
  `masked_domain` int(11) DEFAULT NULL,
  `adk_campaign_id_fk` varchar(500) DEFAULT NULL,
  `campaign_type` char(1) DEFAULT '1',
  `bounced` int(11) NOT NULL DEFAULT '0',
  `unsubscribed` int(11) NOT NULL DEFAULT '0',
  `error` varchar(300) DEFAULT NULL,
  `split_campaign_id_fk` varchar(500) DEFAULT NULL,
  `split_winner_campaign_id` int(11) DEFAULT NULL,
  `split_winner_campaign_time` datetime DEFAULT NULL,
  `supress_domain_count` int(11) NOT NULL DEFAULT '0',
  `unsubscribed_count` int(11) NOT NULL DEFAULT '0',
  `bounced_count` int(11) NOT NULL DEFAULT '0',
  `suppress_email_count` int(11) NOT NULL DEFAULT '0',
  `spamed_count` int(11) NOT NULL DEFAULT '0',
  `thread` varchar(32) DEFAULT NULL,
  `custom_options` text,
  `track_open` char(1) DEFAULT '1',
  `track_click` char(1) DEFAULT '1',
  `st_status` char(1) DEFAULT '0',
  `no_of_threads` int(11) NOT NULL DEFAULT '1',
  `smtp_sequence` char(1) DEFAULT '1',
  `hourly_limit` int(11) DEFAULT NULL,
  `notification_email` varchar(300) DEFAULT NULL,
  `esp_setup_id_fk` varchar(500) DEFAULT NULL,
  `list_type` int(11) DEFAULT NULL,
  `segment_id_fk` text,
  `count_totals` char(1) DEFAULT '0',
  `start_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`schedule_campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `schedule_campaign_thread`
--

CREATE TABLE IF NOT EXISTS `schedule_campaign_thread` (
  `schedule_campaign_thread_id` int(11) NOT NULL AUTO_INCREMENT,
  `schedule_campaign_id_fk` int(11) NOT NULL,
  `first` int(11) DEFAULT '0',
  `last` int(11) DEFAULT '0',
  `processed` int(11) DEFAULT '0',
  `thread_status` char(1) DEFAULT '0',
  `process_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`schedule_campaign_thread_id`),
  UNIQUE KEY `campaign_id_first` (`schedule_campaign_id_fk`,`first`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `schedule_evergreen_campaign`
--

CREATE TABLE IF NOT EXISTS `schedule_evergreen_campaign` (
  `schedule_evergreen_campaign_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id_fk` int(11) NOT NULL,
  `campaign_label` varchar(200) DEFAULT NULL,
  `list_id_fk` text NOT NULL,
  `email_campaign_id_fk` text NOT NULL,
  `smtp_id_fk` text NOT NULL,
  `dkim_id_fk` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT '0',
  `sent` int(11) NOT NULL DEFAULT '0',
  `last_run` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '0=Inactive,1=Active,',
  `sender_info` int(11) NOT NULL,
  `sch_fromname` varchar(200) DEFAULT NULL,
  `sch_fromemail` varchar(200) NOT NULL,
  `sch_bounceemail` varchar(200) NOT NULL,
  `sch_replyemail` varchar(200) NOT NULL,
  `opened` int(11) DEFAULT '0',
  `unique_opened` int(11) DEFAULT '0',
  `clicked` int(11) DEFAULT '0',
  `unique_clicked` int(11) DEFAULT '0',
  `show_unsub` char(1) DEFAULT NULL,
  `del_status` char(1) DEFAULT '0',
  `mask_domain_id_fk` varchar(500) DEFAULT NULL,
  `masked_domain` int(11) DEFAULT NULL,
  `adk_campaign_id_fk` varchar(500) DEFAULT NULL,
  `campaign_type` char(1) DEFAULT '1',
  `bounced` int(11) NOT NULL DEFAULT '0',
  `unsubscribed` int(11) NOT NULL DEFAULT '0',
  `error` varchar(300) DEFAULT NULL,
  `split_campaign_id_fk` varchar(500) DEFAULT NULL,
  `split_winner_campaign_id` int(11) DEFAULT NULL,
  `split_winner_campaign_time` datetime DEFAULT NULL,
  `supress_domain_count` int(11) NOT NULL DEFAULT '0',
  `unsubscribed_count` int(11) NOT NULL DEFAULT '0',
  `bounced_count` int(11) NOT NULL DEFAULT '0',
  `suppress_email_count` int(11) NOT NULL DEFAULT '0',
  `spamed_count` int(11) NOT NULL DEFAULT '0',
  `thread` varchar(32) DEFAULT NULL,
  `custom_options` text,
  `track_open` char(1) DEFAULT '1',
  `track_click` char(1) DEFAULT '1',
  `st_status` char(1) DEFAULT '0',
  `no_of_threads` int(11) NOT NULL DEFAULT '1',
  `smtp_sequence` char(1) DEFAULT '1',
  `hourly_limit` int(11) DEFAULT NULL,
  `notification_email` varchar(300) DEFAULT NULL,
  `esp_setup_id_fk` varchar(500) DEFAULT NULL,
  `list_type` int(11) DEFAULT NULL,
  `segment_id_fk` text,
  `count_totals` char(1) DEFAULT '0',
  `start_datetime` datetime DEFAULT NULL,
  `schedule_on` varchar(32) DEFAULT NULL COMMENT 'weekly,monthly,hours,minutes',
  `schedule_value` int(2) DEFAULT '0' COMMENT 'value accourding to schedule_on',
  `sch_time` time NOT NULL,
  `last_executed_at` datetime DEFAULT NULL,
  `next_execution_at` datetime DEFAULT NULL,
  PRIMARY KEY (`schedule_evergreen_campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `schedule_segment`
--

CREATE TABLE IF NOT EXISTS `schedule_segment` (
  `schedule_segment_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id_fk` int(11) DEFAULT NULL,
  `params` text,
  `total` int(11) DEFAULT '0',
  `processed` int(11) DEFAULT '0',
  `copied_moved` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  `last_run` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `file_name` varchar(100) DEFAULT NULL,
  `segment_group_id` int(11) DEFAULT '0',
  `segment_label` varchar(100) DEFAULT NULL,
  `action` varchar(10) DEFAULT NULL,
  `action_list_id_fk` int(11) DEFAULT NULL,
  `parent_segment_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`schedule_segment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `segment_group`
--

CREATE TABLE IF NOT EXISTS `segment_group` (
  `segment_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id_fk` int(11) NOT NULL,
  `segment_group_label` varchar(100) NOT NULL,
  `parent_group_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`segment_group_id`),
  UNIQUE KEY `NewIndex1` (`account_id_fk`,`segment_group_label`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `segment_unsubscribe`
--

CREATE TABLE IF NOT EXISTS `segment_unsubscribe` (
  `segment_unsubscribe_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `segment_id_fk` int(11) NOT NULL,
  `email_id_fk` bigint(11) NOT NULL,
  PRIMARY KEY (`segment_unsubscribe_id`),
  UNIQUE KEY `email_segment` (`email_id_fk`,`segment_id_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sender_score`
--

CREATE TABLE IF NOT EXISTS `sender_score` (
  `sender_score_id` int(11) NOT NULL AUTO_INCREMENT,
  `smtp_id_fk` int(11) DEFAULT NULL,
  `ip` varchar(25) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `listed_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`sender_score_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sending_log`
--

CREATE TABLE IF NOT EXISTS `sending_log` (
  `sending_log_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `account_id_fk` int(11) DEFAULT NULL,
  `send_time` datetime DEFAULT NULL,
  `orig` varchar(200) DEFAULT NULL,
  `rcpt` varchar(200) DEFAULT NULL,
  `dsnstatus` varchar(200) DEFAULT NULL,
  `dsndiag` varchar(500) DEFAULT NULL,
  `destinationip` varchar(20) DEFAULT NULL,
  `dlvsize` int(11) DEFAULT NULL,
  `jobid` varchar(200) DEFAULT NULL,
  `bounce_code` varchar(10) DEFAULT NULL,
  `bounce_reason` varchar(250) DEFAULT NULL,
  `bounce_detail` text,
  `src_mta` varchar(100) DEFAULT NULL,
  `type` char(1) DEFAULT NULL,
  `esp_server_id_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`sending_log_id`),
  KEY `account_id_fk` (`account_id_fk`),
  KEY `send_time` (`send_time`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sent_logs`
--

CREATE TABLE IF NOT EXISTS `sent_logs` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `sent_date` date DEFAULT NULL,
  `sent` int(11) DEFAULT NULL,
  `opened` int(11) DEFAULT NULL,
  `clicked` int(11) DEFAULT NULL,
  `account_id_fk` int(11) DEFAULT NULL,
  `bounced` int(11) DEFAULT NULL,
  `delivered` int(11) DEFAULT NULL,
  `complaints` int(11) DEFAULT NULL,
  `esp_server_id_fk` int(1) DEFAULT '0',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE IF NOT EXISTS `setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id_fk` int(11) DEFAULT NULL,
  `email_send_cron` int(11) DEFAULT '5',
  `bounce_process_cron` int(11) DEFAULT '120',
  `maintinance_cron` int(11) DEFAULT '360',
  `email_adk_send_cron` int(11) DEFAULT '15',
  `email_split_send_cron` int(11) DEFAULT '15',
  `fbl_cron` int(11) DEFAULT '360',
  `autoresponder_send_cron` int(11) DEFAULT '30',
  `blacklist_cron` int(11) DEFAULT '1440',
  `trigger_cron` int(11) DEFAULT '15',
  `current_server_ip` varchar(20) DEFAULT NULL,
  `def_timezone` varchar(6) DEFAULT '+00:00',
  `list_view_type` char(5) NOT NULL DEFAULT '0',
  `ftp_host` varchar(100) DEFAULT NULL,
  `ftp_username` varchar(100) DEFAULT NULL,
  `ftp_password` varchar(100) DEFAULT NULL,
  `ftp_port` varchar(10) DEFAULT NULL,
  `monthly_limit` int(11) DEFAULT NULL,
  `daily_limit` int(11) DEFAULT NULL,
  `hourly_limit` int(11) DEFAULT NULL,
  `geo_tracking` char(1) DEFAULT '1',
  `delete_stats` int(11) DEFAULT '30',
  `esp_smtp_host` varchar(100) DEFAULT NULL,
  `esp_smtp_port` varchar(10) DEFAULT NULL,
  `esp_server_ip` varchar(20) DEFAULT NULL,
  `esp_server_port` varchar(10) DEFAULT NULL,
  `esp_server_username` varchar(50) DEFAULT NULL,
  `esp_server_password` varchar(50) DEFAULT NULL,
  `esp_admin_iplist` tinytext,
  `esp_spf_domain` varchar(100) DEFAULT NULL,
  `esp_cname_selector` varchar(50) DEFAULT NULL,
  `esp_cname_domain` varchar(100) DEFAULT NULL,
  `backup_settings` text,
  `esp_server_pref` int(11) DEFAULT NULL,
  `notification_email` varchar(200) DEFAULT NULL,
  `last_backup` datetime DEFAULT NULL,
  `no_of_threads` int(11) DEFAULT '1',
  `thread_size` int(11) DEFAULT '-1',
  `unsubscribe_email` varchar(100) DEFAULT NULL,
  `segment_cron` int(11) DEFAULT '120',
  `valid_ips` varchar(500) DEFAULT NULL,
  `latest_version` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `smtp`
--

CREATE TABLE IF NOT EXISTS `smtp` (
  `smtp_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id_fk` int(11) NOT NULL,
  `smtp_host` varchar(200) NOT NULL,
  `smtp_username` varchar(200) NOT NULL,
  `smtp_password` varchar(200) NOT NULL,
  `smtp_port` int(11) NOT NULL,
  `smtp_label` varchar(200) NOT NULL,
  `smtp_fromname` varchar(200) DEFAULT NULL,
  `smtp_fromemail` varchar(200) NOT NULL,
  `smtp_bounceemail` varchar(200) NOT NULL,
  `smtp_replyemail` varchar(200) NOT NULL,
  `dkim_selector` varchar(200) DEFAULT NULL,
  `smtp_mask_domain` int(11) DEFAULT NULL,
  `smtp_group_name` varchar(200) DEFAULT NULL,
  `smtp_group_id` int(11) DEFAULT NULL,
  `smtp_status` char(1) DEFAULT '1',
  `listed_count` int(11) DEFAULT NULL,
  `listed_datetime` datetime DEFAULT NULL,
  `smtp_pool` varchar(300) DEFAULT NULL,
  `smtp_protocol` varchar(5) DEFAULT NULL,
  `esp_server_id_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`smtp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `smtp_group`
--

CREATE TABLE IF NOT EXISTS `smtp_group` (
  `smtp_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id_fk` int(11) DEFAULT NULL,
  `group_label` varchar(200) DEFAULT NULL,
  `parent_smtp_id_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`smtp_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `spin_tag`
--

CREATE TABLE IF NOT EXISTS `spin_tag` (
  `spin_tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id_fk` int(11) DEFAULT NULL,
  `spin_tag_label` varchar(100) DEFAULT NULL,
  `word_list` text,
  PRIMARY KEY (`spin_tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `stats`
--

CREATE TABLE IF NOT EXISTS `stats` (
  `statsi_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id_fk` int(11) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `stats_data` text,
  PRIMARY KEY (`statsi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sub_user_role`
--

CREATE TABLE IF NOT EXISTS `sub_user_role` (
  `sub_user_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id_fk` int(11) DEFAULT NULL,
  `role_label` varchar(100) DEFAULT NULL,
  `role_permissions` text,
  `role_access` text,
  PRIMARY KEY (`sub_user_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `support_role`
--

CREATE TABLE IF NOT EXISTS `support_role` (
  `support_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_label` varchar(100) DEFAULT NULL,
  `role_permissions` text,
  `role_access` text,
  PRIMARY KEY (`support_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `support_user`
--

CREATE TABLE IF NOT EXISTS `support_user` (
  `support_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(300) NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` char(1) NOT NULL DEFAULT '1',
  `def_timezone` varchar(6) NOT NULL DEFAULT '+00:00',
  `permission` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`support_user_id`),
  UNIQUE KEY `user_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `suppression_list`
--

CREATE TABLE IF NOT EXISTS `suppression_list` (
  `suppression_list_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(300) DEFAULT NULL,
  `account_id_fk` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `list_id_fk` varchar(20) DEFAULT 'global',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`suppression_list_id`),
  UNIQUE KEY `email_account` (`email`,`account_id_fk`,`list_id_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `suppress_domain`
--

CREATE TABLE IF NOT EXISTS `suppress_domain` (
  `suppress_domain_id` int(11) NOT NULL AUTO_INCREMENT,
  `suppress_domain` varchar(200) DEFAULT NULL,
  `date_added` timestamp NULL DEFAULT NULL,
  `account_id_fk` int(11) DEFAULT NULL,
  `list_id_fk` varchar(20) DEFAULT 'global',
  PRIMARY KEY (`suppress_domain_id`),
  UNIQUE KEY `NewIndex1` (`suppress_domain`,`account_id_fk`,`list_id_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `suppress_ip`
--

CREATE TABLE IF NOT EXISTS `suppress_ip` (
  `suppress_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `suppress_ip` varchar(200) DEFAULT NULL,
  `date_added` timestamp NULL DEFAULT NULL,
  `account_id_fk` int(11) DEFAULT NULL,
  `list_id_fk` varchar(20) DEFAULT 'global',
  `min_ip` varchar(20) DEFAULT NULL,
  `max_ip` varchar(20) DEFAULT NULL,
  `min_ip_int` bigint(11) DEFAULT NULL,
  `max_ip_int` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`suppress_ip_id`),
  UNIQUE KEY `NewIndex1` (`suppress_ip`,`account_id_fk`,`list_id_fk`),
  KEY `max_ip_int` (`max_ip_int`),
  KEY `min_ip_int` (`min_ip_int`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `temp_email_list`
--

CREATE TABLE IF NOT EXISTS `temp_email_list` (
  `email_list_id` int(11) NOT NULL AUTO_INCREMENT,
  `list_id_fk` int(11) NOT NULL,
  `email` varchar(500) NOT NULL,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `unsubscribed` tinyint(4) NOT NULL DEFAULT '0',
  `bounced` tinyint(4) NOT NULL DEFAULT '0',
  `unssubcribed_date` datetime NOT NULL,
  `bounced_date` datetime NOT NULL,
  `create_date` timestamp NULL DEFAULT NULL,
  `format` char(1) NOT NULL DEFAULT 'h',
  `confirmation_status` tinyint(1) NOT NULL DEFAULT '1',
  `birth_date` date NOT NULL,
  `city` varchar(200) NOT NULL,
  `country` varchar(200) NOT NULL,
  `post_code` varchar(15) NOT NULL,
  `state` varchar(100) NOT NULL,
  `mobile` varchar(40) NOT NULL,
  `phone` varchar(40) NOT NULL,
  `fax` int(11) NOT NULL,
  `title` varchar(5) NOT NULL,
  `account_id_fk` int(11) NOT NULL,
  `tag` varchar(200) NOT NULL,
  PRIMARY KEY (`email_list_id`),
  UNIQUE KEY `tag` (`email`(20),`tag`(20))
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `triggers`
--

CREATE TABLE IF NOT EXISTS `triggers` (
  `triggers_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id_fk` int(11) DEFAULT NULL,
  `trigger_label` varchar(200) DEFAULT NULL,
  `trigger_type` int(11) DEFAULT NULL,
  `list_type` char(1) DEFAULT NULL,
  `list_id_fk` varchar(1000) DEFAULT NULL,
  `clicked_links` text,
  `custom_field_id_fk` int(11) DEFAULT NULL,
  `campaign_type` char(1) DEFAULT NULL,
  `email_campaign_id_fk` varchar(1000) DEFAULT NULL,
  `trigger_date` date DEFAULT NULL,
  `rules` text,
  `trigger_action_type` int(11) DEFAULT NULL,
  `trigger_action_count` int(11) DEFAULT NULL,
  `trigger_action_frequency` varchar(10) DEFAULT NULL,
  `trigger_action_interval` int(11) DEFAULT NULL,
  `send_email_campaign_id_fk` int(11) DEFAULT NULL,
  `sender_info` char(1) DEFAULT NULL,
  `add_list_id_fk` varchar(300) DEFAULT NULL,
  `perform_action` char(20) DEFAULT NULL,
  `trigger_status` char(1) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `smtp_id_fk` varchar(1000) DEFAULT NULL,
  `segment_id_fk` varchar(1000) DEFAULT NULL,
  `from_name` varchar(300) DEFAULT NULL,
  `from_email` varchar(300) DEFAULT NULL,
  `bounce_email` varchar(300) DEFAULT NULL,
  `reply_email` varchar(300) DEFAULT NULL,
  `sent` int(11) NOT NULL DEFAULT '0',
  `bounced` int(11) NOT NULL DEFAULT '0',
  `unsubscribed` int(11) NOT NULL DEFAULT '0',
  `opens` int(11) NOT NULL DEFAULT '0',
  `unique_opens` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `unique_clicks` int(11) NOT NULL DEFAULT '0',
  `spamed_count` int(11) NOT NULL DEFAULT '0',
  `track_clicks` char(1) NOT NULL DEFAULT '0',
  `track_opens` char(1) NOT NULL DEFAULT '0',
  `status` char(1) NOT NULL,
  `notification_email` char(1) DEFAULT NULL,
  `move_duplication` char(1) DEFAULT NULL,
  `copy_duplication` char(1) DEFAULT NULL,
  PRIMARY KEY (`triggers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `triggers_click_tracking`
--

CREATE TABLE IF NOT EXISTS `triggers_click_tracking` (
  `click_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `email_id_fk` bigint(11) DEFAULT NULL,
  `triggers_id_fk` int(11) DEFAULT NULL,
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
  KEY `campaign_id_fk` (`triggers_id_fk`),
  KEY `click_link` (`click_link`),
  KEY `click_country` (`click_country`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `triggers_open_tracking`
--

CREATE TABLE IF NOT EXISTS `triggers_open_tracking` (
  `open_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `email_id_fk` bigint(11) DEFAULT NULL,
  `open_ip` varchar(15) DEFAULT NULL,
  `open_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `open_country` varchar(100) DEFAULT NULL,
  `triggers_id_fk` int(11) DEFAULT NULL,
  `open_region` varchar(50) DEFAULT NULL,
  `open_city` varchar(50) DEFAULT NULL,
  `open_zip` varchar(15) DEFAULT NULL,
  `browser` varchar(20) DEFAULT NULL,
  `os` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`open_id`),
  KEY `campaign_id_fk` (`triggers_id_fk`),
  KEY `email_id_fk` (`email_id_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `trigger_logs`
--

CREATE TABLE IF NOT EXISTS `trigger_logs` (
  `triggers_id_fk` int(11) NOT NULL,
  `running_time` datetime NOT NULL,
  PRIMARY KEY (`triggers_id_fk`,`running_time`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_account`
--

CREATE TABLE IF NOT EXISTS `user_account` (
  `user_account_id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(300) NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `address1` varchar(200) NOT NULL,
  `address2` varchar(200) NOT NULL,
  `city` varchar(200) NOT NULL,
  `state` varchar(100) NOT NULL,
  `post_code` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `user_role_id_fk` int(11) NOT NULL,
  `primary_admin` char(1) NOT NULL DEFAULT '0',
  `status` char(1) NOT NULL DEFAULT '1',
  `list_view_type` char(5) NOT NULL DEFAULT '0',
  `def_timezone` varchar(6) NOT NULL DEFAULT '+00:00',
  `esp_server_id_fk` int(11) DEFAULT NULL,
  `api_token` varchar(100) DEFAULT NULL,
  `list_tree_state` text,
  `app_type` char(1) DEFAULT '2',
  `deactivate_smtp` char(1) DEFAULT '0',
  `parent_account_id_fk` int(11) NOT NULL DEFAULT '-1',
  `notification_emails` text COMMENT 'one email perline',
  `notification_schedule_on` varchar(8) DEFAULT NULL COMMENT 'monthly,weekly',
  `notification_schedule_value` tinyint(4) DEFAULT '0' COMMENT 'value accourding to schedule on',
  `notification_smtp_id_fk` tinyint(4) DEFAULT '0',
  `notification_next_execution_at` date DEFAULT NULL,
  `notification_last_execution_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_account_id`),
  UNIQUE KEY `user_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE IF NOT EXISTS `user_role` (
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_label` varchar(100) DEFAULT NULL,
  `role_permissions` text,
  `role_access` text,
  `no_of_contact_lists` int(11) NOT NULL DEFAULT '0',
  `no_of_contacts` int(11) NOT NULL DEFAULT '0',
  `no_of_smtp` int(11) NOT NULL DEFAULT '0',
  `monthly_limit` int(11) NOT NULL DEFAULT '0',
  `daily_limit` int(11) NOT NULL DEFAULT '0',
  `hourly_limit` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_role_access`
--

CREATE TABLE IF NOT EXISTS `user_role_access` (
  `user_role_id_fk` int(11) NOT NULL,
  `entity_type` varchar(20) NOT NULL,
  `entity_id` int(11) NOT NULL,
  PRIMARY KEY (`user_role_id_fk`,`entity_type`,`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_token`
--

CREATE TABLE IF NOT EXISTS `user_token` (
  `user_id_fk` int(11) NOT NULL,
  `token` varchar(100) NOT NULL,
  `expire_time` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id_fk`,`token`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `web_form`
--

CREATE TABLE IF NOT EXISTS `web_form` (
  `web_form_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id_fk` int(11) DEFAULT NULL,
  `web_form_label` varchar(200) DEFAULT NULL,
  `form_type` char(1) DEFAULT NULL,
  `double_opt_in` char(1) DEFAULT NULL,
  `thankyou_email` char(1) DEFAULT NULL,
  `campaign_format` char(1) DEFAULT NULL,
  `use_captcha` char(1) DEFAULT NULL,
  `list_id_fk` varchar(500) DEFAULT NULL,
  `list_fields` varchar(500) DEFAULT NULL,
  `field_list` varchar(500) DEFAULT NULL,
  `confirmation_option` char(1) DEFAULT NULL,
  `confirmation_text` longblob,
  `confirmation_url` varchar(200) DEFAULT NULL,
  `confirmation_smtp_id_fk` varchar(300) DEFAULT NULL,
  `confirmation_from_name` varchar(200) DEFAULT NULL,
  `confirmation_from_email` varchar(200) DEFAULT NULL,
  `confirmation_reply_email` varchar(200) DEFAULT NULL,
  `confirmation_subject` varchar(200) DEFAULT NULL,
  `confirmation_email_html` longblob,
  `confirmation_email_text` longblob,
  `thankyou_option` char(1) DEFAULT NULL,
  `thankyou_text` longblob,
  `thankyou_url` varchar(200) DEFAULT NULL,
  `thankyou_smtp_id_fk` varchar(300) DEFAULT NULL,
  `thankyou_from_name` varchar(200) DEFAULT NULL,
  `thankyou_from_email` varchar(200) DEFAULT NULL,
  `thankyou_reply_email` varchar(200) DEFAULT NULL,
  `thankyou_subject` varchar(200) DEFAULT NULL,
  `thankyou_email_html` longblob,
  `thankyou_email_text` longblob,
  `error_option` char(1) DEFAULT NULL,
  `error_text` longblob,
  `error_url` varchar(500) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `email_new_contacts` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`web_form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `white_label`
--

CREATE TABLE IF NOT EXISTS `white_label` (
  `white_label_id` int(11) NOT NULL AUTO_INCREMENT,
  `logo_path` varchar(200) DEFAULT NULL,
  `favicon_path` varchar(200) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `hide_footer` char(1) DEFAULT NULL,
  `footer_html` text,
  `account_id_fk` int(11) DEFAULT NULL,
  `subscriber_label` varchar(200) DEFAULT NULL,
  `email_required` char(1) NOT NULL DEFAULT '1',
  `tag_line` varchar(300) DEFAULT NULL,
  `footer_licensed` varchar(300) DEFAULT NULL,
  `footer_powered` varchar(300) DEFAULT NULL,
  `meta_title` varchar(500) DEFAULT NULL,
  `meta_keywords` varchar(500) DEFAULT NULL,
  `meta_description` varchar(500) DEFAULT NULL,
  `background_path` varchar(200) DEFAULT NULL,
  `header_message` varchar(1000) DEFAULT NULL,
  `tracking_script` text,
  PRIMARY KEY (`white_label_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

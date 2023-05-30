
/* Create table in target */
CREATE TABLE `credit_addons`(
	`credit_addons_id` int(11) NOT NULL  auto_increment , 
	`account_id_fk` int(11) NULL  , 
	`credits` int(11) NULL  , 
	`month_date` date NULL  , 
	`assign_date` date NULL  , 
	PRIMARY KEY (`credit_addons_id`) 
) ENGINE=InnoDB DEFAULT CHARSET='latin1';


/* Alter table in target */
ALTER TABLE `email_list` 
	CHANGE `title` `title` varchar(100)  COLLATE latin1_swedish_ci NOT NULL after `fax`, COMMENT='';

/* Alter table in target */
ALTER TABLE `email_template` 
	CHANGE `template_group` `template_group` varchar(200)  COLLATE utf8_general_ci NULL after `email_template_id`, 
	CHANGE `template_label` `template_label` varchar(200)  COLLATE utf8_general_ci NULL after `template_group`, 
	CHANGE `html_content` `html_content` longtext  COLLATE utf8_general_ci NULL after `template_label`, 
	CHANGE `text_content` `text_content` longtext  COLLATE utf8_general_ci NULL after `html_content`, 
	CHANGE `template_preview` `template_preview` longtext  COLLATE utf8_general_ci NULL after `text_content`, ENGINE=InnoDB, COMMENT='', DEFAULT CHARSET='utf8';

/* Alter table in target */
ALTER TABLE `list` 
	CHANGE `remove_duplicates` `remove_duplicates` char(1)  COLLATE latin1_swedish_ci NOT NULL DEFAULT '0' after `fetch_geo_details`, COMMENT='';

/* Alter table in target */
ALTER TABLE `list_visible_field` 
	CHANGE `visible_field_id_fk` `visible_field_id_fk` int(11)   NOT NULL first, 
	CHANGE `list_id_fk` `list_id_fk` int(11)   NOT NULL after `visible_field_id_fk`, ENGINE=InnoDB, COMMENT='';



/* Alter table in target */
ALTER TABLE `schedule_campaign` 
	CHANGE `list_id_fk` `list_id_fk` text  COLLATE latin1_swedish_ci NOT NULL after `campaign_label`, 
	CHANGE `email_campaign_id_fk` `email_campaign_id_fk` text  COLLATE latin1_swedish_ci NOT NULL after `list_id_fk`, 
	CHANGE `smtp_id_fk` `smtp_id_fk` text  COLLATE latin1_swedish_ci NOT NULL after `email_campaign_id_fk`, 
	CHANGE `no_of_threads` `no_of_threads` int(11)   NOT NULL DEFAULT '1' after `st_status`, COMMENT='';

/* Alter table in target */
ALTER TABLE `schedule_campaign_thread` 
	CHANGE `schedule_campaign_id_fk` `schedule_campaign_id_fk` int(11)   NOT NULL after `schedule_campaign_thread_id`, ENGINE=InnoDB, COMMENT='';

/* Alter table in target */
ALTER TABLE `segment_group` 
	CHANGE `account_id_fk` `account_id_fk` int(11)   NOT NULL after `segment_group_id`, 
	CHANGE `segment_group_label` `segment_group_label` varchar(100)  COLLATE latin1_swedish_ci NOT NULL after `account_id_fk`, 
	CHANGE `parent_group_id` `parent_group_id` int(11)   NOT NULL DEFAULT '0' after `segment_group_label`, ENGINE=InnoDB, COMMENT='';

/* Alter table in target */
ALTER TABLE `segment_unsubscribe` 
	CHANGE `segment_id_fk` `segment_id_fk` int(11)   NOT NULL after `segment_unsubscribe_id`, 
	CHANGE `email_id_fk` `email_id_fk` bigint(11)   NOT NULL after `segment_id_fk`, ENGINE=InnoDB, COMMENT='';




/* Alter table in target */
ALTER TABLE `triggers` 
	CHANGE `sent` `sent` int(11)   NOT NULL DEFAULT '0' after `reply_email`, 
	CHANGE `bounced` `bounced` int(11)   NOT NULL DEFAULT '0' after `sent`, 
	CHANGE `unsubscribed` `unsubscribed` int(11)   NOT NULL DEFAULT '0' after `bounced`, 
	CHANGE `opens` `opens` int(11)   NOT NULL DEFAULT '0' after `unsubscribed`, 
	CHANGE `unique_opens` `unique_opens` int(11)   NOT NULL DEFAULT '0' after `opens`, 
	CHANGE `clicks` `clicks` int(11)   NOT NULL DEFAULT '0' after `unique_opens`, 
	CHANGE `unique_clicks` `unique_clicks` int(11)   NOT NULL DEFAULT '0' after `clicks`, 
	CHANGE `spamed_count` `spamed_count` int(11)   NOT NULL DEFAULT '0' after `unique_clicks`, COMMENT='';

/* Alter table in target */
ALTER TABLE `user_account` 
	CHANGE `parent_account_id_fk` `parent_account_id_fk` int(11)   NOT NULL DEFAULT '-1' after `deactivate_smtp`, COMMENT='';
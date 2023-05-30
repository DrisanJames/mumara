/* Alter table in target */
ALTER TABLE `activity_log` 
	CHANGE `activity_log_id` `activity_log_id` int(11)   NOT NULL auto_increment first, ENGINE=InnoDB, COMMENT='';

/* Alter table in target */
ALTER TABLE `credit_addons` ENGINE=InnoDB, COMMENT='';

/* Alter table in target */
ALTER TABLE `custom_header` ENGINE=InnoDB, COMMENT='';

/* Alter table in target */
ALTER TABLE `email_fields` 
	CHANGE `email_id_fk` `email_id_fk` bigint(11)   NOT NULL first, COMMENT='';

/* Alter table in target */
ALTER TABLE `email_log` 
	CHANGE `log_id` `log_id` bigint(11)   NOT NULL auto_increment first, 
	CHANGE `email_id_fk` `email_id_fk` bigint(11)   NULL after `message_id`, COMMENT='';

/* Alter table in target */
ALTER TABLE `email_open_tracking` 
	CHANGE `open_id` `open_id` bigint(11)   NOT NULL auto_increment first, 
	CHANGE `email_id_fk` `email_id_fk` bigint(11)   NULL after `open_id`, COMMENT='';

/* Alter table in target */
ALTER TABLE `email_spam_tracking` 
	CHANGE `spam_id` `spam_id` bigint(11)   NOT NULL auto_increment first, 
	CHANGE `email_id_fk` `email_id_fk` bigint(11)   NULL after `spam_id`, 
	ADD COLUMN `email_address` varchar(200)  COLLATE latin1_swedish_ci NULL after `feedback_loop_id_fk`, COMMENT='';

/* Alter table in target */
ALTER TABLE `email_template` 
	CHANGE `template_group` `template_group` varchar(200)  COLLATE utf8_general_ci NULL after `email_template_id`, 
	CHANGE `template_label` `template_label` varchar(200)  COLLATE utf8_general_ci NULL after `template_group`, 
	CHANGE `html_content` `html_content` longtext  COLLATE utf8_general_ci NULL after `template_label`, 
	CHANGE `text_content` `text_content` longtext  COLLATE utf8_general_ci NULL after `html_content`, 
	CHANGE `template_preview` `template_preview` longtext  COLLATE utf8_general_ci NULL after `text_content`, ENGINE=InnoDB, COMMENT='', DEFAULT CHARSET='utf8';

/* Alter table in target */
ALTER TABLE `misc_options` ENGINE=InnoDB, COMMENT='';

/* Alter table in target */
ALTER TABLE `schedule_campaign` 
	ADD COLUMN `count_totals` char(1)  COLLATE latin1_swedish_ci NULL DEFAULT '0' after `segment_id_fk`;

ALTER TABLE `schedule_campaign`  
	ADD COLUMN `start_datetime` datetime   NULL after `count_totals`, COMMENT='';

/* Alter table in target */
ALTER TABLE `segment_group` 
	CHANGE `account_id_fk` `account_id_fk` int(11)   NOT NULL after `segment_group_id`, 
	CHANGE `segment_group_label` `segment_group_label` varchar(100)  COLLATE latin1_swedish_ci NOT NULL after `account_id_fk`, 
	CHANGE `parent_group_id` `parent_group_id` int(11)   NOT NULL DEFAULT '0' after `segment_group_label`, ENGINE=InnoDB, COMMENT='';

/* Alter table in target */
ALTER TABLE `segment_unsubscribe` 
	CHANGE `segment_unsubscribe_id` `segment_unsubscribe_id` bigint(11)   NOT NULL auto_increment first, 
	CHANGE `segment_id_fk` `segment_id_fk` int(11)   NOT NULL after `segment_unsubscribe_id`, 
	CHANGE `email_id_fk` `email_id_fk` bigint(11)   NOT NULL after `segment_id_fk`;

/* Alter table in target */
ALTER TABLE `sending_log` 
	CHANGE `sending_log_id` `sending_log_id` bigint(11)   NOT NULL auto_increment first, COMMENT='';

/* Alter table in target */
ALTER TABLE `setting` 
	ADD COLUMN `latest_version` decimal(10,2)   NULL after `valid_ips`, COMMENT='';

/* Alter table in target */
ALTER TABLE `sub_user_role` ENGINE=InnoDB, COMMENT='';

/* Alter table in target */
ALTER TABLE `suppress_ip` ENGINE=InnoDB, COMMENT='';

/* Alter table in target */
ALTER TABLE `triggers_click_tracking` 
	CHANGE `click_id` `click_id` bigint(11)   NOT NULL auto_increment first, 
	CHANGE `email_id_fk` `email_id_fk` bigint(11)   NULL after `click_id`, COMMENT='';

/* Alter table in target */
ALTER TABLE `triggers_open_tracking` 
	CHANGE `open_id` `open_id` bigint(11)   NOT NULL auto_increment first, 
	CHANGE `email_id_fk` `email_id_fk` bigint(11)   NULL after `open_id`, COMMENT='';

/* Alter table in target */
ALTER TABLE `user_account` 
	CHANGE `parent_account_id_fk` `parent_account_id_fk` int(11)   NOT NULL DEFAULT '-1' after `deactivate_smtp`, COMMENT='';
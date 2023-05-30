/* Alter table in target */
ALTER TABLE `activity_log` 
	CHANGE `activity_log_id` `activity_log_id` bigint(11)   NOT NULL auto_increment first, COMMENT='';

/* Alter table in target */
ALTER TABLE `autoresponder_open_tracking` 
	CHANGE `open_id` `open_id` bigint(11)   NOT NULL auto_increment first, 
	CHANGE `email_id_fk` `email_id_fk` bigint(11)   NULL after `open_id`, COMMENT='';

/* Alter table in target */
ALTER TABLE `cronjob_log` 
	CHANGE `log_id` `log_id` bigint(11)   NOT NULL auto_increment first, COMMENT='';

/* Alter table in target */
ALTER TABLE `email_click_tracking` 
	CHANGE `click_id` `click_id` bigint(11)   NOT NULL auto_increment first, 
	CHANGE `email_id_fk` `email_id_fk` bigint(11)   NULL after `click_id`, COMMENT='';

/* Alter table in target */
ALTER TABLE `email_fields` 
	CHANGE `email_id_fk` `email_id_fk` bigint(11)   NOT NULL first, COMMENT='';

/* Alter table in target */
ALTER TABLE `email_list` 
	CHANGE `email_list_id` `email_list_id` bigint(11)   NOT NULL auto_increment first, COMMENT='';

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
	CHANGE `email_id_fk` `email_id_fk` bigint(11)   NULL after `spam_id`, COMMENT='';

/* Alter table in target */
ALTER TABLE `links` 
	CHANGE `link_id` `link_id` bigint(11)   NOT NULL auto_increment first, COMMENT='';

/* Alter table in target */
ALTER TABLE `segment_unsubscribe` 
	CHANGE `segment_unsubscribe_id` `segment_unsubscribe_id` bigint(11)   NOT NULL auto_increment first, 
	CHANGE `email_id_fk` `email_id_fk` bigint(11)   NOT NULL after `segment_id_fk`, 
	DROP KEY `email_segment`, add UNIQUE KEY `email_segment`(`email_id_fk`,`segment_id_fk`), COMMENT='';

/* Alter table in target */
ALTER TABLE `sending_log` 
	CHANGE `sending_log_id` `sending_log_id` bigint(11)   NOT NULL auto_increment first, COMMENT='';

/* Alter table in target */
ALTER TABLE `triggers_click_tracking` 
	CHANGE `click_id` `click_id` bigint(11)   NOT NULL auto_increment first, 
	CHANGE `email_id_fk` `email_id_fk` bigint(11)   NULL after `click_id`, COMMENT='';

/* Alter table in target */
ALTER TABLE `triggers_open_tracking` 
	CHANGE `open_id` `open_id` bigint(11)   NOT NULL auto_increment first, 
	CHANGE `email_id_fk` `email_id_fk` bigint(11)   NULL after `open_id`, COMMENT='';
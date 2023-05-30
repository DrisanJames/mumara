
/* Alter table in target */
ALTER TABLE `activity_log` 
	CHANGE `activity_log_id` `activity_log_id` int(11)   NOT NULL auto_increment first, 
	ADD COLUMN `entity_label` varchar(100)  COLLATE latin1_swedish_ci NULL after `activity_time`, COMMENT='';

/* Alter table in target */
ALTER TABLE `schedule_segment` 
	ADD COLUMN `parent_segment_id` int(11)   NOT NULL DEFAULT '0' after `action_list_id_fk`, COMMENT='';
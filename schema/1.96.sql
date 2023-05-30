/* Create table in target */
CREATE TABLE `activity_log`(
	`activity_log_id` int(11) NOT NULL  auto_increment , 
	`account_id_fk` int(11) NULL  , 
	`entity` varchar(30) COLLATE latin1_swedish_ci NULL  , 
	`entity_id` int(11) NULL  , 
	`activity_type` varchar(10) COLLATE latin1_swedish_ci NULL  , 
	`activity_time` datetime NULL  , 
	PRIMARY KEY (`activity_log_id`) 
) ENGINE=InnoDB DEFAULT CHARSET='latin1';


/* Alter table in target */
ALTER TABLE `suppression_list` 
	ADD COLUMN `create_time` datetime   NULL after `list_id_fk`, COMMENT='';
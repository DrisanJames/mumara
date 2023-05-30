/* Create table in target */
CREATE TABLE `misc_options`(
	`option_id` int(11) NOT NULL  auto_increment , 
	`account_id_fk` int(11) NULL  , 
	`option_type` varchar(10) COLLATE latin1_swedish_ci NULL  , 
	`option_type_id` varchar(20) COLLATE latin1_swedish_ci NULL  , 
	`option_value` varchar(20) COLLATE latin1_swedish_ci NULL  , 
	PRIMARY KEY (`option_id`) , 
	UNIQUE KEY `option_unique`(`account_id_fk`,`option_type`,`option_type_id`) 
) ENGINE=InnoDB DEFAULT CHARSET='latin1';

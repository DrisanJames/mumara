ALTER TABLE `schedule_segment` 
	ADD COLUMN `action_list_id_fk` int(11)   NULL after `action`, COMMENT=''; 
ALTER TABLE `email_spam_tracking` 
	ADD COLUMN `email_address` varchar(200)  COLLATE latin1_swedish_ci NULL after `feedback_loop_id_fk`, COMMENT='';
ALTER TABLE `esp_setup` ADD COLUMN `last_rechecked_at` DATETIME DEFAULT NULL NULL AFTER `smtp_type`;
ALTER TABLE `esp_setup` ADD COLUMN `last_wizard_step` INT(1) DEFAULT 1 NULL AFTER `last_rechecked_at`; 
ALTER TABLE `sent_logs` ADD COLUMN `esp_server_id_fk` INT(1) DEFAULT 0 NULL AFTER `complaints`;
ALTER TABLE `triggers` ADD COLUMN `segment_id_fk` VARCHAR(1000) NULL AFTER `smtp_id_fk`;
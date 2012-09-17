-- ALTER TABLE subject MODIFY COLUMN sex ENUM('unknown','male','female','unspecified') NOT NULL DEFAULT 'unknown';
-- ALTER TABLE subject MODIFY COLUMN handedness ENUM('unknown','right','left','equal') NOT NULL DEFAULT 'unknown';
-- ALTER TABLE subject MODIFY COLUMN smoking ENUM('unknown','no','yes') NOT NULL DEFAULT 'unknown';
-- ALTER TABLE subject MODIFY COLUMN alcohol_abuse ENUM('unknown','no','yes') NOT NULL DEFAULT 'unknown';
-- ALTER TABLE subject MODIFY COLUMN drug_abuse ENUM('unknown','no','yes') NOT NULL DEFAULT 'unknown';
-- ALTER TABLE subject MODIFY COLUMN medication ENUM('unknown','no','yes') NOT NULL DEFAULT 'unknown';
-- ALTER TABLE subject MODIFY COLUMN visual_impairment ENUM('unknown','no','yes','corrected') NOT NULL DEFAULT 'unknown';
-- ALTER TABLE subject MODIFY COLUMN heart_impairment ENUM('unknown','no','yes','pacemaker') NOT NULL DEFAULT 'unknown';
-- ALTER TABLE subject MODIFY COLUMN sex smallint UNSIGNED NOT NULL DEFAULT '0';
-- ALTER TABLE subject MODIFY COLUMN handedness smallint UNSIGNED NOT NULL DEFAULT '0';
-- ALTER TABLE subject MODIFY COLUMN smoking smallint UNSIGNED NOT NULL DEFAULT '0';
-- ALTER TABLE subject MODIFY COLUMN alcohol_abuse smallint UNSIGNED NOT NULL DEFAULT '0';
-- ALTER TABLE subject MODIFY COLUMN drug_abuse smallint UNSIGNED NOT NULL DEFAULT '0';
-- ALTER TABLE subject MODIFY COLUMN medication smallint UNSIGNED NOT NULL DEFAULT '0';
-- ALTER TABLE subject MODIFY COLUMN visual_impairment smallint UNSIGNED NOT NULL DEFAULT '0';
-- ALTER TABLE subject MODIFY COLUMN heart_impairment smallint UNSIGNED NOT NULL DEFAULT '0';
INSERT INTO subject (Name) VALUES ('Test');
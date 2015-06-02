-- Takes 7 seconds to execute
-- Created on July 2, 2013
-- @author: Franck for ALFA, MIT lab: franck.dernoncourt@gmail.com
-- Feature 109: difference of Feature 9 (Average number of attempts)
-- 130600 rows

set @current_date = cast('0000-00-00 00:00:00' as datetime);

INSERT INTO `moocdb`.user_longitudinal_feature_values(longitudinal_feature_id, user_id, longitudinal_feature_week, longitudinal_feature_value,date_of_extraction)


SELECT 109,
	features.user_id,
	features2.longitudinal_feature_week,
	-- features.longitudinal_feature_value,
	-- features2.longitudinal_feature_value,
	features2.longitudinal_feature_value  / features.longitudinal_feature_value,
    @current_date
FROM `moocdb`.user_longitudinal_feature_values AS features,
	`moocdb`.user_longitudinal_feature_values AS features2

WHERE
	-- same user
	features.user_id = features2.user_id
	-- 2 successive weeks
	AND features.longitudinal_feature_week = features2.longitudinal_feature_week - 1
	-- we are only interested in feature 9
	AND features.longitudinal_feature_id = 9
	AND features2.longitudinal_feature_id = 9

-- LIMIT 1000

-- Script creates a stored procedure ComputeAverageWeightedScoreForUsers
-- computes and store the average weighted score for all students
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUsers;
DELIMITER $$
CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN
    UPDATE users,
	(SELECT users.id, SUM(score * weight) / SUM(weight) AS w_avg
	 FROM users
	 JOIN corrections ON users.id = corrections.user_id
	 JOIN projects ON projects.id = corrections.project_id
	 GROUP BY users.id)
    AS weighted_avg
    SET users.average_score = weighted_avg.w_avg
    WHERE users.id = weighted_avg.id;
END
$$
DELIMITER ;

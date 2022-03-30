-- //-------------------------------//     <--- I use these comment lines to distinguish the blocks that I used to implement queries.

-- 1. Average Female Salary
SELECT AVG(P.daily_salary) AS average_female_salary
FROM PARTICIPANT P
WHERE gender = 'F';

-- //-------------------------------//

-- 2. Coaching Report
SELECT C.first_name, C.last_name, C.idCoach, IF(T.amount IS NULL, 0, T.amount) AS contenders_amount
FROM COACH C LEFT JOIN (SELECT coachID, COUNT(*) AS amount
                        FROM CONTENDER
                        GROUP BY coachID ) T
ON C.idCoach = T.coachID;

-- //-------------------------------//

CREATE VIEW Coach_Id_And_Month AS   -- Creates a temporary table that holds the id and month of attendance of each coach.
    SELECT coachID, MONTHNAME(show_date) as attendance_month
    FROM COACH_IN_SHOW C JOIN TV_SHOW T ON C.showID = T.idShow;

-- 3. Coach Monthly Attendance Report
SELECT T1.coachID, T1.march, T2.april      -- Main SELECT query.
FROM
    (SELECT coachID, COUNT(*) AS march
     FROM Coach_Id_And_Month
     WHERE attendance_month = 'March'
     GROUP BY coachID) T1
JOIN
    (SELECT coachID, COUNT(*) AS april
     FROM Coach_Id_And_Month
     WHERE attendance_month = 'April'
     GROUP BY coachID) T2
ON T1.coachID = T2.coachID;

DROP VIEW Coach_Id_And_Month; -- Drops the view, because it is redundant after the query.

-- //-------------------------------//

CREATE VIEW Contender_And_Salary AS
    SELECT C.stage_name AS stage_name, SUM(daily_salary) AS total_salary
    FROM PARTICIPANT P JOIN CONTENDER C ON C.idContender = P.contenderID    -- I create a temporary table (view) which stores the name and the total salary of each contender.
    GROUP BY C.idContender;                                                 -- I do this, because in the actual query (below) I am using the same table twice.
                                                                            -- In my opinion, this achieves the same result and makes the code more readable.
-- 4. Most Expensive Contender
SELECT T.stage_name as highest_paid_contender
FROM Contender_And_Salary T
WHERE T.total_salary = (SELECT MAX(T2.total_salary)
                        FROM Contender_And_Salary T2);

DROP VIEW Contender_And_Salary;  -- Drop the table, because it is not useful anymore.

-- //-------------------------------//

CREATE VIEW Coach_Id_And_Month AS                -- Creates a temporary table that holds the id and month of attendance of each coach.
    SELECT coachID, MONTHNAME(show_date) as attendance_month
    FROM COACH_IN_SHOW C JOIN TV_SHOW T ON C.showID = T.idShow;

CREATE VIEW Contender_Id_And_Month AS
    SELECT contenderID, MONTHNAME(show_date) as attendance_month
    FROM CONTENDER_IN_SHOW C JOIN TV_SHOW T on C.showID = T.idShow;

CREATE VIEW Participant_Id_And_Month AS          -- Creates a temporary table that hold the id and month of attendance of each participant.
    SELECT idParticipant, attendance_month
    FROM PARTICIPANT P, Contender_Id_And_Month T
    WHERE T.contenderID = P.contenderID;

CREATE VIEW Coach_Times_March AS           -- Count how many tv shows every coach participated in.
    SELECT T.coachID, COUNT(*) AS march
    FROM Coach_Id_And_Month T
    WHERE attendance_month = 'March'
    GROUP BY T.coachID;

CREATE VIEW Participant_Times_March AS      -- Count how many tv shows every participant was in.
    SELECT idParticipant, COUNT(*) AS march
    FROM Participant_Id_And_Month
    WHERE attendance_month = 'March'
    GROUP BY idParticipant;

-- I create a view for the final table in order to add the total amount of money as an additional column.

CREATE VIEW Final_Table AS
    SELECT C.first_name, C.last_name, IF(T.march IS NULL, 0, T.march) AS march_attendancies, C.daily_salary, C.daily_salary * T.march AS march_salary, 'C' AS position
    FROM COACH C, Coach_Times_March T
    WHERE C.idCoach = T.coachID

UNION

    SELECT P.first_name, P.last_name, IF(T.march IS NULL, 0, T.march) AS march_attendancies, P.daily_salary, P.daily_salary * T.march AS march_salary, 'P' AS position
    FROM PARTICIPANT P, Participant_Times_March T
    WHERE P.idParticipant = T.idParticipant;

-- 5. March Payment Report
SELECT Final_Table.*, T.total_sum AS total_to_pay
FROM Final_Table, (SELECT SUM(march_salary) AS total_sum      -- The main SELECT query.
                   FROM Final_Table) T;

DROP VIEW Final_Table;
DROP VIEW Coach_Id_And_Month;
DROP VIEW Contender_Id_And_Month;
DROP VIEW Participant_Id_And_Month;    -- Drops all the views.
DROP VIEW Coach_Times_March;
DROP VIEW Participant_Times_March;

-- //-------------------------------//

CREATE VIEW T AS
    SELECT P.contenderID AS id, COUNT(*) AS count, C.performance_type AS type
    FROM PARTICIPANT P JOIN CONTENDER C ON P.contenderID = C.idContender
    GROUP BY id;

-- 6. Well Formed Groups!
SELECT IF (T3.V = 0, 'True', 'False') AS no_violations
FROM(SELECT COUNT(*) AS V
     FROM (SELECT
          (CASE WHEN (type = 'Individual' AND count > 1) THEN 1             -- T2 temporary table gives each contender a value 0 or 1 based on whether they violate the rule or not.
                WHEN (type = 'Individual' AND count = 1) THEN 0             -- T3 counts how many contenders violate the rule (how many 1s are in the table).
                WHEN (type = 'Group' AND count > 1) THEN 0                  -- If there are 0 1s it means that there are no violations.
                WHEN (type = 'Group' AND count = 1) THEN 1 END) AS violates_amount
           FROM T) AS T2
     WHERE violates_amount = 1) AS T3;

DROP VIEW T;

-- //-------------------------------//

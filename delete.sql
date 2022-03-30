CREATE VIEW Contender_And_Salary AS
    SELECT C.stage_name AS stage_name, SUM(hourly_salary) AS total_salary
    FROM PARTICIPANT P JOIN CONTENDER C ON C.idContender = P.contenderID    -- I create a temporary table (view) which stores the name and the total salary of each contender.
    GROUP BY C.idContender;                                                 -- I do this, because in the actual query (below) I am using the same table twice.
                                                                            -- In my opinion, this achieves the same result and makes the code more readable.
                                                                            -- I use the exact same principle that I used in the 4th exercise of part 2 except that the aggregate function now is MIN.


DELETE FROM CONTENDER
WHERE stage_name IN (SELECT T.stage_name as lowest_paid_contender
                     FROM Contender_And_Salary T
                     WHERE T.total_salary = (SELECT MIN(T2.total_salary)
                                             FROM Contender_And_Salary T2));

DROP VIEW Contender_And_Salary;

-- I don't need to worry about deleting the data of all the participants that belong to the contender, because I set that all the participants should be removed if the contender is removed (CASCADE).

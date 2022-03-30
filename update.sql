-- PART 1

UPDATE PARTICIPANT
    SET daily_salary = daily_salary/4;

ALTER TABLE PARTICIPANT
    CHANGE daily_salary hourly_salary DOUBLE(6,2);

-- Do everything the same for the COACHES

UPDATE COACH
    SET daily_salary = daily_salary/4;

ALTER TABLE COACH
    CHANGE daily_salary hourly_salary DOUBLE(6,2);



-- PART 2

ALTER TABLE COACH_IN_SHOW
    ADD COLUMN arrival_time TIME,
    ADD COLUMN departure_time TIME;

ALTER TABLE CONTENDER_IN_SHOW
    ADD COLUMN arrival_time TIME,
    ADD COLUMN departure_time TIME;

UPDATE CONTENDER_IN_SHOW C JOIN TV_SHOW T ON C.showID = T.idShow   -- I use a join to get a table with all the values and then use those values to update arrival and departure times.
    SET C.arrival_time = ADDTIME(T.start_time, '-01:00:00'),
        C.departure_time = ADDTIME(T.end_time, '01:00:00');


UPDATE COACH_IN_SHOW C JOIN TV_SHOW T ON C.showID = T.idShow
    SET C.arrival_time = ADDTIME(T.start_time, '-01:00:00'),
        C.departure_time = ADDTIME(T.end_time, '01:00:00');

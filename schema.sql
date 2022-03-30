CREATE TABLE COACH (
    first_name VARCHAR(15) NOT NULL,
    last_name VARCHAR(15) NOT NULL,
    birth_date DATE NOT NULL,
    idCoach CHAR(5) PRIMARY KEY,
    phone_number CHAR (13),
    daily_salary DOUBLE(6,2),                      -- I assume that a coach cannot earn more than 9999.99 pounds per day.
    gender CHAR(1) NOT NULL,

    CONSTRAINT phoneFormatCheck CHECK (phone_number LIKE '+44%'),           -- UK format. +44 and 10 digits.
    CONSTRAINT phoneLengthCheck CHECK (CHAR_LENGTH(phone_number) = 13),     -- Check if the phone number is of the valid UK phone number format.
    CONSTRAINT coachGenderSymbolCheck CHECK (gender = 'M' OR gender = 'F' OR gender = 'O' ),  -- M - male, F - female, O - other.
    CONSTRAINT olderThan18 CHECK (birth_date <= '2003-03-06' AND birth_date > '1799-12-31') -- I assume that a coach must be at least 18 years old and cannot be older than 221.
);

CREATE TABLE CONTENDER (
    stage_name VARCHAR(25) UNIQUE NOT NULL,    -- I assume that every group or person that performs in the show must have a unique, recognisable stage name.
    performance_type VARCHAR(10) NOT NULL,
    idContender CHAR(5) PRIMARY KEY,
    coachID CHAR(5),

    FOREIGN KEY (coachID) REFERENCES COACH(idCoach) ON UPDATE CASCADE ON DELETE SET NULL,

    CONSTRAINT contenderTypeCheck CHECK (performance_type = 'Individual' OR performance_type = 'Group')  -- Check if the type is appropriate
);

CREATE TABLE PARTICIPANT (
    first_name VARCHAR(10) NOT NULL,
    last_name VARCHAR(10) NOT NULL,
    birth_date DATE NOT NULL,
    idParticipant CHAR(5) PRIMARY KEY,
    phone_number  CHAR (13),
    daily_salary DOUBLE(6,2),      -- I assume that a participant cannot get more than 9999.99 pounds per day.
    gender CHAR(1) NOT NULL,
    contenderID CHAR(5),

    FOREIGN KEY (contenderID) REFERENCES CONTENDER(idContender) ON UPDATE CASCADE ON DELETE CASCADE,

    CONSTRAINT UK_phoneFormatCheck CHECK (phone_number LIKE '+44%'),  -- UK format. +44 and 10 digits.
    CONSTRAINT UK_phoneLengthCheck CHECK (CHAR_LENGTH(phone_number) = 13),     -- Check if the phone number is of the valid UK phone number format. I wanted to implement that only numbers can be entered, but couldn't come up with a solution.
    CONSTRAINT participantGenderSymbolCheck CHECK (gender = 'M' OR gender = 'F' OR gender = 'O' ),   -- M - male, F - female, O - other.
    CONSTRAINT olderThan16 CHECK (birth_date <= '2005-03-06' AND birth_date > '1799-12-31') -- According to the https://eurovision.tv/about/rules a person must be at least 16 years old to participate. I assume that the same rules apply for this show as well.
);

CREATE TABLE TV_SHOW(
    location VARCHAR(50) NOT NULL,
    show_date DATE NOT NULL,
    idShow CHAR(3) PRIMARY KEY,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,

    CONSTRAINT durationCheck CHECK (TIMEDIFF(end_time, start_time) = '02:00:00')  -- To make sure that the official time of the show is exactly 2 hours.
);

CREATE TABLE COACH_IN_SHOW (
    coachID CHAR(5),
    showID CHAR(5),

    PRIMARY KEY (coachID, showID),

    FOREIGN KEY (coachID) REFERENCES COACH(idCoach) ON UPDATE CASCADE ON DELETE CASCADE,       -- If either a show or a contender seizes to exist, the entry is deleted.
    FOREIGN KEY (showID) REFERENCES  TV_SHOW(idShow) ON UPDATE CASCADE ON DELETE CASCADE       -- In the case of an update, the tuple is updated.
);

CREATE TABLE CONTENDER_IN_SHOW (
    contenderID CHAR(5),
    showID CHAR(5),

    PRIMARY KEY (contenderID, showID),

    FOREIGN KEY (contenderID) REFERENCES CONTENDER(idContender) ON UPDATE CASCADE ON DELETE CASCADE,  -- If either a show or a coach does not exist anymore, the entry is deleted.
    FOREIGN KEY (showID) REFERENCES  TV_SHOW(idShow) ON UPDATE CASCADE ON DELETE CASCADE              -- In the case of an update, the tuple is updated.
);

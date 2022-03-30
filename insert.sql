INSERT INTO COACH VALUES ('Arnold', 'Schwarzenegger', '1947-07-30', 50001, '+447690865490', 1500.00, 'M'),
                         ('Bob', 'Marley', '1945-02-06', 50002, '+442021347653', 899.99, 'M'),
                         ('Jim', 'Morrison', '1943-12-08', 50003, '+445254387956', 700.05, 'M'),
                         ('Amy', 'Winehouse', '1983-09-14', 50004, '+445678932564', 1200.78, 'F'),
                         ('Bobby', 'Coach', '1995-10-18', 58888, '+448888888888', 150.99, 'M');    -- The default coach


INSERT INTO CONTENDER VALUES ('Magic drums', 'Individual', 00001, 50001),
                             ('The three musketeers', 'Group', 00002, 50003),
                             ('Dance and cry', 'Group', 00003, 50002),
                             ('The wicked flute', 'Individual', 00004, 50004),
                             ('Local hope', 'Individual', 00005, 50003),
                             ('The bird man', 'Individual', 00006, 50004);

INSERT INTO PARTICIPANT VALUES ('John', 'Densmore', '1944-12-01', 70001, '+445678765654', 200.00, 'M', 00002),
                               ('Jimmy', 'Page', '1944-01-09', 70002, '+445678987624', 300.00, 'M', 00006),
                               ('Robby', 'Krieger', '1946-01-08', 70003, '+445632875472', 400.01, 'M', 00002),
                               ('Ray', 'Manzarek', '1939-02-12', 70004, '+445638903245', 700.56, 'M', 00002),
                               ('Jimi', 'Hendrix', '1942-11-27', 70005, '+442223334445', 1410.00, 'M', 00005),
                               ('John', 'Bonham', '1948-05-31', 70006, '+446969576969', 899.65, 'M', 00001),
                               ('Peter', 'Green', '1946-10-29', 70007, '+445656565758', 478.15, 'M', 00003),
                               ('Carlos', 'Santana', '1947-07-20', 70008, '+443232311312', 758.69, 'M', 00003 ),
                               ('Tony', 'Montana', '1965-08-18', 70009, '+444444444444', 2400.00, 'M', 00003),
                               ('Janis', 'Joplin', '1943-01-19', 70010, '+445768932463', 899.47, 'F', 00003),
                               ('Meg', 'White', '1974-12-10', 70011, '+445879632581', 1700.58, 'F', 00003);

INSERT INTO TV_SHOW VALUES ('The Garage, London', '2021-03-06', 001, '16:35:00', '18:35:00'),    -- March
                           ('Jazz Cafe, London', '2021-03-07', 002, '17:00:00', '19:00:00'),
                           ('The Garage, London', '2021-03-13', 003, '16:30:00', '18:30:00'),
                           ('Jazz Cafe, London', '2021-03-14', 004, '17:00:00', '19:00:00'),
                           ('The Garage, London', '2021-03-20', 005, '18:30:00', '20:30:00'),
                           ('Jazz Cafe, London', '2021-03-21', 006, '19:00:00', '21:00:00'),
                           ('The Garage, London', '2021-03-27', 007, '18:30:00', '20:30:00'),
                           ('Jazz Cafe, London', '2021-03-28', 008, '19:00:00', '21:00:00'),
                           ('Oasis, London', '2021-04-03', 009, '15:00:00', '17:00:00'),         -- April
                           ('Lafayette, London', '2021-04-04', 010, '16:00:00', '18:00:00'),
                           ('Oasis, London', '2021-04-10', 011, '15:00:00', '17:00:00'),
                           ('Lafayette, London', '2021-04-11', 012, '16:00:00', '18:00:00'),
                           ('Oasis, London', '2021-04-17', 013, '15:30:00', '17:30:00'),
                           ('Lafayette, London', '2021-04-18', 014, '13:00:00', '15:00:00'),
                           ('Oasis, London', '2021-04-24', 015, '15:30:00', '17:30:00'),
                           ('Lafayette, London', '2021-04-25', 016, '13:00:00', '15:00:00');

-- March
INSERT INTO CONTENDER_IN_SHOW VALUES (00001, 001), -- Show #1
                                     (00002, 001),
                                     (00004, 001);
INSERT INTO COACH_IN_SHOW VALUES (50001, 001),
                                 (50003, 001);


INSERT INTO CONTENDER_IN_SHOW VALUES (00003, 002), -- Show #2
                                     (00005, 002),
                                     (00006, 002);
INSERT INTO COACH_IN_SHOW VALUES (50002, 002),
                                 (50004, 002);

INSERT INTO CONTENDER_IN_SHOW VALUES (00005, 003), -- Show #3
                                     (00002, 003),
                                     (00006, 003);
INSERT INTO COACH_IN_SHOW VALUES (50001, 003),
                                 (50002, 003);


INSERT INTO CONTENDER_IN_SHOW VALUES (00003, 004), -- Show #4
                                     (00001, 004),
                                     (00004, 004);
INSERT INTO COACH_IN_SHOW VALUES (50003, 004),
                                 (50004, 004);

INSERT INTO CONTENDER_IN_SHOW VALUES (00001, 005), -- Show #5
                                     (00002, 005),
                                     (00004, 005);
INSERT INTO COACH_IN_SHOW VALUES (50001, 005),
                                 (50003, 005);


INSERT INTO CONTENDER_IN_SHOW VALUES (00003, 006), -- Show #6
                                     (00005, 006),
                                     (00006, 006);
INSERT INTO COACH_IN_SHOW VALUES (50002, 006),
                                 (50004, 006);

INSERT INTO CONTENDER_IN_SHOW VALUES (00005, 007), -- Show #7
                                     (00002, 007),
                                     (00006, 007);
INSERT INTO COACH_IN_SHOW VALUES (50001, 007),
                                 (50002, 007);


INSERT INTO CONTENDER_IN_SHOW VALUES (00003, 008), -- Show #8
                                     (00001, 008),
                                     (00004, 008);
INSERT INTO COACH_IN_SHOW VALUES (50003, 008),
                                 (50004, 008);

-- April
INSERT INTO CONTENDER_IN_SHOW VALUES (00001, 009), -- Show #9
                                     (00005, 009),
                                     (00006, 009);
INSERT INTO COACH_IN_SHOW VALUES (50002, 009),
                                 (50003, 009);

INSERT INTO CONTENDER_IN_SHOW VALUES (00003, 010), -- Show #10
                                     (00004, 010),
                                     (00002, 010);
INSERT INTO COACH_IN_SHOW VALUES (50001, 010),
                                 (50004, 010);

INSERT INTO CONTENDER_IN_SHOW VALUES (00001, 011), -- Show #11
                                     (00002, 011),
                                     (00003, 011);
INSERT INTO COACH_IN_SHOW VALUES (50001, 011),
                                 (50004, 011);

INSERT INTO CONTENDER_IN_SHOW VALUES (00004, 012), -- Show #12
                                     (00005, 012),
                                     (00006, 012);
INSERT INTO COACH_IN_SHOW VALUES (50003, 012),
                                 (50002, 012);

INSERT INTO CONTENDER_IN_SHOW VALUES (00001, 013), -- Show #13
                                     (00005, 013),
                                     (00006, 013);
INSERT INTO COACH_IN_SHOW VALUES (50002, 013),
                                 (50003, 013);

INSERT INTO CONTENDER_IN_SHOW VALUES (00003, 014), -- Show #14
                                     (00004, 014),
                                     (00002, 014);
INSERT INTO COACH_IN_SHOW VALUES (50001, 014),
                                 (50004, 014);

INSERT INTO CONTENDER_IN_SHOW VALUES (00001, 015), -- Show #15
                                     (00002, 015),
                                     (00003, 015);
INSERT INTO COACH_IN_SHOW VALUES (50001, 015),
                                 (50004, 015);

INSERT INTO CONTENDER_IN_SHOW VALUES (00004, 016), -- Show #16
                                     (00005, 016),
                                     (00006, 016);
INSERT INTO COACH_IN_SHOW VALUES (50003, 016),
                                 (50002, 016);

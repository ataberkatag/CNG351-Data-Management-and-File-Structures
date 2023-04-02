DROP TABLE InternshipCoordinator;
DROP TABLE FacultyEvaluation;
DROP TABLE Report;
DROP TABLE Internship;
DROP TABLE Supervisor;
DROP TABLE Company;
DROP TABLE Coordinator;
DROP TABLE Student;
DROP TABLE Faculty;


CREATE TABLE Faculty(
    faculty_id VARCHAR2(20) NOT NULL,
    name VARCHAR2(10) NOT NULL,
    surname VARCHAR2(10) NOT NULL,
    tel NUMBER NOT NULL,
    email CHAR(50) NOT NULL,
    username CHAR(20) NOT NULL,
    start_year DATE,
    department_code VARCHAR2(3) NOT NULL,
    current_title VARCHAR(20) NOT NULL,
    PRIMARY KEY(faculty_id)
);

CREATE TABLE Student(
    student_id VARCHAR2(5) NOT NULL,
    name VARCHAR2(20) NOT NULL, 
    surname VARCHAR2(10) NOT NULL,
    tel NUMBER NOT NULL,
    email CHAR(50) NOT NULL,
    username CHAR(20) NOT NULL,
    start_year VARCHAR2(4) NOT NULL,
    department_code VARCHAR2(3) NOT NULL,
    current_semester VARCHAR2(20) NOT NULL,
    PRIMARY KEY(student_id)
);

CREATE TABLE Coordinator(
    coordinator_id VARCHAR2(5) NOT NULL,
    position_duration NUMBER NOT NULL,
    start_date DATE,
    PRIMARY KEY(coordinator_id),
    FOREIGN KEY(coordinator_id) REFERENCES Faculty(faculty_id)
);

CREATE TABLE Company(
    id VARCHAR2(10) NOT NULL,
    name VARCHAR2(50) NOT NULL,
    address VARCHAR2(50) NOT NULL,
    tel NUMBER NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE Supervisor(
    email VARCHAR2(60) NOT NULL,
    company_id VARCHAR2(10) NOT NULL,
    name VARCHAR2(20) NOT NULL,
    surname VARCHAR2(20) NOT NULL,
    tel NUMBER NOT NULL,
    PRIMARY KEY(email),
    FOREIGN KEY (company_id) REFERENCES Company(id)
);

CREATE TABLE Internship(
    internship_id VARCHAR2(20) NOT NULL,
    start_date DATE,
    end_date DATE,
    course_code NUMBER NOT NULL,
    status VARCHAR2(10) NOT NULL,
    semester VARCHAR2(10) NOT NULL,
    final_score NUMBER,
    supervisor_approval VARCHAR2(1) NOT NULL,
    supervisor_evaluation_date DATE,
    supervisor_evaluation_score NUMBER ,
    supervisor_email VARCHAR2(50) NOT NULL,
    student_id VARCHAR2(10) NOT NULL,
    PRIMARY KEY(internship_id),
    CONSTRAINT fk_supervisor FOREIGN KEY(supervisor_email) REFERENCES Supervisor(email),
    CONSTRAINT fk_student FOREIGN KEY(student_id) REFERENCES Student(student_id)
);

CREATE TABLE Report(
    report_id VARCHAR2(5) NOT NULL,
    report_name VARCHAR2(30) NOT NULL,
    report_size VARCHAR2(10) NOT NULL,
    internship_id VARCHAR2(10) NOT NULL,
    submission_date DATE,
    PRIMARY KEY(report_id),
    CONSTRAINT fk_internship FOREIGN KEY(internship_id) REFERENCES Internship(internship_id)
);

CREATE TABLE FacultyEvaluation(
    faculty VARCHAR2(10) NOT NULL,
    report VARCHAR2(10) NOT NULL,
    evaluation_date VARCHAR2(20) NOT NULL,
    score NUMBER NOT NULL,
    PRIMARY KEY(faculty, report, evaluation_date),
    CONSTRAINT fk_faculty FOREIGN KEY(faculty) REFERENCES Faculty(faculty_id),
    CONSTRAINT fk_report FOREIGN KEY(report) REFERENCES Report(report_id)
);

CREATE TABLE InternshipCoordinator(
    internship_id VARCHAR2(10) NOT NULL,
    coordinator_id VARCHAR2(20) NOT NULL,
    approval VARCHAR2(50) NOT NULL,
    PRIMARY KEY(internship_id, coordinator_id),
    CONSTRAINT fk_internship_con FOREIGN KEY (internship_id) REFERENCES Internship(internship_id),
    CONSTRAINT fk_coordinator FOREIGN KEY (coordinator_id) REFERENCES Coordinator(coordinator_id)
);


--FACULTY
Insert into Faculty (faculty_id, name, surname, email, username, tel, department_code, current_title, start_year) values ('2',   'Hobard',     'Seabright',    'hseabright1@godaddy.com', 'hseabright1', '905987349828', '355', 'Assist. Prof.', TO_DATE ('2017', 'YYYY'));
Insert into Faculty (faculty_id, name, surname, email, username, tel, department_code, current_title, start_year) values ('3',   'Shelly',     'Greendale',    'sgreendale2@booking.com', 'sgreendale2', '905839584983', '355', 'Prof. Dr.', TO_DATE ('2021', 'YYYY'));
Insert into Faculty (faculty_id, name, surname, email, username, tel, department_code, current_title, start_year) values ('4',   'Etienne',     'Mutlow',    'emutlow3@yahoo.co.jp', 'emutlow3', '905987298457', '356', 'Assist. Prof.', TO_DATE ('2015', 'YYYY'));
Insert into Faculty (faculty_id, name, surname, email, username, tel, department_code, current_title, start_year) values ('8',   'Jon',     'Standall',    'jstandall7@japanpost.jp', 'jstandall7', '905984752823', '357', 'Assist. Prof.', TO_DATE ('2018', 'YYYY'));
Insert into Faculty (faculty_id, name, surname, email, username, tel, department_code, current_title, start_year) values ('9',   'Man',     'Cathel',    'mcathel8@ask.com', 'mcathel8', '905487394238', '358', 'Prof.', TO_DATE ('2014', 'YYYY'));


--COORDINATOR
Insert into Coordinator(coordinator_id, position_duration, start_date) values ('2', '2', TO_DATE('2017', 'YYYY'));
Insert into Coordinator(coordinator_id, position_duration, start_date) values ('4', '3', TO_DATE('2021', 'YYYY'));
Insert into Coordinator(coordinator_id, position_duration, start_date) values ('8', '2', TO_DATE('2021', 'YYYY'));
Insert into Coordinator(coordinator_id, position_duration, start_date) values ('9', '4', TO_DATE('2020', 'YYYY'));

--STUDENT
INSERT into Student(student_id, name, surname, email, username, tel, department_code, start_year, current_semester) values ('1',	'Kaila',	'Lembrick',	'klembrick0@statcounter.com',	'klembrick0',	905123786543,	'355',	'2017', '20211');
INSERT into Student(student_id, name, surname, email, username, tel, department_code, start_year, current_semester) values ('2',	'Xena',	'Bosomworth',	'xbosomworth1@webs.com',	'xbosomworth1',	905548433215,	'355',	'2017', '20211');
INSERT into Student(student_id, name, surname, email, username, tel, department_code, start_year, current_semester) values ('4',	'Rhonda',	'Eyam',	'reyam5@dropbox.com',	'reyam5',	905459864324,	'356',	'2018', '20211');
INSERT into Student(student_id, name, surname, email, username, tel, department_code, start_year, current_semester) values ('6',	'Lonny',	'Koschek',	'lkoschek9@mail.ru',	'lkoschek9',	905791346658,	'357',	'2019', '20211');
INSERT into Student(student_id, name, surname, email, username, tel, department_code, start_year, current_semester) values ('7',	'Carroll',	'Laroze',	'clarozea@paginegialle.it',	'clarozea',	905686312791,	'357',	'2019', '20211');
INSERT into Student(student_id, name, surname, email, username, tel, department_code, start_year, current_semester) values ('10',	'Elizabet',	'Fabbro',	'efabbrod@123-reg.co.uk',	'efabbrod',	905398713843,	'358',	'2021', '20211');


--COMPANY
Insert into Company(id, name, address, tel)
            values('1','	Corwin, Murray and Gottlieb',	'527 Waubesa Junction',	54684323566);
Insert into Company(id, name, address, tel)
            values('2',	'Upton-Osinski',	'042 Stephen Alley',	54687651635);
Insert into Company(id, name, address, tel)
            values('5',	'Balistreri, Daugherty and Weber',	'3 Iowa Hill',	84685468466);
Insert into Company(id, name, address, tel)
            values('6',	'Dietrich-Marvin',	'7342 Tennessee Center',	35468684636);
Insert into Company(id, name, address, tel)
            values('7',	'Pollich Group',	'17798 Buell Drive',	59574675135);




--SUPERVISOR
Insert into Supervisor(email,	company_id,	name,	surname,	tel)
            values('aible0@istockphoto.com',	'1',	'Adriano',	'Ible',	56812379854);
Insert into Supervisor(email,	company_id,	name,	surname,	tel)
            values('jlancashire1@wiley.com',	'1',	'Jami',	'Lancashire',	46432135482);
Insert into Supervisor(email,	company_id,	name,	surname,	tel)
            values('emcmillian2@hibu.com',	'2',	'Elton',	'McMillian',	57786464688);
Insert into Supervisor(email,	company_id,	name,	surname,	tel)
            values('wespasa5@oracle.com',	'5',	'Wendall',	'Espasa',	24135435154);
Insert into Supervisor(email,	company_id,	name,	surname,	tel)
            values('mcaverhill6@ovh.net',	'5',	'Mitzi',	'Caverhill',	54654351355);

Insert into Supervisor(email,	company_id,	name,	surname,	tel)
            values('emadle7@hostgator.com',	'6',	'Elvira',	'Madle',	53513513535);



--INTERNSHIP
Insert into Internship(internship_id,	start_date,	end_date,	course_code,	status,	semester,	final_score,	supervisor_approval,	supervisor_evaluation_date,	supervisor_evaluation_score,	supervisor_email,	student_id)
            values('1',	TO_DATE('30/07/2018', 'DD/MM/YYYY'),	TO_DATE('30/09/2018', 'DD/MM/YYYY'),	3550300,	'complete',	'20183',	70,	'1',TO_DATE('30/10/2018', 'DD/MM/YYYY'),		50,	'aible0@istockphoto.com',	'1');
Insert into Internship(internship_id,	start_date,	end_date,	course_code,	status,	semester,	final_score,	supervisor_approval,	supervisor_evaluation_date,	supervisor_evaluation_score,	supervisor_email,	student_id)
            values('2',	TO_DATE('30/07/2019', 'DD/MM/YYYY'),	TO_DATE('30/09/2019', 'DD/MM/YYYY'),	3550400,	'complete',	'20193',	75,	'1',TO_DATE('30/10/2019', 'DD/MM/YYYY'),		70,	'emcmillian2@hibu.com',	'1');

Insert into Internship(internship_id,	start_date,	end_date,	course_code,	status,	semester,	final_score,	supervisor_approval,	supervisor_evaluation_date,	supervisor_evaluation_score,	supervisor_email,	student_id)
            values('3',	TO_DATE('30/04/2018', 'DD/MM/YYYY'),	TO_DATE('14/06/2018', 'DD/MM/YYYY'),	3550300,	'incomplete',	'20183',	NULL,	'0',NULL,		NULL,	'aible0@istockphoto.com',	'2');

Insert into Internship(internship_id,	start_date,	end_date,	course_code,	status,	semester,	final_score,	supervisor_approval,	supervisor_evaluation_date,	supervisor_evaluation_score,	supervisor_email,	student_id)
            values('4',	TO_DATE('30/07/2019', 'DD/MM/YYYY'),	TO_DATE('30/08/2019', 'DD/MM/YYYY'),	3550300,	'complete',	'20193',	70,	'1',TO_DATE('30/10/2019', 'DD/MM/YYYY'),		80,	'jlancashire1@wiley.com',	'2');

Insert into Internship(internship_id,	start_date,	end_date,	course_code,	status,	semester,	final_score,	supervisor_approval,	supervisor_evaluation_date,	supervisor_evaluation_score,	supervisor_email,	student_id)
            values('5',	TO_DATE('30/07/2019', 'DD/MM/YYYY'),	TO_DATE('30/10/2020', 'DD/MM/YYYY'),	3550400,	'complete',	'20203',	90,	'1',TO_DATE('13/11/2020', 'DD/MM/YYYY'),		100,	'wespasa5@oracle.com',	'2');
Insert into Internship(internship_id,	start_date,	end_date,	course_code,	status,	semester,	final_score,	supervisor_approval,	supervisor_evaluation_date,	supervisor_evaluation_score,	supervisor_email,	student_id)
            values('6',	TO_DATE('30/07/2019', 'DD/MM/YYYY'),	TO_DATE('30/09/2019', 'DD/MM/YYYY'),	3550300,	'complete',	'20193',	80,	'1',TO_DATE('15/10/2019', 'DD/MM/YYYY'),		70,	'emadle7@hostgator.com',	'4');
Insert into Internship(internship_id,	start_date,	end_date,	course_code,	status,	semester,	final_score,	supervisor_approval,	supervisor_evaluation_date,	supervisor_evaluation_score,	supervisor_email,	student_id)
            values('7',	TO_DATE('30/06/2020', 'DD/MM/YYYY'),	TO_DATE('30/07/2020', 'DD/MM/YYYY'),	3550400,	'incomplete',	'20203',	NULL,	'0',NULL,		NULL,	'aible0@istockphoto.com',	'4');
Insert into Internship(internship_id,	start_date,	end_date,	course_code,	status,	semester,	final_score,	supervisor_approval,	supervisor_evaluation_date,	supervisor_evaluation_score,	supervisor_email,	student_id)
            values('8',	TO_DATE('8.10.2020', 'DD.MM.YYYY'),	TO_DATE('9.10.2020', 'DD.MM.YYYY'),	3550400,	'failed',	'20203',	40,	'1',TO_DATE('10.10.2020', 'DD.MM.YYYY'),		30,	'wespasa5@oracle.com',	'4');
Insert into Internship(internship_id,	start_date,	end_date,	course_code,	status,	semester,	final_score,	supervisor_approval,	supervisor_evaluation_date,	supervisor_evaluation_score,	supervisor_email,	student_id)
            values('9',	TO_DATE('15/06/2020', 'DD/MM/YYYY'),	TO_DATE('15/07/2020', 'DD/MM/YYYY'),	3550300,	'complete',	'20203',	85,	'1',TO_DATE('15/09/2020', 'DD/MM/YYYY'),		70,	'jlancashire1@wiley.com',	'6');


--REPORT
Insert into Report(report_id, report_name, report_size, internship_id , submission_date)
            values('1',	'report3001',	'567KB',	'1',	TO_DATE('30/11/2018', 'DD/MM/YYYY'));
Insert into Report(report_id, report_name, report_size, internship_id , submission_date)
            values('2',	'report3002',	'1MB',	'1',	TO_DATE('30/12/2018', 'DD/MM/YYYY'));
Insert into Report(report_id, report_name, report_size, internship_id , submission_date)
            values('3',	'report4001',	'6MB',	'2',	TO_DATE('30/11/2019', 'DD/MM/YYYY'));
Insert into Report(report_id, report_name, report_size, internship_id , submission_date)
            values('4',	'report1',	'1MG',	'4',	TO_DATE('15/12/2019', 'DD/MM/YYYY'));
Insert into Report(report_id, report_name, report_size, internship_id , submission_date)
            values('5',	'report_changed',	'1MG',	'4',	TO_DATE('15.12.2019', 'DD.MM.YYYY'));

Insert into Report(report_id, report_name, report_size, internship_id , submission_date)
            values('7',	'first',	'300KB',	'5',	TO_DATE('30.11.2020', 'DD.MM.YYYY'));
Insert into Report(report_id, report_name, report_size, internship_id , submission_date)
            values('8',	'second',	'500MB',	'5',	TO_DATE('1.01.2021', 'DD.MM.YYYY'));

Insert into Report(report_id, report_name, report_size, internship_id , submission_date)
            values('9',	'internship summary',	'456KB',	'6',	TO_DATE('30.12.2019', 'DD.MM.YYYY'));

Insert into Report(report_id, report_name, report_size, internship_id , submission_date)
            values('10',	'final report',	'5MB',	'8',	TO_DATE('30.11.2020', 'DD.MM.YYYY'));
Insert into Report(report_id, report_name, report_size, internship_id , submission_date)
            values('11',	'final report cahnged',	'6MG',	'8',	TO_DATE('30.12.2020', 'DD.MM.YYYY'));

Insert into Report(report_id, report_name, report_size, internship_id , submission_date)
            values('12',	'report',	'500KB',	'9',	TO_DATE('15.11.2020', 'DD.MM.YYYY'));


--FACULTYEVALUATION
Insert into FacultyEvaluation(faculty, report, evaluation_date, score)
            values('2',	'1',	'15/12/2018',	40);
Insert into FacultyEvaluation(faculty, report, evaluation_date, score)
            values('2',	'2',	'15/01/2019',	90);
Insert into FacultyEvaluation(faculty, report, evaluation_date, score)
            values('3',	'3',	'12.10.2019',	80);
Insert into FacultyEvaluation(faculty, report, evaluation_date, score)
            values('2',	'4',	'12.01.2019',	30);
Insert into FacultyEvaluation(faculty, report, evaluation_date, score)
            values('2',	'5',	'30/12/2019',	40);
Insert into FacultyEvaluation(faculty, report, evaluation_date, score)
            values('3',	'5',	'15/01/2020',	60);
Insert into FacultyEvaluation(faculty, report, evaluation_date, score)
            values('3',	'7',	'15/01/2021',	60);
Insert into FacultyEvaluation(faculty, report, evaluation_date, score)
            values('3',	'8',	'30/01/2021',	80);
Insert into FacultyEvaluation(faculty, report, evaluation_date, score)
            values('4',	'9',	'2.10.2020',	90);
Insert into FacultyEvaluation(faculty, report, evaluation_date, score)
            values('4',	'10',	'15/12/2020',	40);
Insert into FacultyEvaluation(faculty, report, evaluation_date, score)
            values('4',	'11',	'2.08.2021',	50);
Insert into FacultyEvaluation(faculty, report, evaluation_date, score)
            values('8',	'12',	'15/12/2020',	100);


--INTERSHIPCOORDINATOR
Insert into InternshipCoordinator(internship_id,	coordinator_id,	approval)
            values('1','2','1');
Insert into InternshipCoordinator(internship_id,	coordinator_id,	approval)
            values('2','2','1');
Insert into InternshipCoordinator(internship_id,	coordinator_id,	approval)
            values('3','2','0');
Insert into InternshipCoordinator(internship_id,	coordinator_id,	approval)
            values('4','2','1');
Insert into InternshipCoordinator(internship_id,	coordinator_id,	approval)
            values('5','2','1');
Insert into InternshipCoordinator(internship_id,	coordinator_id,	approval)
            values('6','4','1');
Insert into InternshipCoordinator(internship_id,	coordinator_id,	approval)
            values('7','4','0');
Insert into InternshipCoordinator(internship_id,	coordinator_id,	approval)
            values('8','4','0');
Insert into InternshipCoordinator(internship_id,	coordinator_id,	approval)
            values('9','8','1');

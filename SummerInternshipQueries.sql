--1
select student_id, name, surname, email from Student;

--2
select S.student_id, Su.email from Student S, Supervisor Su, Internship I where I.supervisor_email=Su.email and I.student_id=S.student_id and start_date>=TO_DATE('01/07/2019', 'DD/MM/YYYY') and end_date<=TO_DATE('30/07/2020', 'DD/MM/YYYY') and course_code='3550300';

--3
select S.name, S.surname from Student S, Internship I where I.student_id=S.student_id and semester='20183' and course_code='3550300';

--4
select S.name, S.surname, S.tel, C.name, C.address from Supervisor S, Company C where S.company_id=C.id;

--5
select report_name, FE.score, I.course_code from Report R, FacultyEvaluation FE, Internship I, Student S where R.report_id=FE.report and R.internship_id=I.internship_id and I.student_id=S.student_id and I.course_code='3550300' and name='Kaila' and surname='Lembrick';

--6
select AVG(score) from Report R, FacultyEvaluation FE, Internship I, Student S where R.report_id=FE.report and R.internship_id=I.internship_id and I.student_id=S.student_id and I.course_code='3550300' and S.student_id=2;


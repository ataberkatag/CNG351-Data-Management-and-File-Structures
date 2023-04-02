This assignment aims to help you revise SQL in general. It aims to help you revise both Data Definition and Data Manipulation Components of SQL.
In the first part, aims to help you revise especially Select, Aggregation and also Join operations. In the second part, 
you are given a schema and you need to create the tables, popu- late them and then query. 
Therefore, this second part aims to help you revise Create, Insert, Select and Join operations.





Schema-SecondBuy:
UserData (email, name, surname, tel, gold flag, gold start date, gold end date)
Address (id, user email [FK:User:email], city, line1, line2)
Order (id, status, total price, delivery flag, delivery price, delivery date, delivery address id
[FK:Address:id], orderer emaill [FK:User:email])
Product (id, name, description, condition, seller email [FK:User:email], contained order id [FK:Order:id], located address id [FK:Address:id])
FixedProduct (id [FK:Product:id], price)
AuctionProduct (id [FK:Product:id], start price, final price, deadline)
Bid (bid procuct id [FK:AuctionProduct:id], bidder email [FK:User:email], bidding price, bidding date)



Queries-SecondBuy:
1. List all the products name, description and also the condition in the system. Order the list by the name of the product in ascending order.
2. List the name, surname and email address of all users which are gold flagged and they became gold member in 2020.
3. List the name and surname of all users who made a bid on the 22/08/2018.
4. List the name and the description of the products that are ordered by the user called Donald Trump.
5. List the product name, description and the maximum bid on the products. On product can have multiple bids by different users and we would like to find out the highest bid.
6. List the name and description of the products that they have no bid on them.





//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





Schema-SummerInternship:
Faculty(faculty id , name, surname, email, username, tel, department code, cur- rent title, start year)
Student(student id, name, surname, email, username, tel, department code, start year, current semester)
Coordinator(coordinator id [FK: Faculty: faculty id], position duration, start date)
Internship(internship id, start date, end date, course code, status, semester, final score, supervisor approval, supervisor evaluation date, supervisor evaluation score, supervisor email [FK: Supervisor: email], student id [FK: Student: student id])
Report(report id, report name, report size, internship id [FK: Internship: internship id], submission date)
FacultyEvaluation(faculty [FK: Faculty: faculty id], report [FK: Report: report id], evaluation date, score)
Company(id, name, address, tel)
Supervisor(email, company id [FK: Company: id], name, surname, tel)
InternshipCoordinator(internship id [FK: Internship: internship id], coordinator id [FK: Coordinator: coordinator id], approval)


Queries-SummerInternship:
1. List the id, name, surname and email address of all students in the system.
2. List the student IDs and also the supervisor emails of all the internships that are being conducted from 1st of July 2019 to 30th of July 2020 for the course CNG300 (3550300).
3. List the name, surname, and email address of all students who did an intern- ship in Summer 2018 for the course CNG300 (3550300).
4. We would like to identify the details of all the company supervisors for the semester of Summer 2018. Write a query to list the name, surname, tele- phone number, 
and their company name and address for all supervisors for both CNG300 (3550300) and CNG400 (3550400) courses.
5. Show the report name and the evaluation scores of the CNG300 (3550300) reports by the assigned faculty member for the student named “Kaila Lembrick“ (name/surname).
6. Multiple reports can be submitted for an internship and they are all evaluated separately. Write a query to find the average score of a student with id “2“ for the course CNG300 (3550300).
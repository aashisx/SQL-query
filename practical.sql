--question 1--
create database CollegeExamDB_Aashish
use CollegeExamDB_Aashish

create table students_aashish(
StudentId int primary key not null,
FullName varchar(100) not null,
Email varchar(200) unique not null,
 Gender varchar(30) check (Gender IN ('male', 'female')),
 Department varchar(100) not null,
AdmissionYear int check (AdmissionYear >= 2020)
)

create table courses_aashish(
 courseId int primary key,
coursename varchar(100) unique not null,
CreditHours int check (CreditHours between 2 and 4) Default 3
)

create table enrollments_aashish(
enrollmentId int primary key,
studentId int,
courseId int,
EnrollDate Date Default getdate(),
marks int check (marks between 0 and 100),
Grade varchar(1) check (Grade IN ('A', 'B', 'C', 'F')),
foreign key(studentId) references Students_aashish(StudentId),
foreign key(courseId) references courses_aashish(courseId)
)

--ques-2--
use CollegeExamDB_Aashish

insert into Students_aashish (StudentId, FullName,Email, Gender, Department,AdmissionYear)
values( 1, 'Aashish karki', 'Aashish@1gmail.com', 'male', 'IT', 2024),
( 2, 'Raj shrestha', 'raj@1gmail.com', 'male', 'IT', 2020),
( 3, 'sita tamang', 'sita@1gmail.com', 'female', 'management', 2021),
( 4, 'Bijen karki', 'bijen@1gmail.com', 'male', 'science', 2024),
( 5, 'ram thakuri karki', 'ram@1gmail.com', 'male', 'finance', 2024),
( 6, 'gita khadka', 'gita@1gmail.com', 'female', 'managemment', 2020);

select * from Students_aashish

insert into courses_aashish (CourseId, CourseName,CreditHours) values
(1, 'DBMS' ,3),
(2, 'MAths' ,2),
(3, 'Biology' ,4),
(4, 'Java' ,3);

select * from Courses_aashish


insert into enrollments_aashish( enrollmentId, StudentID, CourseId, Marks, Grade) values
(1, 1, 1, 66, 'B'),
(2, 2, 4, 99, 'A'),
(3, 3, 2, 77, 'B'),
(4, 4, 3, 30, 'F'),
(5, 5, 2, 80, 'A'),
(6, 6, 2, 99, 'A'),
(7, 4, 2, 100, 'A'),
(8, 1, 4, 50, 'C');

select * from enrollments_aashish

update enrollments_aashish
set marks = (marks + 5)
where marks < 40;

delete from enrollments_aashish 
where courseId is null;

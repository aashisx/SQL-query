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

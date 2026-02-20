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




--question 3--
use CollegeExamDB_Aashish

SELECT s.StudentId,s.FullName,s.Email,s.Department,e.marks
FROM students_aashish s
Inner JOIN enrollments_aashish e ON s.StudentId = e.studentId
where e.marks > (SELECT AVG(marks) FROM enrollments_aashish Where marks IS NOT NULL)
order BY e.marks DESC;

SELECT c.coursename,COUNT(Distinct e.studentId) AS NumberOfStudents
FROM courses_aashish c
LEFT Join enrollments_aashish e ON c.courseId = e.courseId
GROUP BY c.coursename
order BY NumberOfStudents DESC;


SELECT c.coursename,s.StudentId,s.FullName,s.Email, s.Department,e.marks AS HighestMark
FROM dbo.courses_aashish c
inner Join enrollments_aashish e ON c.courseId = e.courseId
inner Join students_aashish s ON e.studentId = s.StudentId
WHERE e.marks = (SELECT MAX(marks) 
FROM enrollments_aashish e2 
where e2.courseId = c.courseId AND e2.marks IS NOT NULL
)
order BY c.coursename;


SELECT s.StudentId,s.FullName,    s.Email,s.Department,
COUNT(DISTINCT e.courseId) AS NumberOfCourses
FROM students_aashish s
inner Join enrollments_aashish e ON s.StudentId = e.studentId
GROUP BY s.StudentId, s.FullName, s.Email, s.Department
having COUNT(DISTINCT e.courseId) > 1
order BY NumberOfCourses DESC, s.FullName;



SELECT    s.StudentId, s.FullName, s.Email s.Department,e.courseId, c.coursename,  e.marks
FROM dbo.students_aashish s
inner Join enrollments_aashish e ON s.StudentId = e.studentId
inner Join courses_aashish c ON e.courseId = c.courseId
AND e.marks IS NOT NULL
order BY e.marks DESC;

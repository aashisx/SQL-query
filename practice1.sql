use DBMS_aashish;

create table Students(
StudentID int primary key,
FullName varchar(100) not null,
Email varchar(50) unique,
DOB int,
Gender varchar(50)
)
create table course(
courseid int primary key,
coursename varchar(100),
credithours int default 3
)

CREATE TABLE enrollments(
    enrollmentid INT PRIMARY KEY,
    StudentID INT,
    courseid INT,
   enrollmentdate DATE,
   CONSTRAINT FK_enrollstudent
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
   CONSTRAINT FK_enrollcourse
    FOREIGN KEY (courseid) REFERENCES course(courseid)
)
drop table enrollments

INSERT INTO Students (StudentID, FullName, Email, DOB, Gender)
VALUES
(1, 'Aashish Karki', 'aashish.karki@gmail.com', 2002, 'Male'),

(2, 'Suman Adhikari', 'suman.adhikari@gmail.com', 2001, 'Male'),

(3, 'Priya Sharma', 'priya.sharma@gmail.com', 2003, 'Female'),

(4, 'Nischal Thapa', 'nischal.thapa@gmail.com', 2000, 'Male'),

(5, 'Anisha Rai', 'anisha.rai@gmail.com', 2002, 'Female');

INSERT INTO course (courseid, coursename) VALUES
(1,'DBMS'),
(2, 'MATH'),
(3, 'SCIENCE');


INSERT INTO enrollments(enrollmentid,StudentID, courseid, enrollmentdate) VALUES
(1, 1, 1, '2024-1-2'),
(2, 1, 3, '2026-4-5'),
(3, 5, 1, '2022-3-4'),
(4, 4, 1, '2024-1-2'),
(5, 4, 2, '2025-12-12');
 select * from enrollments


 update Students 
 set Email= 'updatedemail@gmail.com'
 WHERE StudentID= 3;


DELETE FROM dbo.enrollments
WHERE StudentID = 1  
  AND courseid = 1;  


SELECT s.FullName, c.coursename, e.enrollmentdate
FROM dbo.enrollments e
INNER JOIN dbo.Students s ON e.StudentID = s.StudentID
INNER JOIN dbo.course c ON e.courseid = c.courseid
ORDER BY e.enrollmentdate;


SELECT s.FullName, c.coursename, e.enrollmentdate
FROM dbo.Students s
LEFT JOIN enrollments e ON s.StudentID = e.StudentID
LEFT JOIN course c ON e.courseid = c.courseid
ORDER BY s.FullName;



SELECT c.courseid, c.coursename, c.credithours
FROM course c
LEFT JOIN enrollments e ON c.courseid = e.courseid
WHERE e.enrollmentid IS NULL
ORDER BY c.coursename;


SELECT  c.coursename,
COUNT(e.StudentID) AS TotalStudents
FROM course c
LEFT JOIN enrollments e ON c.courseid = e.courseid
GROUP BY c.courseid, c.coursename
ORDER BY TotalStudents DESC, c.coursename;


SELECT StudentID,FullName,DOB
FROM Students
WHERE DOB > 2002
ORDER BY DOB;


SELECT StudentID,FullName,DOB
FROM Students
WHERE FullName LIKE 'A%'
ORDER BY FullName;


SELECT courseid, coursename, credithours
FROM course
WHERE credithours >= 3
ORDER BY credithours DESC, coursename;


SELECT s.StudentID, s.FullName,s.Email,
COUNT(e.courseid) AS TotalCourses
FROM Students s
INNER JOIN enrollments e ON s.StudentID = e.StudentID
GROUP BY s.StudentID, s.FullName, s.Email
HAVING COUNT(e.courseid) > 1
ORDER BY TotalCourses DESC, s.FullName;



SELECT  s.FullName, c.coursename, e.enrollmentdate
FROM enrollments e
INNER JOIN Students s ON e.StudentID = s.StudentID
INNER JOIN course c ON e.courseid = c.courseid
WHERE e.enrollmentdate = (SELECT MAX(enrollmentdate) FROM enrollments);
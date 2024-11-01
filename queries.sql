--Query 1: List all the schools located in ‘Hyderabad', and sort them by school name.
SELECT SchoolName 
FROM School 
WHERE CampusName IN (SELECT CampusName FROM Campus WHERE CampusAddress LIKE '%Hyderabad%') 
ORDER BY SchoolName;
--Query 2: List all the programmes provided by ‘Computer Science Faculty'.
SELECT ProgrammeTitle 
FROM Programme 
WHERE SchoolName IN (SELECT SchoolName FROM School WHERE FacultyName = 'Faculty of Engineering');
--Query 3: Give all the names of the lecturers who are members of the committee and sort by their name.
SELECT DISTINCT L.LecturerName 
FROM Lecturer L 
JOIN CommitteeLecturer CL ON L.StaffID = CL.StaffID 
ORDER BY L.LecturerName;
--Query 4: List all supervisor's names and the names of the lecturers they manage. Sort by supervisor name and lecturer name.
SELECT L.SupervisorID AS SupervisorName, L.LecturerName 
FROM Lecturer L 
WHERE L.SupervisorID IS NOT NULL 
ORDER BY SupervisorName, LecturerName;
--Query 5: Give all the lecturers who are not members of the committee.
SELECT L.LecturerName 
FROM Lecturer L 
WHERE L.StaffID NOT IN (SELECT StaffID FROM CommitteeLecturer);
--Query 6: Give the total number of courses for each programme.
SELECT P.ProgrammeTitle, COUNT(C.CourseCode) AS TotalCourses 
FROM Programme P 
LEFT JOIN Course C ON P.ProgrammeCode = C.ProgrammeCode 
GROUP BY P.ProgrammeTitle;
--Query 7: Give all the lecturers with the courses they are teaching. Sort by lecturer name.
SELECT L.LecturerName, C.CourseTitle 
FROM Lecturer L 
JOIN LecturerCourse LC ON L.StaffID = LC.StaffID 
JOIN Course C ON LC.CourseCode = C.CourseCode 
ORDER BY L.LecturerName;
--Query 8: Give all the course titles and their corresponding prerequisite course titles.
SELECT C.CourseTitle, PC.PreCourseCode 
FROM Course C 
LEFT JOIN PreCourse PC ON C.CourseCode = PC.CourseCode;
--Query 9: Give the top 5 courses which have more students involved.
SELECT *
FROM (
    SELECT C.CourseTitle, COUNT(C.CourseCode) AS StudentCount
    FROM Course C
    JOIN Student ON C.CourseCode = C.CourseCode
    GROUP BY C.CourseTitle
    ORDER BY StudentCount DESC
)
WHERE ROWNUM <= 5;
--Query 10: Give any prerequisite courses that were not taken by any of the students who enrolled in the university in 2010 and were taking courses in 2011.
SELECT DISTINCT PC.PreCourseCode 
FROM PreCourse PC 
WHERE PC.PreCourseCode NOT IN (
    SELECT CS.CourseCode 
    FROM CourseStudent CS 
    WHERE CS.YearTaken = 2011 AND CS.StudentID IN (
        SELECT StudentID 
        FROM Student 
        WHERE YearEnrolled = 2010
    )
);

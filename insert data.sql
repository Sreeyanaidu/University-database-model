-- Inserting data into Faculty
INSERT INTO Faculty (FacultyName, DeanName, FacultyBuilding) VALUES ('Faculty of Engineering', 'Dr. Rajesh Kumar', 'Block A');
INSERT INTO Faculty (FacultyName, DeanName, FacultyBuilding) VALUES ('Faculty of Science', 'Dr. Anjali Desai', 'Block B');
INSERT INTO Faculty (FacultyName, DeanName, FacultyBuilding) VALUES ('Faculty of Arts', 'Dr. Pooja Sharma', 'Block C');

-- Inserting data into Campus
INSERT INTO Campus (CampusName, CampusAddress, Distance, BusNo) VALUES ('Main Campus', 'Delhi University, Delhi', 10, 'DL-101');
INSERT INTO Campus (CampusName, CampusAddress, Distance, BusNo) VALUES ('North Campus', 'Delhi University North, Delhi', 15, 'DL-102');
INSERT INTO Campus (CampusName, CampusAddress, Distance, BusNo) VALUES ('South Campus', 'Delhi University South, Delhi', 20, 'DL-103');


-- Inserting data into School
INSERT INTO School (SchoolName, FacultyName, CampusName, SchoolBuilding) VALUES ('School of Computer Science', 'Faculty of Engineering', 'Main Campus', 'CS Building');
INSERT INTO School (SchoolName, FacultyName, CampusName, SchoolBuilding) VALUES ('School of Physics', 'Faculty of Science', 'North Campus', 'Physics Building');
INSERT INTO School (SchoolName, FacultyName, CampusName, SchoolBuilding) VALUES ('School of Fine Arts', 'Faculty of Arts', 'South Campus', 'Arts Building');

-- Inserting data into Programme
INSERT INTO Programme (ProgrammeCode, SchoolName, ProgrammeTitle, ProgrammeLevel, ProgrammeLength) VALUES ('CSE101', 'School of Computer Science', 'B.Tech in Computer Science', 'Undergraduate', 4);
INSERT INTO Programme (ProgrammeCode, SchoolName, ProgrammeTitle, ProgrammeLevel, ProgrammeLength) VALUES ('PHY201', 'School of Physics', 'M.Sc in Physics', 'Postgraduate', 2);
INSERT INTO Programme (ProgrammeCode, SchoolName, ProgrammeTitle, ProgrammeLevel, ProgrammeLength) VALUES ('FA301', 'School of Fine Arts', 'BFA in Fine Arts', 'Undergraduate', 3);

-- Inserting data into Student
INSERT INTO Student (StudentID, ProgrammeCode, StudentName, StudentBirthday, YearEnrolled) VALUES (101, 'CSE101', 'Aryan Gupta', TO_DATE('2002-06-15', 'YYYY-MM-DD'), 2020);
INSERT INTO Student (StudentID, ProgrammeCode, StudentName, StudentBirthday, YearEnrolled) VALUES (102, 'PHY201', 'Neha Verma', TO_DATE('2000-09-05', 'YYYY-MM-DD'), 2022);
INSERT INTO Student (StudentID, ProgrammeCode, StudentName, StudentBirthday, YearEnrolled) VALUES (103, 'FA301', 'Riya Iyer', TO_DATE('2001-03-25', 'YYYY-MM-DD'), 2021);

-- Inserting data into Course
INSERT INTO Course (CourseCode, ProgrammeCode, CourseTitle) VALUES ('CSE1001', 'CSE101', 'Data Structures and Algorithms');
INSERT INTO Course (CourseCode, ProgrammeCode, CourseTitle) VALUES ('PHY2001', 'PHY201', 'Quantum Mechanics');
INSERT INTO Course (CourseCode, ProgrammeCode, CourseTitle) VALUES ('FA3001', 'FA301', 'Art History');
-- Inserting courses with their corresponding prerequisite course titles
INSERT INTO Course (CourseTitle, CourseCode) VALUES ('Data Structures and Algorithms', 'CSE1001');  -- Prerequisite: CSE1000
INSERT INTO Course (CourseTitle, CourseCode) VALUES ('Quantum Mechanics', 'PHY2001');               -- Prerequisite: PHY1000
INSERT INTO Course (CourseTitle, CourseCode) VALUES ('Physics I', 'PHY1000');                      -- No prerequisite
INSERT INTO Course (CourseTitle, CourseCode) VALUES ('Introduction to Fine Arts', 'FA1001');       -- No prerequisite
INSERT INTO Course (CourseTitle, CourseCode) VALUES ('Programming Fundamentals', 'CSE1000');       -- No prerequisite
INSERT INTO Course (CourseTitle, CourseCode) VALUES ('Art History', 'FA2001');                     -- No prerequisite
INSERT INTO Course (CourseTitle, CourseCode) VALUES ('Mathematics I', 'MATH1000');                 -- No prerequisite

-- Inserting data into Lecturer
INSERT INTO Lecturer (StaffID, SchoolName, SupervisorID, LecturerName, LecturerTitle, OfficeRoom) VALUES (1001, 'School of Computer Science', NULL, 'Dr. Anil Bhatia', 'Professor', 'Room 101');
INSERT INTO Lecturer (StaffID, SchoolName, SupervisorID, LecturerName, LecturerTitle, OfficeRoom) VALUES (1002, 'School of Physics', NULL, 'Dr. Kavita Rao', 'Associate Professor', 'Room 201');
INSERT INTO Lecturer (StaffID, SchoolName, SupervisorID, LecturerName, LecturerTitle, OfficeRoom) VALUES (1003, 'School of Fine Arts', NULL, 'Dr. Rakesh Menon', 'Lecturer', 'Room 301');

-- Inserting data into Committee
INSERT INTO Committee (CommitteeTitle, FacultyName, MeetingFrequency) VALUES ('Research Committee', 'Faculty of Engineering', 12);
INSERT INTO Committee (CommitteeTitle, FacultyName, MeetingFrequency) VALUES ('Cultural Committee', 'Faculty of Arts', 6);
INSERT INTO Committee (CommitteeTitle, FacultyName, MeetingFrequency) VALUES ('Admission Committee', 'Faculty of Science', 3);

-- Inserting data into CommitteeLecturer
INSERT INTO CommitteeLecturer (StaffID, CommitteeTitle, FacultyName) VALUES (1001, 'Research Committee', 'Faculty of Engineering');
INSERT INTO CommitteeLecturer (StaffID, CommitteeTitle, FacultyName) VALUES (1003, 'Cultural Committee', 'Faculty of Arts');
INSERT INTO CommitteeLecturer (StaffID, CommitteeTitle, FacultyName) VALUES (1002, 'Admission Committee', 'Faculty of Science');

-- Inserting data into LecturerCourse
INSERT INTO LecturerCourse (StaffID, CourseCode) VALUES (1001, 'CSE1001');
INSERT INTO LecturerCourse (StaffID, CourseCode) VALUES (1002, 'PHY2001');
INSERT INTO LecturerCourse (StaffID, CourseCode) VALUES (1003, 'FA3001');
-- Insert Supervisors
INSERT INTO Lecturer (StaffID, LecturerName, SupervisorID) VALUES (1, 'Dr. Alice Smith', NULL);  -- Supervisor with no supervisor
INSERT INTO Lecturer (StaffID, LecturerName, SupervisorID) VALUES (2, 'Dr. Bob Johnson', NULL);  -- Supervisor with no supervisor

-- Insert Lecturers managed by Dr. Alice Smith
INSERT INTO Lecturer (StaffID, LecturerName, SupervisorID) VALUES (3, 'Mr. Charlie Brown', 1);  -- Managed by Dr. Alice Smith
INSERT INTO Lecturer (StaffID, LecturerName, SupervisorID) VALUES (4, 'Ms. Daisy White', 1);    -- Managed by Dr. Alice Smith

-- Insert Lecturers managed by Dr. Bob Johnson
INSERT INTO Lecturer (StaffID, LecturerName, SupervisorID) VALUES (5, 'Mr. Ethan Green', 2);    -- Managed by Dr. Bob Johnson
INSERT INTO Lecturer (StaffID, LecturerName, SupervisorID) VALUES (6, 'Ms. Fiona Black', 2);    -- Managed by Dr. Bob Johnson

-- Insert prerequisites for various courses
INSERT INTO PreCourse (CourseCode, PreCourseCode) VALUES ('CSE1001', 'CSE1000');  -- Data Structures has Programming Fundamentals as a prerequisite
INSERT INTO PreCourse (CourseCode, PreCourseCode) VALUES ('CSE2001', 'CSE1001');  -- Another course that requires Data Structures
INSERT INTO PreCourse (CourseCode, PreCourseCode) VALUES ('MATH2001', 'MATH1000');  -- Calculus requiring Mathematics I
INSERT INTO PreCourse (CourseCode, PreCourseCode) VALUES ('PHY2001', 'PHY1000');  -- Physics II requiring Physics I
INSERT INTO PreCourse (CourseCode, PreCourseCode) VALUES ('FA2001', 'FA1000');  -- FA II requiring FA I

-- Insert actual courses required for prerequisites
INSERT INTO Course (CourseCode, ProgrammeCode, CourseTitle) VALUES ('CSE1000', 'CSE101', 'Programming Fundamentals');
INSERT INTO Course (CourseCode, ProgrammeCode, CourseTitle) VALUES ('MATH1000', 'CSE101', 'Mathematics I');
INSERT INTO Course (CourseCode, ProgrammeCode, CourseTitle) VALUES ('PHY1000', 'PHY201', 'Physics I');
INSERT INTO Course (CourseCode, ProgrammeCode, CourseTitle) VALUES ('FA1000', 'FA301', 'Introduction to Fine Arts');

-- Inserting data into CourseStudent
INSERT INTO CourseStudent (CourseCode, StudentID, YearTaken, SemesterTaken, GradeAwarded) VALUES ('CSE1001', 101, 2021, 1, 'A');
INSERT INTO CourseStudent (CourseCode, StudentID, YearTaken, SemesterTaken, GradeAwarded) VALUES ('PHY2001', 102, 2022, 1, 'B');
INSERT INTO CourseStudent (CourseCode, StudentID, YearTaken, SemesterTaken, GradeAwarded) VALUES ('FA3001', 103, 2022, 2, 'A');

-- Inserting data into Club
INSERT INTO Club (ClubName, CampusName, ClubBuilding, ClubPhoneNo) VALUES ('Tech Club', 'Main Campus', 'Tech Block', '011-12345678');
INSERT INTO Club (ClubName, CampusName, ClubBuilding, ClubPhoneNo) VALUES ('Drama Club', 'South Campus', 'Drama Block', '011-87654321');
INSERT INTO Club (ClubName, CampusName, ClubBuilding, ClubPhoneNo) VALUES ('Physics Club', 'North Campus', 'Physics Block', '011-56789012');

-- Inserting data into Sport
INSERT INTO Sport (SportName, ClubName) VALUES ('Cricket', 'Tech Club');
INSERT INTO Sport (SportName, ClubName) VALUES ('Basketball', 'Drama Club');
INSERT INTO Sport (SportName, ClubName) VALUES ('Badminton', 'Physics Club');

-- Inserting data into SportClub
INSERT INTO SportClub (SportName, ClubName) VALUES ('Cricket', 'Tech Club');
INSERT INTO SportClub (SportName, ClubName) VALUES ('Basketball', 'Drama Club');
INSERT INTO SportClub (SportName, ClubName) VALUES ('Badminton', 'Physics Club');

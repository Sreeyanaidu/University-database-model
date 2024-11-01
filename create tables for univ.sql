CREATE TABLE Faculty (
    FacultyName VARCHAR2(100) PRIMARY KEY,
    DeanName VARCHAR2(100),
    FacultyBuilding VARCHAR2(100)
);

CREATE TABLE Campus (
    CampusName VARCHAR2(100) PRIMARY KEY,
    CampusAddress VARCHAR2(255),
    Distance NUMBER,
    BusNo VARCHAR2(50)
);

CREATE TABLE School (
    SchoolName VARCHAR2(100) PRIMARY KEY,
    FacultyName VARCHAR2(100),
    CampusName VARCHAR2(100),
    SchoolBuilding VARCHAR2(100),
    FOREIGN KEY (FacultyName) REFERENCES Faculty(FacultyName),
    FOREIGN KEY (CampusName) REFERENCES Campus(CampusName)
);

CREATE TABLE Programme (
    ProgrammeCode VARCHAR2(100) PRIMARY KEY,
    SchoolName VARCHAR2(100),
    ProgrammeTitle VARCHAR2(100),
    ProgrammeLevel VARCHAR2(50),
    ProgrammeLength NUMBER,
    FOREIGN KEY (SchoolName) REFERENCES School(SchoolName)
);

CREATE TABLE Student (
    StudentID NUMBER PRIMARY KEY,
    ProgrammeCode VARCHAR2(100),
    StudentName VARCHAR2(100),
    StudentBirthday DATE,
    YearEnrolled NUMBER,
    FOREIGN KEY (ProgrammeCode) REFERENCES Programme(ProgrammeCode)
);

CREATE TABLE Course (
    CourseCode VARCHAR2(100) PRIMARY KEY,
    ProgrammeCode VARCHAR2(100),
    CourseTitle VARCHAR2(100),
    FOREIGN KEY (ProgrammeCode) REFERENCES Programme(ProgrammeCode)
);

CREATE TABLE Lecturer (
    StaffID NUMBER PRIMARY KEY,
    SchoolName VARCHAR2(100),
    SupervisorID NUMBER,
    LecturerName VARCHAR2(100),
    LecturerTitle VARCHAR2(100),
    OfficeRoom VARCHAR2(50),
    FOREIGN KEY (SchoolName) REFERENCES School(SchoolName),
    FOREIGN KEY (SupervisorID) REFERENCES Lecturer(StaffID)
);

CREATE TABLE Committee (
    CommitteeTitle VARCHAR2(100) PRIMARY KEY,
    FacultyName VARCHAR2(100),
    MeetingFrequency NUMBER,
    FOREIGN KEY (FacultyName) REFERENCES Faculty(FacultyName)
);

CREATE TABLE CommitteeLecturer (
    StaffID NUMBER,
    CommitteeTitle VARCHAR2(100),
    FacultyName VARCHAR2(100),
    PRIMARY KEY (StaffID, CommitteeTitle),
    FOREIGN KEY (StaffID) REFERENCES Lecturer(StaffID),
    FOREIGN KEY (CommitteeTitle) REFERENCES Committee(CommitteeTitle),
    FOREIGN KEY (FacultyName) REFERENCES Faculty(FacultyName)
);

CREATE TABLE LecturerCourse (
    StaffID NUMBER,
    CourseCode VARCHAR2(100),
    PRIMARY KEY (StaffID, CourseCode),
    FOREIGN KEY (StaffID) REFERENCES Lecturer(StaffID),
    FOREIGN KEY (CourseCode) REFERENCES Course(CourseCode)
);

CREATE TABLE PreCourse (
    CourseCode VARCHAR2(10),
    PreCourseCode VARCHAR2(10),
    PRIMARY KEY (CourseCode, PreCourseCode),
    FOREIGN KEY (CourseCode) REFERENCES Course(CourseCode),
    FOREIGN KEY (PreCourseCode) REFERENCES Course(CourseCode)
);

CREATE TABLE CourseStudent (
    CourseCode VARCHAR2(100),
    StudentID NUMBER,
    YearTaken NUMBER,
    SemesterTaken NUMBER,
    GradeAwarded CHAR(2),
    PRIMARY KEY (CourseCode, StudentID),
    FOREIGN KEY (CourseCode) REFERENCES Course(CourseCode),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);

CREATE TABLE Club (
    ClubName VARCHAR2(100) PRIMARY KEY,
    CampusName VARCHAR2(100),
    ClubBuilding VARCHAR2(100),
    ClubPhoneNo VARCHAR2(50),
    FOREIGN KEY (CampusName) REFERENCES Campus(CampusName)
);

CREATE TABLE Sport (
    SportName VARCHAR2(100) PRIMARY KEY,
    ClubName VARCHAR2(100),
    FOREIGN KEY (ClubName) REFERENCES Club(ClubName)
);

CREATE TABLE SportClub (
    SportName VARCHAR2(100),
    ClubName VARCHAR2(100),
    PRIMARY KEY (SportName, ClubName),
    FOREIGN KEY (SportName) REFERENCES Sport(SportName),
    FOREIGN KEY (ClubName) REFERENCES Club(ClubName)
);

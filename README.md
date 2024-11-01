# University-database-model
 University Database Model This project provides a relational database model for a university system, designed to manage core university functions including student enrollment, course management, faculty records, and departmental resources.
 
The database structure allows for seamless storage and retrieval of data, supporting multiple use cases such as student enrollment tracking, course scheduling, faculty assignments, and more.

Database Entities and Relationships
The model organizes data across multiple tables with well-defined relationships to maintain data integrity and provide efficient data access. Key entities include:

Students: Records basic student information, enrollment status, and associated department.
Courses: Stores information about available courses, credits, and prerequisites.
Enrollment: Manages course enrollment for students, tracking grades and semester information.
Faculty: Stores information on instructors, including department affiliation and assigned courses.
Departments: Represents academic departments within the university and links to faculty, students, and courses.
Features
Normalization: All tables are normalized to at least the third normal form (3NF) to ensure data integrity and reduce redundancy.
Foreign Key Constraints: To maintain relationships between tables, foreign keys link students to departments, courses to instructors, and students to their enrolled courses.
Sample Data: The repository includes sample data for easy testing and demonstration of queries.
SQL Scripts: Contains scripts to create the database schema, tables, and relationships, as well as example queries for common use cases.
Use Cases
Retrieve a list of students enrolled in a particular course.
Track faculty members’ assigned courses across semesters.
Query department resources and student enrollment statistics.
Generate transcripts with courses, grades, and cumulative GPA for individual students.
Getting Started
Clone the Repository: Download the files and set up the database in your preferred SQL environment.
Run the Scripts: Execute the schema creation and sample data insertion scripts.
Test Queries: Use the included sample queries to explore database functionality.

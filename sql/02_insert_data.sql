-- ============================================
-- STUDENT MANAGEMENT SYSTEM
-- Sample Data
-- ============================================

-- ============================================
-- STUDENTS
-- ============================================

INSERT INTO students (name, email, date_of_birth, department)
VALUES
('Rahul', 'rahul@gmail.com', '2005-04-12', 'AI&DS'),
('Priya', 'priya@gmail.com', '2005-08-20', 'CSE'),
('Arjun', 'arjun@gmail.com', '2004-11-15', 'ECE'),
('Sneha', 'sneha@gmail.com', '2005-02-10', 'AI&DS'),
('Vikram', 'vikram@gmail.com', '2004-07-25', 'CSE'),
('Sanjeev', 'sanjeev@gmail.com', '2005-09-18', 'AI&DS'),
('Karthik', 'karthik@gmail.com', '2004-12-05', 'MECH'),
('Meera', 'meera@gmail.com', '2005-06-30', 'ECE'),
('Aditya', 'aditya@gmail.com', '2005-01-22', 'AI&DS'),
('Divya', 'divya@gmail.com', '2004-10-14', 'CSE');


-- ============================================
-- TEACHERS
-- ============================================

INSERT INTO teachers (name, email, department)
VALUES
('Dr. Ravi Kumar', 'ravi@college.com', 'AI&DS'),
('Dr. Anitha Sharma', 'anitha@college.com', 'CSE'),
('Prof. Suresh Rao', 'suresh@college.com', 'ECE'),
('Prof. Meena Nair', 'meena@college.com', 'MECH');


-- ============================================
-- COURSES
-- ============================================

INSERT INTO courses (course_name, teacher_id, credits)
VALUES
('Database Management Systems', 1, 4),
('Machine Learning', 1, 4),
('Data Structures', 2, 3),
('Computer Networks', 2, 3),
('Digital Electronics', 3, 3),
('Thermodynamics', 4, 4);


-- ============================================
-- MARKS
-- ============================================

INSERT INTO marks (student_id, course_id, marks)
VALUES
(1, 1, 85),
(1, 2, 78),
(1, 3, 91),

(2, 1, 88),
(2, 2, 92),
(2, 3, 84),

(3, 1, 72),
(3, 2, 81),
(3, 3, 76),

(4, 1, 95),
(4, 2, 89),
(4, 3, 93),

(5, 1, 68),
(5, 2, 74),
(5, 3, 80);


-- ============================================
-- ATTENDANCE
-- ============================================

INSERT INTO attendance (student_id, course_id, date, status)
VALUES
(1, 1, '2026-08-01', 'Present'),
(1, 1, '2026-08-02', 'Present'),
(1, 1, '2026-08-03', 'Absent'),

(2, 1, '2026-08-01', 'Present'),
(2, 1, '2026-08-02', 'Absent'),
(2, 1, '2026-08-03', 'Present'),

(3, 1, '2026-08-01', 'Present'),
(3, 1, '2026-08-02', 'Present'),
(3, 1, '2026-08-03', 'Present'),

(4, 1, '2026-08-01', 'Absent'),
(4, 1, '2026-08-02', 'Present'),
(4, 1, '2026-08-03', 'Present');
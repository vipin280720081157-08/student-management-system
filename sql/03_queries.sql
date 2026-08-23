-- ============================================
-- STUDENT MANAGEMENT SYSTEM
-- SQL Queries
-- ============================================


-- ============================================
-- 1. SHOW ALL STUDENTS
-- ============================================

SELECT *
FROM students;


-- ============================================
-- 2. SHOW STUDENTS FROM AI&DS
-- ============================================

SELECT *
FROM students
WHERE department = 'AI&DS';


-- ============================================
-- 3. SORT STUDENTS BY NAME
-- ============================================

SELECT *
FROM students
ORDER BY name;


-- ============================================
-- 4. COUNT TOTAL STUDENTS
-- ============================================

SELECT COUNT(*) AS total_students
FROM students;


-- ============================================
-- 5. COUNT STUDENTS BY DEPARTMENT
-- ============================================

SELECT
    department,
    COUNT(*) AS student_count
FROM students
GROUP BY department
ORDER BY student_count DESC;


-- ============================================
-- 6. SHOW STUDENT MARKS
-- ============================================

SELECT
    s.name AS student_name,
    c.course_name,
    m.marks
FROM marks m
JOIN students s
    ON m.student_id = s.student_id
JOIN courses c
    ON m.course_id = c.course_id
ORDER BY s.name;


-- ============================================
-- 7. STUDENTS SCORING ABOVE 80
-- ============================================

SELECT
    s.name AS student_name,
    c.course_name,
    m.marks
FROM marks m
JOIN students s
    ON m.student_id = s.student_id
JOIN courses c
    ON m.course_id = c.course_id
WHERE m.marks > 80
ORDER BY m.marks DESC;


-- ============================================
-- 8. AVERAGE MARKS OF EACH STUDENT
-- ============================================

SELECT
    s.name,
    ROUND(AVG(m.marks), 2) AS average_marks
FROM students s
JOIN marks m
    ON s.student_id = m.student_id
GROUP BY s.student_id, s.name
ORDER BY average_marks DESC;


-- ============================================
-- 9. HIGHEST MARK OF EACH STUDENT
-- ============================================

SELECT
    s.name,
    MAX(m.marks) AS highest_mark
FROM students s
JOIN marks m
    ON s.student_id = m.student_id
GROUP BY s.student_id, s.name
ORDER BY highest_mark DESC;


-- ============================================
-- 10. TOP SCORING STUDENT
-- ============================================

SELECT
    s.name,
    MAX(m.marks) AS highest_mark
FROM students s
JOIN marks m
    ON s.student_id = m.student_id
GROUP BY s.student_id, s.name
ORDER BY highest_mark DESC
LIMIT 1;


-- ============================================
-- 11. SHOW COURSES WITH THEIR TEACHERS
-- ============================================

SELECT
    c.course_name,
    t.name AS teacher_name,
    t.department
FROM courses c
JOIN teachers t
    ON c.teacher_id = t.teacher_id
ORDER BY c.course_name;


-- ============================================
-- 12. SHOW ATTENDANCE DETAILS
-- ============================================

SELECT
    s.name AS student_name,
    c.course_name,
    a.date,
    a.status
FROM attendance a
JOIN students s
    ON a.student_id = s.student_id
JOIN courses c
    ON a.course_id = c.course_id
ORDER BY a.date, s.name;


-- ============================================
-- 13. ATTENDANCE PERCENTAGE
-- ============================================

SELECT
    s.name,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN a.status = 'Present' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS attendance_percentage
FROM students s
JOIN attendance a
    ON s.student_id = a.student_id
GROUP BY s.student_id, s.name
ORDER BY attendance_percentage DESC;


-- ============================================
-- 14. STUDENTS WITH ATTENDANCE BELOW 75%
-- ============================================

SELECT
    s.name,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN a.status = 'Present' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS attendance_percentage
FROM students s
JOIN attendance a
    ON s.student_id = a.student_id
GROUP BY s.student_id, s.name
HAVING
    100.0 * SUM(
        CASE
            WHEN a.status = 'Present' THEN 1
            ELSE 0
        END
    ) / COUNT(*) < 75
ORDER BY attendance_percentage;


-- ============================================
-- 15. AVERAGE MARKS BY COURSE
-- ============================================

SELECT
    c.course_name,
    ROUND(AVG(m.marks), 2) AS average_marks
FROM courses c
JOIN marks m
    ON c.course_id = m.course_id
GROUP BY c.course_id, c.course_name
ORDER BY average_marks DESC;


-- ============================================
-- 16. BEST PERFORMING COURSE
-- ============================================

SELECT
    c.course_name,
    ROUND(AVG(m.marks), 2) AS average_marks
FROM courses c
JOIN marks m
    ON c.course_id = m.course_id
GROUP BY c.course_id, c.course_name
ORDER BY average_marks DESC
LIMIT 1;
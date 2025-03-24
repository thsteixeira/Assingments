-- Sergio - 1 to 5
-- Thiago - 6 to 10
-- Steven - 11 to 15
-- Toru - 16 to 20

-- 1. Which courses have the most students enrolled this month?
-- 2. What are the top 5 trending courses based on enrollment growth over the last 3 -- months?
-- 3. Which categories (e.g., Data Science, Programming) have the highest number of -- enrolled students?
-- 4. What is the total revenue from Premium subscriptions in the last quarter? (last 3 -- months)
-- 5. What percentage of total revenue comes from subscription payments versus one-time -- course purchases?
-- 6. Identify the students contributing the highest revenue in the last year.
SELECT s.student_id, s.name, SUM(p.price) AS revenue
FROM students s
JOIN payment_records p ON s.student_id = p.student_id
GROUP BY s.student_id, s.name
ORDER BY revenue DESC
LIMIT 10;

-- 7. Which instructors have the highest-rated courses, based on average review scores?
SELECT i.name, AVG(r.rating) AS rated
FROM instructors i
JOIN courses c ON i.instructor_id = c.instructor_id
JOIN reviews r ON c.course_id = r.course_id
GROUP BY i.name
ORDER BY rated DESC;

-- 8. What is the average number of courses taught per instructor in the Programming -- category?
SELECT AVG(courses) AS average_courses
FROM (
    SELECT COUNT(c.title) AS courses
    FROM courses c
    JOIN instructors i ON c.instructor_id = i.instructor_id
    WHERE c.category LIKE 'Tech'
    GROUP BY i.name
);

-- 9. Which instructors have the most students enrolled across all their courses?
SELECT i.name, COUNT(s.student_id) students_enrollments
FROM instructors i
JOIN courses c ON i.instructor_id = c.instructor_id
JOIN enrollments e ON c.course_id = e.course_id
JOIN students s ON e.student_id = s.student_id
GROUP BY i.name
ORDER BY students_enrollments DESC

-- 10. Which students have completed all modules in a course?


-- 11. List students who are at least 75% complete with their enrolled courses.
SELECT s.student_id, s.name, c.course_id, c.title,
       COUNT(a.assessment_id) * 100.0 / (SELECT COUNT(*) FROM MODULES m WHERE m.course_id = c.course_id) AS completion_percentage
FROM STUDENTS s
JOIN ENROLLMENTS e ON s.student_id = e.student_id
JOIN COURSES c ON e.course_id = c.course_id
JOIN MODULES m ON c.course_id = m.course_id
LEFT JOIN ASSESSMENTS a ON m.module_id = a.module_id AND a.student_id = s.student_id
GROUP BY s.student_id, s.name, c.course_id, c.title
HAVING COUNT(a.assessment_id) * 100.0 / (SELECT COUNT(*) FROM MODULES m WHERE m.course_id = c.course_id) >= 75;

-- 12. How many students dropped out of courses before completing any module?
SELECT COUNT(DISTINCT e.student_id) AS dropped_out_students
FROM ENROLLMENTS e
LEFT JOIN ASSESSMENTS a ON e.student_id = a.student_id
WHERE a.assessment_id IS NULL;


-- 13. What is the average score for each assessment in the 'Introduction to Data -- Science' course?
SELECT a.assessment_id, m.title AS module_title, AVG(a.grade) AS average_score
FROM ASSESSMENTS a
JOIN MODULES m ON a.module_id = m.module_id
JOIN COURSES c ON m.course_id = c.course_id
WHERE c.title = 'Introduction to Data Science'
GROUP BY a.assessment_id, m.title;

-- 14. Identify the top 10 assessments with the lowest average scores.
SELECT a.assessment_id, m.title AS module_title, AVG(a.grade) AS average_score
FROM ASSESSMENTS a
JOIN MODULES m ON a.module_id = m.module_id
GROUP BY a.assessment_id, m.title
ORDER BY average_score ASC
LIMIT 10;

-- 15. How many students submitted assessments after the deadline in the last month?
SELECT COUNT(DISTINCT s.student_id) AS late_students
FROM SUBMISSIONS s
JOIN ASSESSMENTS a ON s.assessment_id = a.assessment_id
WHERE s.submission_date > a.deadline_date
AND s.submission_date >= CURRENT_DATE - INTERVAL '1 month';

-- 16. How many students have active Free vs. Premium subscriptions?
SELECT
    COUNT(*) AS total_students,
    SUM(CASE WHEN s.type_of_subscription = 'Free' THEN 1 ELSE 0 END) AS free_students,
    SUM(CASE WHEN s.type_of_subscription = 'Premium' THEN 1 ELSE 0 END) AS premium_students
FROM students st
JOIN subscriptions s ON st.student_id = s.student_id;

-- 17. What is the average duration (in days) of Free subscriptions before students -- upgrade to Premium?
SELECT
    AVG(s.end_date - s.start_date) AS avg_duration
FROM subscriptions s
WHERE s.type_of_subscription = 'Free';

-- 18. List students with expired subscriptions who haven’t renewed in the last 6 months.
SELECT
    st.student_id,
    st.name,
    s.end_date
FROM students st
JOIN subscriptions s ON st.student_id = s.student_id
WHERE s.end_date < CURRENT_DATE - INTERVAL '6 months';

-- 19. List courses with no reviews yet.
SELECT
    c.course_id,
    c.title
FROM courses c
LEFT JOIN reviews r ON c.course_id = r.course_id
WHERE r.course_id IS NULL;

-- 20. Which payment methods (e.g., credit card, PayPal) are most frequently used by -- students?
SELECT
    p.methods,
    COUNT(*) AS total_payments
FROM payment_records p
GROUP BY p.methods
ORDER BY total_payments DESC;


-- 21. List students who failed any assessment.
SELECT s.name
FROM students s
JOIN assessments a ON s.student_id = a.student_id
WHERE a.grade < a.expected_grade
GROUP BY s.name

-- 22. Courses with the most modules?
-- 23. Which courses have the highest number of reviews in the last quarter?
-- 24. What is the average review rating for each course category?
-- 25. Which modules have the lowest completion rates across all courses?
-- 26. Revenue by category of courses?
-- 27. List courses with fewer than 10% of students completing the final assessment.
-- 28. Students with multiple premium subscriptions?
-- 29. Assessments without any submissions?
-- 30. Students with the highest average rating for reviewed courses?



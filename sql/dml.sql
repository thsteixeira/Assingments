INSERT INTO students (name) VALUES 
  ('John Doe'), 
  ('Alice Smith'), 
  ('Bob Smith'), 
  ('Charlie Brown'), 
  ('Dora Brown'), 
  ('Eve White'), 
  ('Frank Black'), 
  ('Grace Black'), 
  ('Hank Green'), 
  ('Ivy Green');

INSERT INTO instructors(name, email) VALUES 
  ('Reza', 'reza@cctb.com'), 
  ('Washington', 'washington@cctb.com'), 
  ('Henry', 'henry@cctb.com'), 
  ('Jivesh', 'jivesh@cctb.com'), 
  ('Paul', 'paul@cctb.com'), 
  ('Jhon', 'jhon@cctb.com'),
  ('Pedro', 'pedro@cctb.com'),
  ('George', 'george@cctb.com'),
  ('Ryan', 'ryan@cctb.com'),
  ('Susan', 'susan@cctb.com');

insert into courses (instructor_id,title,category) values
  (1,'Introduction programming','Tech'),
  (2,'Introduction Bussiness','Bussiness'),
  (1,'Introduction CSS','Tech'),
  (3,'Arts I','Arts'),
  (3,'Arts II','Arts'),
  (4,'programming I','Tech'),
  (1,'Data modeling','Tech');
  (1,'No review 1','Tech'),
  (2,'No review 2','Bussiness');

INSERT INTO modules (course_id, title) VALUES
(1, 'Introduction to Programming'),
(1, 'Data Structures'),
(1, 'Algorithms'),
(2, 'Web Design Basics'),
(2, 'CSS Fundamentals'),
(2, 'JavaScript Essentials'),
(3, 'Database Design'),
(3, 'SQL Fundamentals'),
(3, 'Advanced SQL Queries'),
(4, 'Machine Learning Basics'),
(4, 'Neural Networks'),
(4, 'Deep Learning'),
(5, 'Digital Marketing Strategy'),
(5, 'Social Media Marketing'),
(5, 'SEO Techniques'),
(6, 'Financial Accounting'),
(6, 'Managerial Accounting'),
(6, 'Corporate Finance'),
(7, 'Project Management Fundamentals'),
(7, 'Agile Methodologies'),
( 7, 'Risk Management');

insert into reviews (student_id, course_id, rating, comment, review_date) values
  (1,1,5.0, 'The course is amazing good.', '2025-03-11'),
  (2,2,4.0, 'The course is good.', '2025-03-11'),
  (3,3,3.0, 'The course is OK.', '2025-03-11'),
  (4,4,2.0, 'The course sucks', '2025-03-11'),
  (5,5,1.0, 'The course is terrible.', '2025-03-11'),
  (6,6,3.0, 'The course is nice', '2025-03-11'),
  (7,7,1.0, 'I will never enroll this course.', '2025-03-11'),
  (8,1,4.5, 'Awesome', '2025-03-11'),
  (9,2,5.0, 'Amazing', '2025-03-11'),
  (10,3,2.5, 'Frustrating', '2025-03-11');

INSERT INTO enrollments(student_id, course_id, enrollment_date, last_login_date, active) VALUES
  ('1', '1', '2024-04-10', '2025-03-10', true),
  ('2', '3', '2024-07-08', '2025-03-10', true),
  ('3', '3', '2024-01-06', '2025-03-10', true),
  ('4', '2', '2024-08-01', '2025-03-10', true),
  ('5', '2', '2024-01-06', '2025-03-10', true),
  ('6', '7', '2024-08-01', '2025-03-10', true),
  ('7', '5', '2024-01-06', '2025-03-10', true),
  ('8', '4', '2024-08-01', '2025-01-06', false),
  ('9', '1', '2024-01-06', '2025-03-10', true),
  ('10', '5', '2024-08-01', '2025-03-10', true);

INSERT INTO subscriptions(student_id, type_of_subscription, start_date, end_date, expire_date) VALUES
  ('1', 'Free', '2024-04-10', '2024-07-30', Null),
  ('2', 'Free', '2024-04-10', '2024-07-30', Null),
  ('3', 'Free', '2024-04-10', '2024-07-30', Null),
  ('4', 'Free', '2024-04-10', '2025-07-30', Null),
  ('5', 'Free', '2024-04-10', '2025-07-30', Null),
  ('6', 'Free', '2024-04-10', '2025-07-30', Null),
  ('7', 'Premium', '2024-08-06', '2025-07-30', Null),
  ('8', 'Premium', '2024-08-06', '2025-07-30', Null),
  ('9', 'Premium', '2024-08-06', '2025-07-30', Null),
  ('10', 'Premium', '2024-08-06', '2026-07-30', Null);

INSERT INTO assessments (module_id, student_id, grade, expected_grade, deadline_date)
VALUES 
(1, 1, 85.5, 90.0, '2025-03-15'),
(2, 1, 78.0, 85.0, '2025-03-20'),
(3, 1, 92.5, 95.0, '2025-03-25'),
(1, 2, 88.0, 92.0, '2025-03-15'),
(2, 2, 76.5, 80.0, '2025-03-20'),
(3, 2, 95.0, 90.0, '2025-03-25'),
(4, 3, 82.0, 88.0, '2025-03-18'),
(5, 3, 79.5, 85.0, '2025-03-23'),
(6, 3, 91.0, 93.0, '2025-03-28'),
(4, 4, 87.5, 90.0, '2025-03-18'),
(5, 4, 81.0, 86.0, '2025-03-23'),
(6, 4, 93.5, 95.0, '2025-03-28');

INSERT INTO submissions (student_id, assessment_id, submission_date)
VALUES 
(1, 1, '2023-01-15'),
(1, 1, '2023-02-01'),
(1, 1, '2023-02-15'),
(1, 2, '2023-03-01'),
(1, 2, '2023-03-15'),
(2, 2, '2023-01-20'),
(2, 3, '2023-02-05'),
(2, 3, '2023-02-20'),
(2, 3, '2023-03-05'),
(2, 1, '2023-03-20'),
(3, 1, '2023-01-25'),
(3, 2, '2023-02-10'),
(3, 3, '2023-02-25'),
(3, 4, '2023-03-10'),
(3, 4, '2023-03-25');

INSERT INTO payment_records (student_id, enrollment_id, price, methods, payment_date)
VALUES 
(1, 1, 99.99, 'Credit Card', '2023-01-15'),
(2, 2, 149.99, 'PayPal', '2023-02-01'),
(3, 3, 79.99, 'Debit Card', '2023-02-14'),
(4, 4, 199.99, 'Bank Transfer', '2023-03-05'),
(5, 5, 129.99, 'Credit Card', '2023-03-20'),
(6, 6, 89.99, 'PayPal', '2023-04-02'),
(7, 7, 159.99, 'Credit Card', '2023-04-15'),
(8, 8, 109.99, 'Debit Card', '2023-05-01'),
(9, 9, 179.99, 'Bank Transfer', '2023-05-18'),
(10, 10, 139.99, 'Credit Card', '2023-06-03');
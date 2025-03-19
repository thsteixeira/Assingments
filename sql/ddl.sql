CREATE TABLE STUDENTS (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE INSTRUCTORS (
    instructor_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50)
);

CREATE TABLE COURSES (
    course_id SERIAL PRIMARY KEY,
    instructor_id INT REFERENCES INSTRUCTORS(instructor_id),
    title VARCHAR(50),
    category VARCHAR(50)
);

CREATE TABLE MODULES (
    module_id SERIAL PRIMARY KEY,
    course_id INT REFERENCES COURSES(course_id),
    title VARCHAR(50)
);

CREATE TABLE ASSESSMENTS (
    assessment_id SERIAL PRIMARY KEY,
    module_id INT REFERENCES MODULES(module_id),
    student_id INT REFERENCES STUDENTS(student_id),
    grade DECIMAL(10,2),
    expected_grade DECIMAL(10,2),
    deadline_date DATE
);

CREATE TABLE ENROLLMENTS (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES STUDENTS(student_id),
    course_id INT REFERENCES COURSES(course_id),
    enrollment_date DATE,
    last_login_date DATE,
    active BOOLEAN
);

CREATE TABLE SUBSCRIPTIONS (
    subscription_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES STUDENTS(student_id),
    enrollment_id INT REFERENCES ENROLLMENTS(enrollment_id),
    type_of_subscription VARCHAR(50),
    start_date DATE,
    end_date DATE,
    expire_date DATE
);

CREATE TABLE PAYMENT_RECORDS (
    payment_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES STUDENTS(student_id),
    enrollment_id INT REFERENCES ENROLLMENTS(enrollment_id),
    price DECIMAL(10,2),
    methods VARCHAR(50),
    payment_date DATE
);

CREATE TABLE REVIEWS (
    review_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES STUDENTS(student_id),
    course_id INT REFERENCES COURSES(course_id),
    rating DECIMAL(10,2),
    comment VARCHAR(50),
    review_date DATE
);

CREATE TABLE SUBMISSIONS (
    submission_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES STUDENTS(student_id),
    assessment_id INT REFERENCES ASSESSMENTS(assessment_id),
    submission_date DATE
);

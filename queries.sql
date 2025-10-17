SELECT * FROM students_raw
LIMIT 10;

SELECT DISTINCT race_ethnicity
FROM students_raw;

SELECT ROUND(AVG(math_score), 2) AS avg_math
FROM students_raw;

SELECT 
    ROUND(AVG(math_score), 2) AS avg_math,
    ROUND(AVG(reading_score), 2) AS avg_reading,
    ROUND(AVG(writing_score), 2) AS avg_writing
FROM students_raw;

SELECT 
    gender,
    ROUND(AVG(math_score), 2) AS avg_math,
    ROUND(AVG(reading_score), 2) AS avg_reading,
    ROUND(AVG(writing_score), 2) AS avg_writing
FROM students_raw
GROUP BY gender;

SELECT 
    race_ethnicity,
    ROUND(AVG(math_score), 2) AS avg_math
FROM students_raw
GROUP BY race_ethnicity
ORDER BY avg_math DESC;

SELECT 
    lunch,
    ROUND(AVG(math_score), 2) AS avg_math,
    ROUND(AVG(reading_score), 2) AS avg_reading,
    ROUND(AVG(writing_score), 2) AS avg_writing
FROM students_raw
GROUP BY lunch;


SELECT 
    test_preparation_course,
    ROUND(AVG(math_score), 2) AS avg_math,
    ROUND(AVG(reading_score), 2) AS avg_reading,
    ROUND(AVG(writing_score), 2) AS avg_writing
FROM students_raw
GROUP BY test_preparation_course;

SELECT *
FROM students_raw
WHERE math_score > 90 AND reading_score > 90 AND writing_score > 90
ORDER BY math_score DESC;

SELECT s1.gender, s1.math_score, s2.writing_score
FROM students_raw s1
JOIN students_raw s2 ON s1.gender = s2.gender
LIMIT 10;

-- 1. adds new student info to the public students table
INSERT INTO public."students"("first_name", "last_name", "username", "email")
VALUES ('Dan', 'Zanes', 'dzanes', 'dzanes@college.edu');

-- 2. updates the email of a particular student based on their id (primary key)
UPDATE public.students
SET email = 'jblair21@college.edu'
WHERE id = 1;

-- 3. combines the two name columns into a single column with heading "Name", followed by the email column with heading "Email", ordered alphabetically by last name 
SELECT concat(last_name, ',', ' ', first_name) "Name", email "Email"
FROM public.students
ORDER BY last_name ASC;

-- 4. selects all class names and grades for student Abe Horn, based on student id
SELECT name "Name of Class", grade "Grade"
FROM classes
INNER JOIN grades on classes.id=grades.class_id
INNER JOIN students on grades.student_id=students.id
WHERE students.id=3;

-- 5. deletes data for Joe Barnes from the students table, which first requires deletion from grades table based on student id
DELETE FROM public.grades
WHERE student_id = 4;

DELETE FROM public.students
WHERE id = 4;

-- 6. creates a list with full student name and grade received in Introduction to Computer Science based on class id
SELECT concat(first_name, ' ', last_name) "Full Name", grade "Grade"
FROM public.students
INNER JOIN public.grades ON students.id=grades.student_id
WHERE grades.class_id = 1;

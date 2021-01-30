-- SQL: Structured Query Language
---------------------------------------------------------
​
-- 1. GIVE ME ALL PATIENT NAMES
SELECT first_name, last_name FROM patients
-- SELECT column1, column2 FROM table_name
​
--2. GIVE ME ALL DOCTOR NAMES
SELECT first_name, last_name FROM doctors
​
--3. GIVE ME ALL YOU GOT ABOUT PATIENTS
SELECT * FROM patients
-- * means all the columns!
​
-- CONDITIONS --------------------------------------------
​
--4. GIVE ME ALL PATIENTS OF AGE 25
SELECT * FROM patients WHERE age = 25
-- SELECT * FROM table_name WHERE column_name = value
​
--5. GIVE ME ALL DOCTORS OF BRAIN SURGERY SPECIALTY
SELECT * FROM doctors WHERE specialty  = 'Brain Surgery'
​
--6. GIVE ME ALL SURGERY DOCTORS
SELECT * FROM doctors WHERE specialty LIKE "%Surgery%". -- > has the word Surgery somewhere in the string
SELECT * FROM doctors WHERE specialty LIKE "Surgery%". -- > has the word Surgery at the beginning of the string
SELECT * FROM doctors WHERE specialty LIKE "%Surgery". -- > has the word Surgery at the end of the string
SELECT * FROM doctors WHERE specialty LIKE "%SURGERY" COLLATE NOCASE -- > case sensitive
-- COLLATE NO CASE --> case sensitivity
​
--7. GIVE ME ALL BRAIN SURGERY DOCTORS NAMED IRINA
SELECT * FROM doctors WHERE specialty = "Brain Surgery" AND first_name = "Irina"
SELECT * FROM doctors WHERE specialty = "Brain Surgery" OR first_name = "Irina"
​
​
-- ORDER MY DATA --------------------------------------------
​
--8. GIVE ME ALL PATIENTS ORDERED BY AGE
SELECT * FROM patients ORDER BY age DESC LIMIT 3
-- SELECT column_name / * FROM table_name ORDER BY column_name ASC / DESC
​
​
-- COUNT MY DATA --------------------------------------------
​
--9. HOW MANY DOCTORS DO I HAVE?
SELECT COUNT(*) FROM doctors
​
​
--10. COUNT BRAIN SURGERY DOCTORS
SELECT COUNT(*) FROM doctors WHERE specialty = "Brain Surgery"
​
-- GROUP MY DATA, THEN COUNT IT --------------------------------------------
-- !!!!!!!
-- Count(*) will run on all the records and return 1 number
-- Count(*) with a GROUP BY will first group the data, then count the records in the groups
​
​
--11. COUNT ALL DOCTORS PER SPECIALTY
SELECT specialty, COUNT(*) FROM doctors GROUP BY specialty
​
​
--12. COUNT ALL DOCTORS PER SPECIALTY, ORDER BY SPECIALTY
SELECT specialty, COUNT(*) AS total FROM doctors
GROUP BY specialty
ORDER BY total DESC
​
-- USING 2 OR MORE TABLES AT ONCE --------------------------------------------
​
​
--13. GIVE ME ALL THE INHABITANTS FROM PARIS
SELECT * FROM inhabitants
JOIN cities ON cities.id  = inhabitants.city_id
WHERE cities.name  = "Paris"
​
--14.GIVE ME ALL THE ADULTS LIVING IN LISBON
SELECT * FROM inhabitants
JOIN cities ON cities.id = inhabitants.city_id
WHERE cities.name = "Lisbon"
AND inhabitants.age >= 18
​
-- 15.FOR EACH CONSULTATION, GIVE ME ITS DATE, PATIENT, DOCTOR NAMES AND DOCTOR SPECIALITY
​
SELECT consultations.created_at, patients.first_name, patients.last_name, doctors.first_name, doctors.last_name, doctors.specialty
FROM consultations consultations
JOIN doctors doctors on doctors.id = consultations.doctor_id
JOIN patients patients on patients.id = consultations.patient_id
ORDER BY consultations.created_at
​
-- SHORTHAND
​
SELECT c.created_at, p.first_name, p.last_name, d.first_name, d.last_name, d.specialty
FROM consultations c
JOIN doctors d on d.id = c.doctor_id
JOIN patients p on p.id = c.patient_id
ORDER BY c.created_at
​
​
-- SQL IN RUBY
​
def the_method(db)
  results = db.execute("SELECT * FROM doctors")
  # results in an Array (rows) of Array (columns)
  p results  # Inspect what you get back! Don't guess! --->   [[1, "Irina", "Popa", 33], [2, "Ellyn", "French", 28]]
end
​
​

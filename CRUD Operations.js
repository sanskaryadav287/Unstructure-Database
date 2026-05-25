\\Q1. Create a new database called student_management. 
**Query:- use student_management


\\Q2. Create a collection called students in the student_management database.
**Query:- db.createCollection("students")


\\Q3. Insert at least five student records into the students collection. Each record should have the following fields:
•	student_id (integer)
•	name (string)
•	age (integer)
•	department (string)
•	courses (array of strings)
•	grade (string)
**Query:- db.students.insertMany([
•	{student_id:101,name:"Alice",age:20,department:"Physics",courses:["Mechanics"],grade:"B"},
•	{student_id:102,name:"Bob",age:22,department:"Computer Science",
courses:["Database Systems","Algorithms"],grade:"A"},
•	{student_id:103,name:"Charlie",age:23,department:"Mathematics",courses:["Calculus"],grade:"C"},
•	{student_id:104,name:"Diana",age:21,department:"Computer Science",
courses:["Operating Systems"],grade:"A"},
•	{student_id:105,name:"Eve",age:19,department:"Biology",courses:["Genetics"],grade:"D"}
])
                          

\\Q4.  Query the Collections:
Write queries to perform the following tasks:

#(i). Retrieve all students who are in the “Computer Science” department.
**Query:- db.students.find({department:"Computer Science"})
                 
#(ii). Retrieve students who have an age greater than 21.
**Query:- db.students.find({age:{$gt:21}})
                
#(iii). Retrieve students who are taking the "Database Systems" course.
**Query:- db.students.find({courses:"Database Systems"})

#(iv). Retrieve students with a grade of "A".
**Query:- db.students.find({grade:"A"})
             

\\Q5. Update Documents:

#(i). Update the age of a student with student_id 101 to 21.
**Query:- db.students.updateOne({student_id:101},{$set:{age:21}})

#(ii). Add a new course, "Machine Learning", to the courses array for students in the "Computer Science" department.
**Query:- db.students.updateMany({department:"Computer Science"},{$push:{courses:"Machine Learning"}})


\\Q6. Delete Document:

#(i). Delete a student record with student_id 105.
**Query:- db.students.deleteOne({student_id:105})

#(ii). Delete all students who have a grade lower than "C".
**Query:- db.students.deleteMany({ grade: { $in: ["D", "F"] } })                         

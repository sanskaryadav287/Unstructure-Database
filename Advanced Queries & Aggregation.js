\\Q.1  Create a database named university and  a collection named students. Insert multiple student document      with field: name, age, department, and grades.
**Query-(i):- use university
**Query-(ii):- db.createCollection("students")
**Query-(iii):- db.students.insertMany([
                  {name:"Alica",age:20,department:"Computer Science", grades:{"math":85,"english":92}},     
                  {name:"Bob",age:21,department:"Physics",grades:{"math":88,"physic s":90}},
                  {name:"Charlie",age:22,department:"Mathematics",grades:{"math":95,"statistics":89}}])
                      

\\Q.2 Write a query to display all students who are in the Computer Science department.
**Query :- db.students.find({department:"Computer Science"})

                     
\\Q.3 Write a query to upadate the grades of a stdents named Alica by adding a new subject programming with a grade of 93. 
**Query:- db.students.updateOne({name:"Alica"},{$set:{"grades.programming":93}})
                   

\\Q.4  Write a query to increment the age of all students by 1.
**Query:- db.students.updateMany({},{$inc:{age:1}})

                   
\\Q.5 Write a query to delete all students who are 23 years old.
**Query:-  db.students.deleteMany({age:23})
                    

\\Q.6  Write a query to create an index on the name field of the students collection.
**Query:- db.students.createIndex({name:1})
                   

\\Q.7 Write an aggregation query to group students by their department and calculate the average age in each department.
**Query:-  db.students.aggregate([{$group:{"_id":"$department",average:{$avg:"$age"}}}])
                  

\\Q.8 Write a query to find all students who have scored more than 90 in any subject.
**Query:- db.students.find({$or:[{"grades.math":{$gt:90}},{"grades.english":{$gt:90}},{"grades.programming":
                  {$gt:90}},{"grades.physics":{$gt:90}}]})
            

\\Q.9 Write a query to add a new field graduated set to false for all students who are in the Mathematics department.
**Query:- db.students.updateMany({"grades.math":{$exists:true}},{$set:{"graduated":false}})
                   

\\Q.10 How can you retrieve only the name and department fields for all students, excluding the _id field?
**Query:- db.students.find({},{name:1,department:1,_id:0})
                  
                  




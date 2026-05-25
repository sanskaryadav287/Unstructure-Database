\\Que :- Database name: companyDB
**Query :-  db.employees.insertMany([
{emp_id:101,name:"Amit",department:"IT",skills:["Python","MongoDB","Docker"],projects:[{name:"HRMS",duration:6,technologies:["NodeJS","MongoDB"]}],salaries:[45000,48000,52000],certifications:["AWS","Azure"]},
{emp_id:102,name:"Neha",department:"HR",skills:["Communication","Recruitment"],projects:[{name:"HiringPortal",duration:4,technologies:["PHP","MySQL"]}],salaries:[35000,38000],certifications:["SHRM"]},
{emp_id:103,name:"Ravi",department:"Finance",skills:["Excel","Tally","SQL"],projects:[{name:"Accounting",duration:10,technologies:["SQL","PowerBI"]}],salaries:[40000,42000,46000],certifications:["CPA","CFA"]},
{emp_id:104,name:"Pooja",department:"IT",skills:["Java","Spring","MongoDB"],projects:[{name:"BankingApp",duration:12,technologies:["Java","MongoDB"]},{name:"CRM",duration:7,technologies:["Spring","MySQL"]}],salaries:[50000,54000,60000],certifications:["Oracle","AWS"]}])

                  
\\Que.1 :- Display all employees who have MongoDB skill.
Query :-  db.employees.find({skills:"MongoDB"})

                  
\\Que.2 :- Find employees having both Python and MongoDB skills.
Query :- db.employees.find({skills:{$all:["MongoDB","Python"]}})

                  
\\Que.3 :- Display employees with more than 2 skills.
Query :- db.employees.find({$expr:{$gt:[{$size:"$skills"},2]}})
                  

\\Que.4 :- Add a new skill "Kubernetes" to Amit.
Query :- db.employees.updateOne({name:"Amit"},{$push:{skills:"Kubernetes"}})

                 
\\Que.5 :- Add multiple skills to Pooja.
Query :- db.employees.updateOne({name:"Pooja"},{$addToSet:{skills:{$each:["AWS","Docker","Git"]}}})
                 

\\Que.6 :- Add a certification only if not already present.
Query :- db.employees.updateOne({name:"Neha"},{$addToSet:{certifications:"PHP"}})
                

\\Que.7 :- Remove "Docker" skill from Amit.
Query :- db.employees.updateOne({name:"Amit"},{$pull:{skills:"Docker"}})
                 

\\Que.8 :- Remove multiple salaries less than 45000
Query :- db.employees.updateMany({},{$pull:{salaries:{$lt:45000}}})
                 

\\Que.9 :- Find employees who worked on MongoDB projects
Query :- db.employees.find({"projects.technologies":"MongoDB"})

                  
\\Que.10 :- Use $elemMatch to find project duration > 6 using MongoDB
Query :- db.employees.find({projects:{$elemMatch:{duration:{$gt:6},technologies:"MongoDB"}}})

                  
\\Que.11 :- Count number of projects for each employee.
Query :- db.employees.aggregate([{$project:{_id:0,emp_id:1,name:1,Total_project:{$size:"$projects"}}}])

                  
\\Que.12 :- Unwind skills array.
Query :- db.employees.aggregate([{$unwind:"$skills"}])

                                 
\\Que.13 :- List unique skills across company.
Query :- db.employees.distinct("skills")

                  
\\Que.14 :- Find employees with salary greater than 50000.
Query :- db.employees.find({salaries:{$gt:50000}})
 
                  
\\Que.15 :- Find employees with exactly 2 certifications.
Query :- db.employees.find({certifications:{$size:2}})

                  
\\Que.16 :- Add new project to Ravi.
Query :- db.employees.updateOne({name:"Ravi"},{$push:{projects:{name:"TextBot",duration:5,technologies:["Excel","SQL"]}}})
                  

\\Que.17 :- Increase all salaries by 10% (array update).
Query :- db.employees.updateMany({},{$mul:{"salaries.$[]":1.1}})
                  

\\Que.18 :- Find highest salary of each employee.
Query :- db.employees.aggregate([{$project:{_id:0,emp_id:1,name:1,Highest_salary:{$max:"$salaries"}}}])

                  
\\Que.19 :- Find average salary of employees.
Query :- db.employees.aggregate([{$project:{_id:0,emp_id:1,name:1,Avg_salary:{$avg:"$salaries"}}}])

                  
\\Que.20 :- Filter projects longer than 6 months.
Query :- db.employees.aggregate([{$project:{_id:0,emp_id:1,name:1,LongTermProject:{$filter:{input:"$projects",
as:"project",cond:{$gt:["$$project.duration",6]}}}}}])

                  
\\Que.21 :- Find employees who have any of these skills: Java or Python.
Query :- db.employees.find({skills:{$in:["Java","Python"]}})


\\Que.22 :- Remove last salary entry.
Query :- db.employees.updateMany({},{$pop:{salaries:1}})


\\Que.23 :- Remove first salary entry.
Query :- db.employees.updateMany({},{$pop:{salaries:-1}})
                 

\\Que.24 :- Sort salaries array.
Query :- db.employees.aggregate([{$project:{name:1,sortedSalaries:{$sortArray:{ input:"$salaries",sortBy:1}}}}])

                  
\\Que.25 :- Limit salaries array to last 2 entries.
Query :- db.employees.aggregate([{$project:{name:1,lastTwoSalaries:{$slice:["$salaries",-2]}}}])

                  
\\Que.26 :- Find total salary paid to each employee.
Query :- db.employees.aggregate([{$project:{_id:0,emp_id:1,name:1,Total_salary:{$sum:["$salaries"]}}}])

                  
\\Que.27 :- Convert skills to uppercase.
Query :- db.employees.updateMany({},[{$set:{skills:{$map:{input:"$skills",as:"s",in:{$toUpper:"$$s"}}}}}])
                 

\\Que.28 :- Find employees with more than one project.
Query :- db.employees.find({$expr:{$gt:[{$size:"$projects"},1]}})

                  
\\Que.29 :- Count employees per skill.
Query :- db.employees.aggregate([{$unwind:"$skills"},{$group:{_id:"$skills",Total_emp:{$sum:1}}},{$sort:{Total_emp:-1}}])

                  
\\Que.30 :-  Find employees whose all projects use MongoDB.
Query :- db.employees.find({projects:{$not:{$elemMatch:{technologies:{$ne:"MongoDB"}}}}})
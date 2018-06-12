# Data Model
This documents introduce the data model of the project. In principle, there exist 6 data models **Course**, **Person**, **Thesis**, **Project**, **User**, and **Favourite**. Here, each one is specified with fields.
It should be noted that the only persisting models in the current implementation is **User**, and **Favourite**.
Since most of the fields are *String*, the fields are assumed to be string unless otherwise stated.
## Course
This model maintain the course information

| Field |
|-------|
| courseNumber |
| semesterCode |
| courseType   |
| title |
| objective |
| trachingContent |
| lectureNotes |
| examinationModalities |
| recommendation |
| precedingCourses(!) |
| weeklyHours |
| lecturers |
| instituteCode |
| instituteName |
| registration |
| language |

The corresponding rails command for this model is 
```
rails generate model Course courseNumber:string semesterCode:string courseType:string title:string objective:string teachingContent:string lectureNotes:string examinationModalities:string recommendation:string precedingCourses:integer weeklyHours:string lecturers:string instituteCode:string instituteName:string registration:string language:string 
```


## Person
*Person* model represents the information of person.

| Field |
|-------|
| firstname |
| lastname |
| gender  |
| preceding_titles |
| picture_uri |
| main_phone_number |
| main_email |
| consultation_hour_info |

The corresponding rails command for this model is 
```
rails generate model Person firstname:string lastname:string gender:string preceding_titles:string picture_uri:string main_phone_number:string main_email:string consultation_hour_info:string title:string
```

## Thesis
This model aim to maintain information about thesis.

| Field |
|-------|
| type |
| title |
| institue(!) |
| institueName(!) |
| facultyCode |
| keywords |
| language |
| advisor(prefix +  name + family + postfix) |
| facultyName |

The corresponding rails command for this model is 
```
rails generate model Thesis type:string title:string Institute:string InstituteName:string facultyCode:string keywords:string language:string advisor:string facultyName:string
```

## Projects
*Project* specifications are represented by this model.

| Field |
|-------|
| id |
| title |
| contractBegin |
| contractEnd |
| projectBegin |
| projectEnd |
| projectFrom |
| projectType |
| abstract |
| researchArea |
| institue |
| keywords |
| financier |
| funding |

The corresponding rails command for this model is 
```
rails generate model Project title:string contractBegin:string contractEnd:string projectBegin:string projectEnd:string projectFrom:string projectType:string abstract:string researchArea:string institute:string keywords:string financier:string funding:string
```
## Favourite
This model the id and title of the favourite items as well as their types.
| Field |
|-------|
| id |
| title |
| item_id |
|type |

```
rails generate model Favourite user_id:integer item_id:string title:string item_type:string
```


## User
Registered user information are maintained by *User* data model.

| Field |
|-------|
| id |
| username |
|name |
|family |
|email |

The corresponding rails command for this model is 
```
rails generate model User username:string name:string password:string email:string
```

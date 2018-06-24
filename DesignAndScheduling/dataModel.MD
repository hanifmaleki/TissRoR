# Data Model
This documents introduce the data model of the project. In principle, there exist 6 data models **Course**, **Person**, **Thesis**, **Project**, **User**, and **Favourite**. Here, each one is specified with fields.
It should be noted that the only persisting models in the current implementation is **User**, and **Favourite**.
Since most of the fields are *String*, the fields are assumed to be string unless otherwise stated.
## Course
This model maintain the course information

| Field |Type |
|-------|-------|
| id | integer |
| courseNumber | string |
| semesterCode | string |
| courseType   | string |
| title | string |
| objective | string |
| trachingContent | string |
| lectureNotes | string |
| examinationModalities | string |
| recommendation | string |
| precedingCourses | string |
| weeklyHours | string |
| lecturers | string |
| instituteCode | string |
| instituteName | string |
| registration | string |
| language | string |
| created_at | datetime |
| updated_at | datetime |

The corresponding rails command for this model is 
```
rails generate model Course courseNumber:string semesterCode:string courseType:string title:string objective:string teachingContent:string lectureNotes:string examinationModalities:string recommendation:string precedingCourses:integer weeklyHours:string lecturers:string instituteCode:string instituteName:string registration:string language:string 
```


## Person
*Person* model represents the information of person.

| Field | Type |
|-------|-------|
| id | integer |
| firstname | string |
| lastname | string |
| gender  | string |
| preceding_titles | string |
| picture_uri | string |
| main_phone_number | string |
| main_email | string |
| consultation_hour_info | string |
| created_at | datetime |
| updated_at | datetime |

The corresponding rails command for this model is 
```
rails generate model Person firstname:string lastname:string gender:string preceding_titles:string picture_uri:string main_phone_number:string main_email:string consultation_hour_info:string title:string
```

## Thesis
This model aim to maintain information about thesis.

| Field | Type |
|-------|------|
| id | integer |
| type | string |
| title | string |
| institue | string |
| institueName | string |
| facultyCode | string |
| keywords | string |
| language | string |
| advisor(prefix +  name + family + postfix) | string |
| facultyName | string |
| created_at | datetime |
| updated_at | datetime |

The corresponding rails command for this model is 
```
rails generate model Thesis type:string title:string Institute:string InstituteName:string facultyCode:string keywords:string language:string advisor:string facultyName:string
```

## Projects
*Project* specifications are represented by this model.

| Field | Type |
|-------|-------|
| id | integer |
| title | string |
| contractBegin | string |
| contractEnd | string |
| projectBegin | string |
| projectEnd | string |
| projectFrom | string |
| projectType | string |
| abstract | string |
| researchArea | string |
| institue | string |
| keywords | string |
| financier | string |
| funding | string |
| created_at | datetime |
| updated_at | datetime |

The corresponding rails command for this model is 
```
rails generate model Project title:string contractBegin:string contractEnd:string projectBegin:string projectEnd:string projectFrom:string projectType:string abstract:string researchArea:string institute:string keywords:string financier:string funding:string
```
## Favourite
This model the id and title of the favourite items as well as their types.

| Field | Type |
|-------|------|
| id | integer |
| title |string |
| item_id |string |
|type |string |
| created_at | datetime |
| updated_at | datetime |

It is worse considering that _item´_id_ is of type string. This is due the fact that identifier field in _Course_ model is of type string.

```
rails generate model Favourite user_id:integer item_id:string title:string item_type:string
```


## User
Registered user information are maintained by *User* data model.

| Field | Type | Validation |
|-------|-------|--------|
| id | integer |
| username | string | presence, 6<=length<=50 |
|name | string | presence, 6<=length<=50 |
|family | string | |
|email | string | presence, email format |
|password | string | password_digest |
| created_at | datetime | |
| updated_at | datetime | |

The corresponding rails command for this model is 
```
rails generate model User username:string name:string password:string email:string
```

## SearchRequest
Every user search request is captured and validate by this model

| Field | Type | Validation |
|-------|-------|-----------|
| id | integer | |
| expression | string | presence, 3<=length <=30 |
| type | string | |
| created_at | datetime | |
| updated_at | datetime | |
```
rails generate model SearchRequest expression:string type:string
```


# Data Model
This documents introduce the data model of the project. In principle, there exist 6 data models **Course**, **Person**, **Thesis**, **Project**, **User**, and **Session**. Here, each one is specified with fields.
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
| lecturers(!) |
| instituteCode |
| instituteName |
| registration |
| language |


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

## User
Registered user information are maintained by *User* data model.

| Field |
|-------|
| id |
| username |
|name |
|family |
|email |

## Session
Information about logged-in user is maintained by this mode.

| Field |
|-------|
| id |

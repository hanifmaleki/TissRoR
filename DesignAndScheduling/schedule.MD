# Roadmap and Scheduling
## Introduction
This document is the roadmap and schedule for the project. For more information about the project, definition refer to
## Schedule.
This document is updated periodically. The following table shows the steps needed to implement the project:

| Task                                                          | Expected Time |
|---------------------------------------------------------------|---------------|
| Study Ruby     |  2 days |
| Study Ruby on Rails      |  7 days |
| Prototyping  |   5 days |
| Define the repository, schedule and roadmap				    |1 day          |
|Design models								                    |1 day          |
|Design Views								                    |1 day          |
|Design Controllers							                    |1 day          |
|Create project, models							                |1 day          |
|Implement controllers 				        |2 days          |
|Implementation of user authentication and CRUDs of favorite lists	|2 days     |
|Implementation of views							                |2 days     |
|Applying appropriate style sheet					                |2 days     |
|**Total**								                            |**27 days**|
## Timesheet
Here is the project timeline shown. The following table shows the activities, dates, and duration.

 Date | Description | Time 
------|-------------|------
2018 - March   | Study Ruby | 2 days
April-May 2018 | Study Rails| 7 days
2018-May-13   	| Define the repository, schedule and road map	|	1 day
2018-May-14    | Prototyping(1) rest calling, routing, controllers | 2 Days
2018-May-15    |Desing first version of data model     | 0.5 day
2018-May-16 | Adding coresponding views 			| 0.5 Day
	    | Adding project, thesis, and person search methods | 

2018-May-17 | Design of controllers and modes				| 1 Day
2018-May-18 | Implementation of Application layouts			| 2 Days
2018-May-20 | Implementing Models 					| 0.5 Day
2018-May-20 | Constructing controllers					| 0.5 Day
2018-Jun-05 | Working on Bootstrap for styling				| 2 Days
2018-Jun-07 | Homepage implementation and Logo Desing			| 1 Day
2018-Jun-08 | Implementation of Helper classes EntityExtractor 		| 1 Day
	    | and TURestFactory						|
2018-Jun-09 | Implementation of action bodies in controllers		| 1 Day
	    | list, search, detail in 4 main controllers		|
	    | and add and remove in favourtie controllers		| 
2018-Jun-10 | Implementation of 4 detail views as well as 		| 1 Day
	    | Completing all other views 
2018-Jun-11 | Completing user management(signup- login - logout)	| 1 Day
2018-Jun-12 | Adding pagination						| 0.5 Day
2018-Jun-12 | Bug fixing, deplyment on Herku site			| 0.5 Day

### Study Ruby and Ruby on Rails
### Prototyping
### Data Model
The data model is available in [dataModel.MD](https://github.com/hanifmaleki/TissRoR/blob/master/DesignAndScheduling/schedule.MD)

### List of Views
The following is the list of views. (TODO: list of mock images):

#### Static-Page
1. home
2. about
3. contact

#### Project
1. search
2. list
3. detai

#### Thesis
1. search
2. list
3. detai

#### Course
1. search
2. list
3. detai

#### Person
1. search
2. list
3. detai

#### Favourites
1. Favourite theses
2. Favourite courses
3. Favourite people
4. Favourite projects

#### User
1. sign-up
2. (edit user)

#### Session
1. login

### Layouts
The application basically use two king of layouts. The **welcome**-layout for login and sign-up pages and **'application'**-layout for other pages. The welcome layer consist of the logo. The following layouts are necessary for the application-layout
1. header: consist of the top navigation bar 
2. second-nav-bar: consists of second navigation bar (for searchs and details page).
3. footer: consist of paging that is used in favorite and list pages.
4. detail-nav-bar: the navigation bar sepecific for detail pages consisting of add to/remove from favourite button.

### List of Controllers, Actions and Controller Helpers
There exist exactly one action for each view in the above list. Furthermore two helper class for calling **Restful web services** and extracting models(person, course, project, thesis) from XML file. Theses classes are called **TRRestFactory** and **EntityExtractor**.


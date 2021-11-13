# 2021-2022 Scheduler App Features

#### Table of Contents

1. [Retreive All Courses](#retrieve-all-courses)
2. [Search Course List by Keyword](#search-course-list-by-keyword)
3. [Filter Courses Based on Attributes](#filter-courses-based-on-attributes)
4. [Add Courses Into a Personal Schedule Pool](#add-courses-into-a-personal-schedule-pool)
5. [Put Courses in a Schedule, and Into a Schedule Position](#put-courses-in-a-schedule,-and-into-a-schedule-position)
6. [Return Conflict Warnings Based on Class Placement](#return-conflict-warnings-based-on-class-placement)
7. [Create a Sign Up for New Users](#create-a-sign-up-for-new-users)
8. [Counselor can Add Courses](#counselor-can-add-courses)
9. [Login Using Saved Accounts](#login-using-saved-accounts)
10. [Password Retrevial System](#password-retrevial-system)
11. [Ability to Export and Share Schedules](#ability-to-export-and-share-schedules)
12. [Class Availability & Tracking Class Spots](#class-availability-&-tracking-class-spots)
13. [Generate a Class Priority/Popularity List](#generate-a-class-priority/popularity-list)
14. [Update(Change/Remove) Existing Course From Pool](#update(change/remove)-existing-course-from-pool)
15. [Read a Selected Course Pool](#read-a-selected-course-pool)
16. [AutoFill Option for Incompleted Schedules](#autofill-option-for-incompleted-schedules)
17. [Generate a Randomized Schedule Based on Selected Course Pool](#generate-a-randomized-schedule-based-on-selected-course-pool)



## Retrieve All Courses 


### Functionality 
A list of all courses should be available for all users to see. The list of all courses should be stored within the database, and should be sent to the UI to display visually.  The scheduler app’s front page will include a list of all courses. Each course should include a name, course code, available class periods, and the level of the course. In an ideal setting, the list of courses should include all of the primary functionalities, and also include GPA level, teacher names, semester credits, and campus. The course list should be well coded, non-complex, easily alterable, and expandable.

### Design
* The HTTP method is GET for this feature
* There are no parameters required for invocation
* There is no body required in the invocation of this feature
* The status code would be "200 OK" if compiled properly
* The response returns a body which contains the JSON-formatted data for a list of all courses

### QA 
Expected Output: All offered courses are returned. Program should display a list of all classes that are offered by the school, including their given attributes. The given attributes returned with the course should include class subject and difficulty level (on-level, Pre-AP, AP, IB, DC). 
Ex. Course = Algebra II, Attributes = Pre-AP Level and Math Course



## Search Course List by Keyword


### Functionality
A search bar both at the top and the bottom of the page. The feature needs to atleast be able to display the matching course with the same exact course name. Ideally, the search bar should be able to update the page live, letter by letter, for instance, typing "A" would update the page to show every course that has the letter "A" and typing "r" after, creating "Ar" would show all the courses that have the string "Ar" in their course name, updating the page live. In addition, adding a dropdown autofill under the search bar, allowing the user to click on the available suggested searches. If a basic typo occurs, for instance the user wants to search the keyword "English" but searches up "English", would bring the user to a page that shows "Did you mean 'English'?"

### Design
* The HTTP method is GET for this feature with a filter to sort the desired class by keyword
* The parameter for this feature would be the keyword which would be used to sort through the lsit of classes which may match class names, attributes, or types of classes
* There is no body required in the invocation of this feature
* The status code would be "200 OK" if compiled properly
* The response returns a body which contains the JSON-formatted data for a specific list of courses that match the aforementioned keyword

### QA 
Expected Output: Program returns list of courses that match keywords
If user inputs keywords that that don’t match any courses or property names, return “no courses match search, please try again”



## Filter Courses Based on Attributes


### Functionality
Each course would be assigned specific attributes, some being the level of the course (AP, Pre-AP, On Level, Dual Credit, and IB), whether the class is double blocked or single blocked, a semester only class or a full year class, a class requiring tryouts (soccer, basketball, etc.), a class requiring applications (wings, pals, etc.), the campus (Main campus, Steam campus, Technical Campus, Lowery). Near the search bar, a list of these attributes should be available, allowing users to tick the boxes of the attributes, specifically searching courses with those specific attributes. If a user inputs a series of attributes that do not match a course, they willbe redirected to an error message.

### Design
* The HTTP method is GET which would use filter to sort the current list of classes by a set of avaliable attirbutes
* The parameters for this feature would be a list of different attributes that pertain to classes such as GPA level, teacher names, semester credits, campus availability, etc.
* There is no body required in the invocation of this feature
* The status code would be "200 OK" if compiled properly
* The response would contain a JSON-formatted list of classes that would be sorted by the aforementioned attribute in their parameter selection

### QA 
Expected Output: Program returns list of courses that match attributes
If user inputs invalid attributes, return “no courses match search, please try again”
	Ex. Course = Algebra II, Attributes = Pre-AP or on-level



## Add Courses Into a Personal Schedule Pool


### Functionality
All courses should be able to be selected and placed in a separate pool. If courses are double blocked, then when one course is selected, the other course will be automatically added to the course pool. Add parameters that demand that all courses should be added for both semesters,(the total # of courses in the pool should be even, otherwise send an error message).



### Design
* The HTTP method for this feature is PUT which the client would take a class from the list and add it to their personal schedule pool
* There are no required parameters for this feature
* The body for this feature would contain the name of the class so it can be sorted and added to the clients personal schedule pool
* The status code would be "200 OK" if compiled properly
* There would be no response for this feature

### QA 
Expected Output: Program has a add courses button respective to the personal schedule pool
If the user adds invalid courses, return “Course does not exist” 



## Put Courses in a Schedule, and Into a Schedule Position


### Functionality
When a course is selected, the possible periods it could be placed in should be displayed. Visual representation could be added. When a course is selected and is moving to be placed into the schedule, it should be impossible to add the course in a place that already has another course in that spot.


### Design
* The HTTP method for this feature is PUT which the client would take the specific class from their personal schedule pool and add it to a specific position on their schedule
* There are no required parameters for this feature
* The body for this feature would contain the name of the class in the personal schedule pool and the position the client wants the class to be in their schedule
* The status code would be "200 OK" if compiled properly
* The response would be the updated schedule with the new class in the new position in their schedule

### QA 
Expected Output: Course fits in schedule position
If the user inputs in an invalid position, return “Invalid position for course”
If there is a course already in that spot, replace it/swap positions


## Return Conflict Warnings Based on Class Placement


### Functionality
When a class is added in the scheduler app, conflict warnings of any issues, if any, should be displayed. Clearly noticeable pop-up errors messages should be visible to the user. These messages should contain concise but crucial information to inform the user of any issues. Said issues include if a class is not available in a particular period, if a class is double blocked (back to back periods) and overlaps with another class, if consecutive classes have STEAM center and Allen High School campus time constraints, if the user selects privilege periods that conflict with already selected courses, and if dual credit courses become incompatible as they conform to a Monday/Wednesday/Friday schedule rather than an A/B block schedule. The warning should contain the the name of the class or classes that have a conflict, the period of the class(es), and the name of any other classes that have a corresponding conflict.

### Design
* The HTTP method for this feature is GET with a filter to return conflict warnings based on the placement of courses in their personal schedule
* The required parameter for this feature would be requesting to view conflicts instead of placing more classes 
* There is no required body for invocation of this feature
* The status code would be "200 OK" if compiled properly
* The response would contain any potential errors or conflicts between course placement in a clients personal schedule

### QA 
Expected Output: Display a clear and concise warning/error message ONLY if there is a conflict in the schedule. The message should clearly describe the correct error.
Example: If user tries to schedule a high school class first period and steam class 2nd period, a warning message should pop up stating this specific conflict. 



## Create a Sign Up for New Users

### Functionality
A signup system should be available for new users. Either there will be a sign up system which utilzies username and passwords stored in a database to access a previously created schedule, or Google Sign In APIS are utilized. To signup a user will enter in a unique username,a password which must be 4 characters, and an email which links to their account. Each account created will be stored within the database, and measures must be made to prevent multiple users from being onthe same account at once. By creating a sign up for new users, users can access their schedules on any computer, and will be able to save changes on their schedule within the data base. In a perfect setting, this feature should utilize the linkage of already made google accounts for sign in. Google sign ins will simplify the account creation process for users, and allow for emails to be used for later features. At a minimum level, there some be some system in play which allows users to create an account via username and password, and this account stores their schedule data.

### Design
* The HTTP method for this feature is a POST which will assign a key being the ID or email and a value of a password.
* There is no required parameters for this feature.
* The body for this would include the input of a new email and an input of a new password in order to create a key value pair of the two.
* The status code would be "201 Created" when the pair is made.
* The response would be a new functioning account that can be accesed by any computer and provide any saved schedules.

### QA 
- Keys should be easily replicable. 
The same key should always generate the same schedule.
-Keys should not appear when you are inside a schedule
Expected Output: Display keys to manage the schedules. If no schedules exist, return “no existing schedule”. The message should clearly describe this error. 
If you want to select a certain student’s schedule there should be keys to categorize this type of student.



## Counselor can Add Courses


### Functionality
Instead of obtaining a list of all classes, and manually typing every single course, and all of its properties into the database, by creating an API, and interface, which can accept information through a series of multiple choice true and false answers, courses can be added from counselors who hold more knowledge about courses. By creating a way for counselors to add courses, it will allow for a constantly updatable database of all courses. A bare minimum requirement will be developers using a list of all courses and inputting all of the courses within the database. An ideal funcionality will include an application which allows counselors to communicate with the course database, and input their own courses. Even more so, there could be a program in place which can delete errorrously added classes, and duplicate classes that counselors might add.

### Design
* The HTTP method for this feature is POST where a counselor would invoke this API to add a new course to the master-list of courses
* The parameters required would be the name of the class and every single attribute all classes have which include but are not limited to GPA, teacher names, semester credits, campus avalability, etc.
* There is no required body for invocation of this feature
* The status code would be "201 Created" if the parameters required are met
* There would be no response for this feature

### QA 
Front end should be optimized to make scheduling for counselors easier.
Counselors and students should be notified of a successful course selection by the counselor.
Same QA regarding “Conflict Warnings Based on Class Placement” on the counselors end.


## Login Using Saved Accounts

### Functionality
After creating a new account, either through registering with a personally created account with a username and password, or through Google sign-ins which use google accounts to sign in, (all of which is TBD), a user should be able to login to their account in any device. At a bare minimum, users must be able to login into accounts on any device, and access their schedule data, which is saved from previous sessions, and multiple users should not be able to access the same account at the same time. Schedules will be linked to accounts, and as the user edits their schedule, their changes are saved within the database, so if a user logs off or decides to log in to another device, schedules will always represent their latest schedule. A high goal for this feature will utilize google logins, which after signing up and creating an account through Google, will allow users to log back into their account with one click on the google log in option. Ideally, all account login and sign in features should utilize already made Google Accounts.

### Design
*The HTTP method would be POST as you would be creating a session
*If we have the addition of courses from counselors through the same application, The parameters would be 'counselor' or 'student'. Otherwise, there wouldn't be any parameters
*The body would be a JSON formatted key-value pair including the email and the password -> {"ben-dover@student.allenisd.org": "password"}
*The status code would be "201 Created" on creation of session
*There would be no response
*Possible errors: "403 Forbidden" if wrong credentials, "429 Too Many Requests" if there are too many attempts to login in a given time

### QA
The expected output is a page where users can create an account or log in to an existing account with credentials and view their progress and saved schedules. This page should only display when first visiting the website. 

## Password Retrevial System

### Functionality
A password retrevial system will be a feature that allows users to create a new password if an old password is forgotten, or if a user decides to change their password. This feature will utilize the email linked to each account which was created during the sign-up/registration process. This feature will allow users to select an option in the login screen to "change their password" or "retrieve password", which will ask the user to put in their username. The username that the user will input will read off the database of all users, and will find the email address linked to that username and account. A program will automatically send an email to that email address, which includes a link to a box fill-in, where a user can input what they would like their new username to be. The high-end goal for this feature which would simplfy this process dramatically, will be that accounts are created using existing Google Accounts, which means all accounts will already be linked to their google email address, which makes password retrieval a lot easier. By using google accounts, the issue of invalid emails during account creation can be avoided, which means password retreivial emails will correctly send when a user requests for their password to be changed. A large issue with creating accounts independently and storing it within a database is valid email address. If a user accidentially puts in the wrong email address, then it will be impossible for a user to recover their password, so by using google accounts, if a user has password issues, then, they can go through Google's password retrevial process, which would most likely be more reliable. As a bare minimum requirement for this feature, users should be able to request a password change by inputting their unique username, and the password change request will be sent through the email that is linked to that unique username.


### Design
For this feature there are two different requests:

*The HTTP method would be PUT for the first one as you are attempting to change the password
*There would be no parameters
*The body would be JSON formatted with the email of the user -> {"email": "ben-dover@student.allenisd.org"}
*The status code would be "202 accepted" as the request has been received but not processed yet
*Possible errors: "403 Forbidden" if unmatching email input

The student should then receive an email, in this case it would be "ben-dover@student.allenisd.org", where the student would click on a link, with a token in the query tring, that would direct them to a form where they could input their new password.

*The HTTP method would be PUT for the second one as you are now updating the password
*There would be no parameters
*The request body would take the token, given in the query string of the link in the email, and the new password:
	{
		"token": "a;lsdkfja;lknd"
		"newPassword": "password"
	}
*the status code would be "200 OK"
*no response
*Possible errors: "400 Bad Request" if the newPassword is the same as the old password

### QA
THe expected output is a page allowing the user to request a new password if they have forgotten the current one. The password change will only be able to occur through a direct link sent to the user's email address. An error should pop-up if the new password is identical to the old password. A warning should pop up if the password does not meet expectations, for example if it is less than four characters long. Program should also display an error only if the inputted email does not match an existing account, otherwise it should send the password reset link to the specified email.

## Ability to Export and Share Schedules

### Functionality
This feature at a bare minimum will allow users to convert schedules (in anystate, completed, incompleted, even if there are still errors), into a PDF format. By converting schedules into a PDF format, it will allow users to download their schedule in PDF form, which will allow users to open their schedules in PDF readers (When converted into a PDF a schedule will be ONLY a visual representation of their courses and the order of their courses, a PDF schedule cannot be edited and saved to an account). By allowing users to download PDFs, they will be able to print out their schedules, or share the PDF through email,text or any file sharing application. An ideal goal for the feature, will allow users to not only convert their file into a PDF, but also a png, and should be able to create a link which starts a download of their schedule, either in PDF or png form. A shareable link can be sent to others instead of the actual file, which allow scheudles to be sent through applications which might only allow for texts and hyperlinks to be sent. 


### Design
Create a function that could convert the user's schedule and classes into different file types such as pdf or png.

Create a function that can convert a successfully created schedule into a link that can be used to access a schedule with different view or edit permissions designed by the user, similar to google docs share links.

*GET method to retrieve export types
*the parameters could be 'pdf', 'png', 'link'
*the body would be the courses in the user's schedule
*the status code would be "200 OK"
*the response would contain a body with the specified file type (JSON format if link)

Use the API endpoint to obtain the ready-to-export schedule

User can email, text, and send on various social media platforms, depending on the platform selected, the API endpoint will be called to get the file type/link and the desired platform application will open up to allow the user to send the schedule.

### QA

## Class Availability & Tracking Class Spots
Since users need an account to use the scheduling app, any schedules they make will create information stored within our databases. Through this, it can be deduced the number of students who are looking to enroll in a course at a certain period. On the scheduling app, the number of students that a class is limited to will be displayed, and a separate column denoting the number of students currently competing for that course is also shown  Ideally, some useful features include having information that displays to the user in a clear, color-coded format if a class is near empty, full, or excessively desired. 

### Functionality

### Design
* The HTTP method for this feature is GET 
* The required parameter for this feature would be selecting a specific course to check avalability for that course and to view the amount of spots
* There is no required body for invocation of this feature
* The status code would be "200 OK" if compiled properly
* The response would contain avalability for a class and the class spots avaliable in that course

### QA


## Generate a Class Priority/Popularity List

### Functionality
Through tracking course spots and availability, a schedule list with information regarding the popularity of each class is displayed to the user. Along with generating data about the number of users currently desiring a course, this feature also permits the list to be sorted by the popularity of a course. The attributes of each class should also be displayed on the list, such as the course's GPA, teacher, room number, and subject category. Some ideal features include a list of possible courses to replace ones a user currently has, as well as comparison features that allow the user to contrast their attributes.

### Design
Create a function that assigns priority points to classes based on course availability and spots.

Create a function that returns an ordered list based on priority points

*GET request method
*There are no parameters necessary
*There is no body necessary
*the status code would be "200 OK"
*the response would be a JSON formatted array of classes in order based on priority points

### QA


## Update(Change/Remove) Existing Course From Pool

### Functionality

### Design

### QA


## Read a Selected Course Pool

### Functionality

### Design

### QA



## Auto-Fill Option for Incompleted Schedules

### Functionality
An easily accessible button that allows students to place random classes into their missing schedule spots. In addition, the required core classes must be placed into the schedule prior to the autofill adding other elective classes. The button should allow the user to continousley keep autofilling and essentially "rolling", but a cooldown on the button would be necessary to limit the usage and overworking the server. At the very least, the function would make sure to fill in a student's schedule to have no missing gaps.

### Design

### QA


## Generate a Randomized Schedule Based on Selected Course Pool

### Functionality
Similarly to the Auto-fill, a student would enter a new "mode" that would allow them to select up to 8 courses, being able to add them and remove them. After the courses have been confirmed by the student, the function will create a random schedule with all of the selected courses. In addition, the randomizer would ensure to prevent any conflicts, such as privledge periods during lunch or no available classes. The randomizer, like the autof-fill, should prioritize filling in core classes over electives and off periods.

### Design

### QA



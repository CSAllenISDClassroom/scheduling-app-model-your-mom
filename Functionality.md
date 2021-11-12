# List of Features 


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
A search bar both at the top and the bottom of the page. The feature needs to atleast be able to display the matching course with the same exact course name. Ideally, the search bar should be able to update the page live, letter by letter, for instance, typing "A" would update the page to show every course that has the letter "A" and typing "r" after, creating "Ar" would show all the courses that have the string "Ar" in their course name, updating the page live. In addition, adding a dropdown autofill under the search bar, allowing the user to click on the available suggested searches. If a basic typo occurs, for instance the user wants to search the keyword "English" but searches up "Egnlish", would bring the user to a page that shows "Did you mean 'English'?"

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
When a user creates schedule using the app, an ID or Key should be generated for that specific schedule and stored within the database. These IDs will contribute to the product, as the ID will allow consumers to access their schedule on any computer, as long as they have the code. The ID or key will be a string of 12 randomly generated and unique characters that will represent a schedule. The id should be able to refer to a schedule, including the positions of each course, the personal course pool, and any other errors that still exist within that schedule. Basically, the ID should represent exactly what the user has completed. IDs will be generated at the end of the schedule creation. A bare minimum requirement of this functionality will include an 12 digit ID generated which includes a pool of all selected courses. An ideal functionality of this feature can include the positions of all the courses, a pool of all the courses, and a way for these ID to be shared. A striking issue of an ID might be that if multiple users work on one ID, the system will have to recognize this, and fork the ID to create an identical schedule so multiple users can use the same ID.

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

### Design
		Create a database where all the passwords and usenames are stored this could be in the orm of a dictionary because the dictionary woul have a work or the username and the password would be the definition. This 
makes it so that whenever a user types in ther login inormation the username can be found in the dictionary and the password entered can b compared to the password in the dicionary and i they are the same the user will be
given acees if no a incorrect password popup
### QA
The expected output is a page where users can create an account or log in to an existing account with credentials and view their progress and saved schedules. This page should only display when first visiting the website. 

## Password Retrevial System

### Functionality

### Design
Takes the email provided checks if its a valid entry in the dictionary if it is the same then it will oward it to a function which provides the necessay information about the link to go to a specific part o the website 
where the through a PUT function the password in the dictionary an be changed in correspndance to te email. 
### QA


## Ability to Export and Share Schedules

### Functionality

### Design
Design a way to onvert the file to a pdf or a custom file format this could allow for the user to import old schedules that they have already created or to share it in email form directly from the website or to save it as a pdf and to send to people. This could be through a pre existing library where the fuinctions nessecary could be aqcuired to properly convert the files.
### QA

## Class Availability & Tracking Class Spots
Since users need an account to use the scheduling app, any schedules they make will create information stored within our databases. Through this, it can be deduced the number of students who are looking to enroll in a course at a certain period. On the scheduling app, the number of students that a class is limited to will be displayed, and a separate column denoting the number of students competing for that course is also shown. 

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

### Design

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



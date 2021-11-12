
# List of Features 



## Retrieve a Course List


### Functionality 
A list of all courses should be available for all users to see. The list of all courses should be stored within the database, and should be sent to the UI to display visually.  The scheduler app’s front page will include a list of all courses. Each course should include a name, course code, available class periods, and the level of the course. In an ideal setting, the list of courses should include all of the primary functionalities, and also include GPA level, teacher names, semester credits, and campus. The course list should be well coded, non-complex, easily alterable, and expandable.

### Design
For this feature, the HTTP method is GET and there are no parameters or body necessary for invocation. The response would return a body that contains the JSON-formatted data for all of the courses and a HTTP 201 successfully created status code on completion. Some errors could occur if the request is unable to reach the server in the specified time.

### QA 



## Search Course List by Keyword


### Functionality
A search bar both at the top and the bottom of the page. The feature needs to atleast be able to display the matching course with the same exact course name. Ideally, the search bar should be able to update the page live, letter by letter, for instance, typing "A" would update the page to show every course that has the letter "A" and typing "r" after, creating "Ar" would show all the courses that have the string "Ar" in their course name, updating the page live. In addition, adding a dropdown autofill under the search bar, allowing the user to click on the available suggested searches. If a basic typo occurs, for instance the user wants to search the keyword "English" but searches up "Egnlish", would bring the user to a page that shows "Did you mean 'English'?"

### Design
For this feature, the HTTP method is GET which would use filter to sort the desired class by keyword. The parameter, being the keyword would sort through the list of classes based on the keyword which may match class names, class attributes, or types of classes. There would be no specific body in this request. The status code of the request will return "200 OK" if all parameters are met, regardless if there are any avaliable classes. The response would contain a JSON list of classes that contain matching names, attributes, or types of classes. 

### QA 



## Filter Courses Based on Attributes


### Functionality
Each course would be assigned specific attributes, some being the level of the course (AP, Pre-AP, On Level, Dual Credit, and IB), whether the class is double blocked or single blocked, a semester only class or a full year class, a class requiring tryouts (soccer, basketball, etc.), a class requiring applications (wings, pals, etc.), the campus (Main campus, Steam campus, Technical Campus, Lowery). Near the search bar, a list of these attributes should be available, allowing users to tick the boxes of the attributes, specifically searching courses with those specific attributes. If a user inputs a series of attributes that do not match a course, they willbe redirected to an error message.

### Design
For this feature, the HTTP method is GET which would use filter to sort the current list of classes by set of avaliable attributes. There are multiple possible parameters as the attributes of different classes varies, which could potentially be GPA level, teacher names, semester credits, which campus the class is avaliable on, etc. The status code of the request will return "200 OK" if all parameters are met. The response would contain a JSON list of classes that would sort the list of classes currently viewed by the client by a desired attributed through their parameter selection.

### QA 



## Add Courses Into a Personal Schedule Pool


### Functionality


### Design
Use a PUT HTTPS method to take class data from the master list of classes and add them to your own personnel list of classes this is used to make a schedule based on the classes in your personnel list. 



### QA 



## Put Courses in a Schedule, and Into a Schedule Position


### Functionality


### Design
  Use the PUT HTTP method to change or add a specific course(if it's allowed by checking whether the class is offered during that period into 
specific box which is chosen by a second parameter that is a number out of which allows you to select the speicific class period you want.

### QA 



## Return Conflict Warnings Based on Class Placement


### Functionality
When a class is added in the scheduler app, conflict warnings of any issues, if any, should be displayed. Clearly noticeable pop-up errors messages should be visible to the user. These messages should contain concise but crucial information to inform the user of any issues. Said issues include if a class is not available in a particular period, if a class is double blocked (back to back periods) and overlaps with another class, if consecutive classes have STEAM center and Allen High School campus time constraints, if the user selects privilege periods that conflict with already selected courses, and if dual credit courses become incompatible as they conform to a Monday/Wednesday/Friday schedule rather than an A/B block schedule. The warning should contain the the name of the class or classes that have a conflict, the period of the class(es), and the name of any other classes that have a corresponding conflict.



### Design
For this functionality the HTTP request would be GET with no peramiters a body consisting of the cources in JSON format. The response would give a body of the conflicts in JSON format and status code 200 OK.

### QA 



## Create a Key/ID Within the Database for Each Schedule Created

### Functionality
When a user creates schedule using the app, an ID or Key should be generator for that specific schedule and stored within the database. These IDs will contribute to the product, as the ID will allow consumers to access their schedule on any computer, as long as they have the code. The ID or key will be a string of 12 randomly generated and unique characters that will represent a schedule. The id should be able to refer to a schedule, including the positions of each course, the personal course pool, and any other errors that still exist within that schedule. Basically, the ID should represent exactly what the user has completed. IDs will be generated at the end of the schedule creation. A bare minimum requirement of this functionality will include an 12 digit ID generated which includes a pool of all selected courses. An ideal functionality of this feature can include the positions of all the courses, a pool of all the courses, and a way for these ID to be shared. A striking issue of an ID might be that if multiple users work on one ID, the system will have to recognize this, and fork the ID to create an identical schedule so multiple users can use the same ID.

### Design


### QA 



## Counselor can Add Classes


### Functionality
Instead of obtaining a list of all classes, and manually typing every single course, and all of its properties into the database, by creating an API, and interface, which can accept information through a series of multiple choice true and false answers, courses can be added from counselors who hold more knowledge about courses. By creating a way for counselors to add courses, it will allow for a constantly updatable database of all courses. A bare minimum requirement will be developers using a list of all courses and inputting all of the courses within the database. An ideal funcionality will include an application which allows counselors to communicate with the course database, and input their own courses. Even more so, there could be a program in place which can delete errorrously added classes, and duplicate classes that counselors might add.


### Design
For this feature,the HTTP method is POST where a counselor would invoke this API to add a new course to the master-course list. The parameters required would be the name of class and every single attribute all classes have which include but are not limited to GPA, teacher names, semester credits which campus the class is avaliable on etc. The status code would be "201 Created" if the parameters required are met. The response would be the name of the successfully created class as well as all parameters and attributes of the course.

### QA 

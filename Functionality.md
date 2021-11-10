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


### QA 



## Put Courses in a Schedule, and Into a Schedule Position


### Functionality


### Design


### QA 



## Return Conflict Warnings Based on Class Placement


### Functionality


### Design


### QA 



## Return Conflict Warnings Based on Class Placement


### Functionality


### Design


### QA 



## Pop-Up Error Messages Based on Conflicts


### Functionality


### Design


### QA 



## Create a Key/ID Within the Database for Each Schedule Created


### Functionality


### Design


### QA 



## Counselor can Add Classes


### Functionality


### Design


### QA 

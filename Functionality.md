
# List of Features 



## Retrieve a Course List


### Functionality 
A list of all courses should be available for all users to see. The list of all courses should be stored within the database, and should be sent to the UI to display visually.  The scheduler app’s front page will include a list of all courses. Each course should include a name, course code, available class periods, and the level of the course. In an ideal setting, the list of courses should include all of the primary functionalities, and also include GPA level, teacher names, semester credits, and campus. The course list should be well coded, non-complex, easily alterable, and expandable.

### Design
For this feature, the HTTP method is GET and there are no parameters or body necessary for invocation. The response would return a body that contains the JSON-formatted data for all of the courses and a HTTP 201 successfully created status code on completion. Some errors could occur if the request is unable to reach the server in the specified time.

### QA 



## Search Course List by Keyword


### Functionality


### Design
For this feature, the HTTP method is GET which would use filter to sort the desired class by keyword. The parameter, being the keyword would sort through the list of classes based on the keyword which may match class names, class attributes, or types of classes. There would be no specific body in this request. The status code of the request will return "200 OK" if all parameters are met, regardless if there are any avaliable classes. The response would contain a JSON list of classes that contain matching names, attributes, or types of classes. 

### QA 



## Filter Courses Based on Attributes


### Functionality


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

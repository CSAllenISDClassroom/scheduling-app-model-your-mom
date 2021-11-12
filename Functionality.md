
# List of Features 



## Retrieve a Course List


### Functionality 
A list of all courses should be available for all users to see. The list of all courses should be stored within the database, and should be sent to the UI to display visually.  The scheduler app’s front page will include a list of all courses. Each course should include a name, course code, available class periods, and the level of the course. In an ideal setting, the list of courses should include all of the primary functionalities, and also include GPA level, teacher names, semester credits, and campus. The course list should be well coded, non-complex, easily alterable, and expandable.

### Design
* The HTTP method is GET for this feature
* There are no parameters required for invocation
* There is no body required in the invocation of this feature
* The status code would be "200 OK" if compiled properly
* The response returns a body which contains the JSON-formatted data for a list of all courses

### QA 



## Search Course List by Keyword


### Functionality


### Design
* The HTTP method is GET for this feature with a filter to sort the desired class by keyword
* The parameter for this feature would be the keyword which would be used to sort through the lsit of classes which may match class names, attributes, or types of classes
* There is no body required in the invocation of this feature
* The status code would be "200 OK" if compiled properly
* The response returns a body which contains the JSON-formatted data for a specific list of courses that match the aforementioned keyword

### QA 



## Filter Courses Based on Attributes


### Functionality


### Design
* The HTTP method is GET which would use filter to sort the current list of classes by a set of avaliable attirbutes
* The parameters for this feature would be a list of different attributes that pertain to classes such as GPA level, teacher names, semester credits, campus availability, etc.
* There is no body required in the invocation of this feature
* The status code would be "200 OK" if compiled properly
* The response would contain a JSON-formatted list of classes that would be sorted by the aforementioned attribute in their parameter selection

### QA 



## Add Courses Into a Personal Schedule Pool


### Functionality


### Design
* The HTTP method for this feature is PUT which the client would take a class from the list and add it to their personal schedule pool
* There are no required parameters for this feature
* The body for this feature would contain the name of the class so it can be sorted and added to the clients personal schedule pool
* The status code would be "200 OK" if compiled properly
* There would be no response for this feature

### QA 



## Put Courses in a Schedule, and Into a Schedule Position


### Functionality


### Design
* The HTTP method for this feature is PUT which the client would take the specific class from their personal schedule pool and add it to a specific position on their schedule
* There are no required parameters for this feature
* The body for this feature would contain the name of the class in the personal schedule pool and the position the client wants the class to be in their schedule
* The status code would be "200 OK" if compiled properly
* The response would be the updated schedule with the new class in the new position in their schedule

### QA 



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



## Create a Key/ID Within the Database for Each Schedule Created


### Functionality


### Design


### QA 



## Counselor can Add Classes


### Functionality
* The HTTP method for this feature is POST where a counselor would invoke this API to add a new course to the master-list of courses
* The parameters required would be the name of the class and every single attribute all classes have which include but are not limited to GPA, teacher names, semester credits, campus avalability, etc.
* There is no required body for invocation of this feature
* The status code would be "201 Created" if the parameters required are met
* There would be no response for this feature

### Design


### QA 

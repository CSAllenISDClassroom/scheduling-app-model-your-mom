import Vapor
import Fluent
import FluentMySQLDriver


public class CoursesController {
    /// Retrieves Courses based on code
    ///
    /// * API Endpoint: /courses/{code}
    /// * Method: Get
    /// * Query parameters: None
    /// * Status codes:
    ///   * 200 Successful
    ///   * 400 Bad request
    ///   * 404 Not Found
    ///
    /// Returns ``Course``
    public func getCourseByCode(_ app: Application) throws {
        app.get ("courses", ":code") { req -> Course in
            guard let code = req.parameters.get("code", as: String.self) else {
                throw Abort(.badRequest)
            }
            
            guard let courseData = try await CourseData.query(on: req.db)
                    .filter(\.$id == code)
                    .first() else {
                throw Abort(.notFound)
            }

            return try Course(courseData)
        }
    }

    /// Retrieves paginated courses
    ///
    /// * API Endpoint: /courses
    /// * Method: Get
    /// * Query parameters: Optional(Course attributes)
    /// * Status codes:
    ///   * 200 Successful
    ///
    /// Returns ``Courses``    
    public func getPaginatedCourses(_ app: Application) throws{
        app.get("courses") { req -> Page<CourseData> in                                                      
            var coursesData = CourseData.query(on: req.db).filter(\.$semester == 1)
            print(type(of:coursesData))
            // var filters: [String:Any]
            
            // if let semester: Int = req.query["semester"]{
            //     guard (semester == 1) || (semester == 2) else{
            //         throw Abort(.badRequest, reason:"Invalid semester")
            //     }

            //     filters["semester"] = semester
            // }
            
            // if let location: String = req.query["location"]{
            //     guard (location == "AHS") || (location == "STEAM") || (location == "LFC") || (location == "CTC") else{
            //         throw Abort(.badRequest, reason:"Invalid location")
            //     }

            //     filters["location"] = location
            // }
            
            // if let level: String = req.query["level"]{
            //     guard level.count == 26 else{
            //         throw Abort(.badRequest, reason:"Invalid level")
            //     }

            //     filters["level"] = level
            // }                                  

            // QueryBuilder<CourseData>           
            
            return try await coursesData.paginate(for:req)
        }

    }

    // private func filterBySemester(courses:inout Page<Course>, semester:Int) -> Page<Course>{
        
    // }

    // private func filterByLocation(courses:inout Page<Course>, location:Int) -> Page<Course>{
        
    // }

    // private func filterByLevel(courses:inout Page<Course>, level:Int) -> Page<Course>{
        
    // }

}

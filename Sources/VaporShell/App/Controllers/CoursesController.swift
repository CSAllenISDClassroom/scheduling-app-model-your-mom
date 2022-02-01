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
    /// * Query parameters: None
    /// * Status codes:
    ///   * 200 Successful
    ///
    /// Returns ``Courses``    
    public func getPaginatedCourses(_ app: Application) throws{
        app.get("courses") { req -> Page<Course> in       
            let coursesData = try await CourseData.query(on: req.db)
              .paginate(for: req)
            
            let courses = try coursesData.map({
                                                  try Course($0)
                                              })
            return courses 
        }

    }


    public func getCategories(_ app: Application) throws {
        app.get("categories") { req -> [Category] in
            let categoryData = try await Category.query(on: req.db).all()
            return categoryData
        }
    }
    
}



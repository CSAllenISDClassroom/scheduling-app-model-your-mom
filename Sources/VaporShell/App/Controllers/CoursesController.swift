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
            var coursesData = CourseData.query(on: req.db)            
                       
            if let semester: Int = req.query["semester"]{
                guard (semester == 1) || (semester == 2) else{
                    throw Abort(.badRequest, reason:"Invalid semester")
                }
                coursesData.filter(\.$semester == semester)
            }
            
            if let location: String = req.query["location"]{
                guard (location == "AHS") || (location == "STEAM") || (location == "LFC") || (location == "CTC") else{
                    throw Abort(.badRequest, reason:"Invalid location")
                }
                print(location)
                coursesData.filter(\.$location == location)
            }
            
            if let level: String = req.query["level"]{
                guard level.count <= 26 else{
                    throw Abort(.badRequest, reason:"Invalid level")
                }
                print(level)
                coursesData.filter(\.$level == level)
            }                                  

            
            return try await coursesData.paginate(for:req)
        }

    }

    
    public func getCategories(_ app: Application) throws {
        app.get("categories") { req -> [Category] in
            let categoryData = try await Category.query(on: req.db).all()
            return categoryData
        }
    }

    public func getSubcategories(_ app: Application) throws {
        app.get("subcategories") { req -> [Subcategory] in
            let subcategoryData = try await Subcategory.query(on: req.db).all()
            return subcategoryData
        }
    }

}



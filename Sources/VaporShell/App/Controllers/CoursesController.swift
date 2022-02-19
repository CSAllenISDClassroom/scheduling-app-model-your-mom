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
        app.get ("courses", ":code") { req -> [Course] in
            guard let code = req.parameters.get("code", as: String.self),
                  code.count <= 5 else {
                throw Abort(.badRequest)
            }            
            return try await CourseData.query(on: req.db).filter(\.$id == code).all().map{Course($0)} 
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
        app.get("courses") { req -> Page<Course> in                                           
            let coursesData = CourseData.query(on: req.db)        //QueryBuilder<CourseData>
                       
            if let semester: Int = try? req.query.get(Int.self, at:"semester"){
                guard (semester == 1) || (semester == 2) else{
                    throw Abort(.badRequest, reason:"Invalid semester")
                }
                coursesData.filter(\.$semester == semester)
            }
            
            if let location: String = try? req.query.get(String.self, at:"location"){
                guard (location == "AHS") || (location == "STEAM") || (location == "LFC") || (location == "CTC") else{
                    throw Abort(.badRequest, reason:"Invalid location")
                }
                coursesData.filter(\.$location == location)
            }
            
            if let level: String = try? req.query.get(String.self, at:"level"){
                guard level.count <= 26 else{
                    throw Abort(.badRequest, reason:"Invalid level")
                }
                coursesData.filter(\.$level == level)
            }                                  

            func stringToPeriods(string:String) throws -> [[Int]]{
                let periodStrings = string.components(separatedBy:",")

                return try periodStrings.map{periodString -> [Int] in
                    if periodString.count <= 2,
                       let period: Int = Int(periodString),
                       period < 11{                        
                        return [period]
                    
                    } else if periodString.count <= 4 && periodString.count >= 3,
                              let firstPeriod: Int = Int(periodString.components(separatedBy:"-")[0]),
                              let lastPeriod: Int = Int(periodString.components(separatedBy:"-")[1]),
                              firstPeriod <= 9, lastPeriod <= 10,
                              (lastPeriod - firstPeriod) == 1 || (lastPeriod - firstPeriod) == 3{
                        return [firstPeriod, lastPeriod]

                    } else {
                        throw Abort(.badRequest, reason: "Invalid string input for periods; Correct Ex: \"1,2,3,4,5,4-7\"; Make sure there are no spaces and double blocked periods have a '-' in between and periods are valid numbers " )
                    }
            }
            }
            
            if let periodsString: String = try? req.query.get(String.self, at:"periods"){ // 2, 3, 4, 5-6

                let periods: [[Int]] = try stringToPeriods(string:periodsString)
                   
                // [[2], [3]]
                guard periods.count < 70,
                      periods.joined().filter( {$0 > 10 && $0 < 0} ).isEmpty else{
                    throw Abort(.badRequest, reason:"Invalid data in periods")
                }
                
                var courses = try await coursesData.all().map{Course($0)} //[Course]
                
                for periodArray in periods {
                    courses = courses.filter{ 
                        if let availabilityPeriods = $0.availabilityPeriods{                                       
                            return availabilityPeriods.contains(periodArray)
                        }
                        return false
                    }
                }
                
                let bitmaps = courses.map{ course -> Int in                    
                    return Course.toBitmap(periods:course.availabilityPeriods!)
                }
                                
                coursesData.filter(\.$periodBitmap ~~ bitmaps)
            }
                        
            return try await coursesData.paginate(for:req).map{Course($0)}
            
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

    public func getExceptionsPeriods(_ app: Application) throws {
        app.get("exceptions", "noPeriods") { req -> Page<Course> in
            let coursesData = try await (CourseData.query(on:req.db))
              .filter(\.$periodBitmap == nil)
              .paginate(for: req)

            let courses = coursesData.map{ Course($0) }

            return courses
        }
    }


    public func getExceptionsSubcategories(_ app: Application) throws {
        app.get("exceptions", "noSubcategories") { req -> Page<Course> in
            let coursesData = try await (CourseData.query(on:req.db))
              .filter(\.$subcategories == nil)
              .paginate(for: req)

            let courses = coursesData.map{ Course($0) }

            return courses
        }
    }


    public func getExceptionsLocation(_ app: Application) throws {
        app.get("exceptions", "noLocation") { req -> Page<Course> in
            let coursesData = try await (CourseData.query(on:req.db))
              .filter(\.$location == nil)
              .paginate(for: req)

            let courses = coursesData.map{ Course($0) }
        return courses
        }
    }

    public func getExceptionsCategories(_ app: Application) throws {
        app.get("exceptions", "noCategory") { req -> Page<Course> in
            let coursesData = try await (CourseData.query(on:req.db))
              .filter(\.$categories == nil)
              .paginate(for: req)

            let courses = coursesData.map{ Course($0) }

            return courses
        }
        }
        
    public func getExceptionsSemesterLength(_ app: Application) throws {
        app.get("exceptions", "noSemesterLength") { req -> Page<Course> in
            let coursesData = try await (CourseData.query(on:req.db))
              .filter(\.$semesterLength == nil)
              .paginate(for: req)

            let courses = coursesData.map{ Course($0) }

            return courses
        }
    }

    public func getExceptionsLevel(_ app: Application) throws {
        app.get("exceptions", "noLevel") { req -> Page<Course> in
            let coursesData = try await (CourseData.query(on:req.db))
              .filter(\.$location == nil)
              .paginate(for: req)

            let courses = coursesData.map{ Course($0) }

            return courses
        }
    }
    
}

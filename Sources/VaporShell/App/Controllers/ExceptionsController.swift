import Vapor
import Fluent
import FluentMySQLDriver

public class ExceptionsController {


    
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

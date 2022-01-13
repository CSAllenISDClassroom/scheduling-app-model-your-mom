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
    ///   * 200 Sucessful
    ///   * 400 Bad request
    ///   * 404 Not Foundation
    ///
    /// Returns ``Course``
    public func getCourseByCode(_ app: Application) throws {
        app.get ("courses", ":code") { req -> Course in
        guard let code = req.parameters.get("code", as: String.self) else {
            throw Abort(.badRequest)
        }
        
        guard let course = try await Course.query(on: req.db)
                .filter(\.$id == code)
                .first() else {
            throw Abort(.notFound)
        }
        return course

    }
    }
}

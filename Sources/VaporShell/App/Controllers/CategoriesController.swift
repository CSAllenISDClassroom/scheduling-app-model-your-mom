import Vapor
import Fluent
import FluentMySQLDriver

public class CategoriesController {
    /// Retrieves Categories table contents
    ///
    /// * API Endpoint: /categories
    /// * Method: Get
    /// * Query parameters: None
    /// * Status codes::
    ///   * 200 Successful
    ///
    /// Returns ''Categories''
    public func getCategories(_ app: Application) throws {
        app.get("categories") { req -> [Category] in
            return try await Category.query(on:req.db).all()
        }
    }

}

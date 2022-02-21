import Vapor
import Fluent
import FluentMySQLDriver

public class SubcategoriesController {
    /// Retrieves Subcategories table contents
    ///
    /// * API Endpoint: /subcategories
    /// * Method: Get
    /// * Query parameters: None
    /// * Status codes::
    ///   * 200 Successful
    ///
    /// Returns ''Subcategories''
    public func getSubcategories(_ app: Application) throws {
        app.get("subcategories") { req -> [Subcategory] in
            return try await Subcategory.query(on:req.db).all()
        }
    }
    
}

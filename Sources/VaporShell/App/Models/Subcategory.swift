import Vapor
import Fluent
import FluentMySQLDriver

final class Subcategory: Model, Content {

    static let schema = "Subcategories"

    @ID(custom: "ID", generatedBy: .database)
    var id: String?

    @Field(key: "categoryID")
    var categoryID : String?
    
    @Field(key: "name")
    var name : String?
    
    init() {}
    
}

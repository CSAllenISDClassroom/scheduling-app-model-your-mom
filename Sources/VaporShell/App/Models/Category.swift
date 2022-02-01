import Vapor
import Fluent
import FluentMySQLDriver



/*
 Category model to display category table in AHSSchedule data base
 */


final class Category: Model, Content {
    static let schema = "Categories"

    // Create fields for Categories


    @ID(custom: "ID", generatedBy: .database)
    var id : String?
    
    @Field(key: "name")
    var name: String?



    init() {}
}


                               

import Fluent
import FluentMySQLDriver


/*
 CourseData Class conforms to Model Type inorder to read a schema, and create fields to get data from the AHSSchedule Database
 */

final class CourseData: Model {
    // Name of the table or collection.
    static let schema = "Courses"

    // Unique identifier for this Course.
    @ID(custom: "courseCode")
    var id : String?

    @Field(key: "semesterLength")
    var semesterLength : String?

    @Field(key: "semester")
    var semester : Int?

    @Field(key: "shortDescription")
    var shortDescription : String?

    @Field(key: "description")
    var description : String?  
    
    @Field(key: "location")
    var location : String?
    
    @Field(key: "dualCreditDailySchedule")
    var dualCreditDailySchedule : String?
    
/*    @Field(key: "gradesHigh")
    var gradesHigh : Int? */

/*    @Field(key: "isApplication")
    var isApplication : Int */

    @Field(key: "periodBitmap")
    var periodBitmap : Int?

    @Field(key: "level")
    var level: String?

/*    @Field(key: "isOnLevel")
    var isOnLevel : Int 
    
    @Field(key: "isPreAP")
    var isPreAP : Int
    
    @Field(key: "isAP")
    var isAP : Int

    @Field(key: "isIB")
    var isIB : Int

    @Field(key: "isDualCredit")
    var isDualCredit : Int
    
 */
    
    // Creates a new, empty Employee.
    init() { }
}

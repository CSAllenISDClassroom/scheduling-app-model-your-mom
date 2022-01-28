/*
 VaporShell provides a minimal framework for starting Vapor projects.
 Copyright (C) 2021, 2022 CoderMerlin.com
 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.
 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

import Vapor
import Fluent
import FluentMySQLDriver

import Foundation

// UNCOMMENT-DATABASE to configure database example


// Create Course Levels to convert data into a string
enum CourseLevel: String, Codable{
    case onLevel
    case preAP
    case AP
    case IB
    case dualCredit
}

/*
 Struct Course which is type content to ensure object can be encoded and decoded from HTTP messages
 This struct will be converted to JSON when CourseData is mapped
 */
struct Course: Content{
    let courseCode : String?
    let shortDescription : String?
    let description : String?
    var semester : Int?
    let location : String?
    let semesterLength : String?
    let dualCreditDailySchedule : String?
    let level : String?
//    let isApplication : Bool    
//    let courseLevel : CourseLevel
    // Availability periods is in a 2d Array to accomodate double blocked periods
    var availabilityPeriods : [[Int]]
    
    init(_ courseData:CourseData) throws{        
        courseCode = courseData.id 
        description = courseData.description
        //        semester = try Course.semesterAsInteger(semester:courseData.semester!)
        semester = courseData.semester 
        location = courseData.location 
        semesterLength = courseData.semesterLength
        shortDescription = courseData.shortDescription 
//        isApplication = courseData.isApplication == 1 ? true : false               
//        courseLevel = Course.toCourseLevel(courseData:courseData)
        level = courseData.level
        dualCreditDailySchedule = courseData.dualCreditDailySchedule
        if let bitmap = courseData.periodBitmap{
            availabilityPeriods = Course.availabilityPeriods(bitmap:bitmap)
        } else {
            throw Abort(.badRequest)
        }
    }


    // Convert CourseData Courselevel values to human understandable strings


    
    private static func semesterAsInteger(semester:String) throws -> Int {
        guard semester.count == 2,
              semester.first == "S" else{
            throw Abort(.badRequest, reason:"Invalid semester input, S must be first character")
        }
        
        guard let semesterInteger = Int(String(semester.last!)) else {
            throw Abort(.badRequest, reason: "Invalid semester input, second char must be int")
        }

        return semesterInteger
    }

    // convert bitmap to integers in a 2d array
    
    private static func availabilityPeriods(bitmap: Int) -> [[Int]] {
        // Begin with an empty array
        var periods = [[Int]]()

        // Single Period: 0 ... 10 bits
        for bit in 0 ... 10 {
            if bitmap & (1 << bit) != 0 {
                let period = bit
                periods.append([period])
            }
        }
        
        // Double-blocked Vertical: 11 ... 20 bits
        // Represents period pairs: 0/1, 1/2, 2/3, etc.
        for bit in 11  ... 20 {
            if bitmap & (1 << bit) != 0 {
                let firstPeriod = bit - 11, secondPeriod = firstPeriod + 1
                periods.append([firstPeriod, secondPeriod])
            }
        }

        // Double-blocked Horizontal: 21 ... 23 bits
        // Represents period pairs: 2/5, 3/6, 4/7
        for bit in 21 ... 23{
            if bitmap & (1 << bit) != 0 {
                let firstPeriod = bit - 19, secondPeriod = firstPeriod + 3
                periods.append([firstPeriod, secondPeriod])
            }            
        }

        return periods
    }
}



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

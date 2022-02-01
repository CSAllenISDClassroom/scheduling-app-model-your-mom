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

import Foundation

// UNCOMMENT-DATABASE to configure database example

/*
 Struct Course which is type content to ensure object can be encoded and decoded from HTTP messages
 This struct will be converted to JSON when CourseData is mapped
 */
struct Course: Content{
    let courseCode : String?
    let description : String?
    var semester : Int?
    let location : String?
    let semesterLength : String?
    let dualCreditDailySchedule : String?
    let level : String?
    let categories : String?
    let subcategories : String?
    
//    let isApplication : Bool    
//    let courseLevel : CourseLevel

    // Availability periods is in a 2d Array to accomodate double blocked periods
    var availabilityPeriods : [[Int]]
    
    init(_ courseData:CourseData) throws{        
        courseCode = courseData.id 
        description = courseData.description
        semester = courseData.semester 
        location = courseData.location 
        semesterLength = courseData.semesterLength
//        isApplication = courseData.isApplication == 1 ? true : false               
//        courseLevel = Course.toCourseLevel(courseData:courseData)
        categories = courseData.categories
        subcategories = courseData.subcategories
        level = courseData.level
        dualCreditDailySchedule = courseData.dualCreditDailySchedule

        if let bitmap = courseData.periodBitmap{
            availabilityPeriods = Course.availabilityPeriods(bitmap:bitmap)
        } else {
            throw Abort(.internalServerError)
        }
    }

    subscript(key: String) -> Any? {
        let mirror = Mirror(reflecting: self)
        return mirror.children.first(where: {$0.label == key})?.value
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




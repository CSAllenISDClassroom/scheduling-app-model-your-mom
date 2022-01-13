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

// UNCOMMENT-DATABASE to configure database example
// Content conformance will ensure that the object can be encoded and decoded from HTTP messages.
final class Course: Model, Content {
    // Name of the table or collection.
    static let schema = "CourseSectionsView"

    // Unique identifier for this Employee.
    @ID(custom: "code", generatedBy: .database)
    var id: String?

    // Additional fields for this Employee.
    @Field(key: "description")
    var description: String?

    @Field(key: "semester")
    var semester: String?

    @Field(key: "locationName")
    var locationName: String

    @Field(key: "gradesLow")
    var gradesLow: Int?

    @Field(key: "gradesHigh")
    var gradesHigh: Int?

    @Field(key: "isApplication")
    var isApplication: Int

    @Field(key: "isOnLevel")
    var isOnLevel: Int
    
    @Field(key: "isPreAp")
    var isPreAp: Int
    
    @Field(key: "isAp")
    var isAp: Int

    @Field(key: "isIB")
    var isIB: Int

    @Field(key: "isDualCredit")
    var isDualCredit: Int

    @Field(key: "availabilityBitmap")
    var availabilityBitmap: Int

    // Creates a new, empty Employee.
    init() { }
}


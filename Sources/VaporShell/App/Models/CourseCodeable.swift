import Vapor
import Fluent

class CourseCodable: Codable {
    public var id:String?
    //public var courseCode:String
    public var description :String
    public var shortDescription:String
    public var semester: Int
    public var semesterLength: String
    public var location : String
        /*
              public var gradesLow:Int?
                   public var gradesHigh:Int?
                        public var creditsLow:Double?
                             public var creditsHigh:Double?
                                  public var isApplication:String?
                                       public var courseLevel:String?
                                            public var applicationCode:String?
         */
    public var periodsAvailable:[[Int]]





    public init(courseData:CourseData){
        func availabilityPeriods(bitmap:Int)->[[Int]]{
            //Begins with an empty array
            var periods = [[Int]]()

            // Handle all single-period cases (bits 0...10 )
            for bit in 0 ... 10{
                if bitmap & (1 << bit) != 0 {
                    let period = bit
                    periods.append([period])
                    // 1 is shifted over to the right by the bit number in the index
                }
            }

            // Handle all vertical, double blocked periods (bits 11 ... 20)
            // These bts map two period pairs e.g. 0/1, 1/2, 2/3, etc.
            for bit in 11 ... 20{
                if bitmap & (1 << bit) != 0{
                    let firstperiod = bit - 11
                    let secondperiod = firstperiod + 1

                    periods.append([firstperiod, secondperiod])
                }
            }
            return periods
        }

                /*
                          func getCourseLevel(courseData: courseData)->String?{

                                   if(courseData.isOnLevel){
                                            return "isOnLevel"
                                                     }else{if(courseData.isAP){
                                                              return "isAP"
                                                                       }
                                                                                else{if(courseData.isPreAP){
                                                                                         return "isPreAP"
                                                                                                  }
                                                                                                           else{if(courseData.isIB){
                                                                                                                    return "isIB"
                                                                                                                             }else{return courseData == nil}
                                                                                                                                      }
                                                                                                                                               }
                                                                                                                                                        }
                                                                                                                                                                 }
                 */

                /*
                          func sRemover(courseData: CourseData) -> Int{
                                   return courseData.semester == "S1" ? 1 : 2
                                            }
                 */
                /*
                          func isApplicationTrue(courseData: CourseData) -> String?{

                                   if(courseData.isApplication){
                                            return isApplication
                                                     }else{
                                                                     return courseData = ""
                                                                                     }
                                                                                                     }
                 */

        self.id = courseData.id
        //self.courseCode = courseData.courseCode
        self.description = courseData.description
        self.shortDescription = courseData.shortDescription
        self.location = courseData.location
                /*
                          self.gradesLow = courseData.gradesLow
                                   self.gradesHigh = courseData.gradesHigh
                                            self.creditsLow = courseData.creditsLow
                                                     self.creditsHigh = courseData.creditsHigh
                                                              self.isApplication = isApplicationTrue(courseData:CourseData)
                 */
        self.semester = courseData.semester
        self.semesterLength = courseData.semesterLength
        //  self.courseLevel = getCourseLevel(courseData:courseData)
        self.periodsAvailable = availabilityPeriods(bitmap:courseData.availabilityBitmap)
    }
}
   

//
//  Course.swift
//  Akmelha
//
//  Created by Danya T on 23/05/1444 AH.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class Course: Codable, Identifiable{
    
   @DocumentID var id : String?
    var courseName: String?
    var courseDesc: String?
    var courseLevel: String?
    var courseTeacher: String?
    var courseColor: String?
    var courseImage: String?
    var courseNumber: Int?
    var coureseStudents: [String]?
    
    init(courseName: String? = "", courseDesc: String? = "", courseTeacher: String? = "", courseColor: String? = "", courseImage: String? = "" , courseLevel :  String? = "", courseNumber: Int? = 0,   coureseStudents: [String]? = [""] ) {
        self.courseName = courseName
        self.courseDesc = courseDesc
        self.courseTeacher = courseTeacher
        self.courseColor = courseColor
        self.courseImage = courseImage
        self.courseLevel = courseLevel
        self.courseNumber = courseNumber
        self.coureseStudents = coureseStudents
    }
}

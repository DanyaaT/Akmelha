//
//  CourseTask.swift
//  Akmelha
//
//  Created by Danya T on 23/05/1444 AH.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class CourseTask: Codable, Identifiable{
    @DocumentID var id : String?
    static var counter: Int = 0
    
    var taskName: String?
    var taskDesc: String?
    var taskCourse: String?
    var taskDeadline: Date?
    var taskScore: Int?
    
    init( taskName: String? = "", taskDesc: String? = "", taskCourse: String? = "", taskDeadline: Date? = Date(), taskScore: Int? = 10) {
        self.taskName = taskName
        self.taskDesc = taskDesc
        self.taskCourse = taskCourse
        self.taskDeadline = taskDeadline
        self.taskScore = taskScore
 
     
        
    }
}

//
//  StudentOwnTask.swift
//  Akmelha
//
//  Created by Hadeel Mohammed on 03/06/1444 AH.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class StudentOwnTask: Codable, Identifiable{
    @DocumentID var id : String?
    
    var taskName: String?
    var taskDesc: String?
    var taskScore: Int?
    
    init( taskName: String? = "", taskDesc: String? = "", taskScore: Int? = 5) {
        self.taskName = taskName
        self.taskDesc = taskDesc
        self.taskScore = taskScore
 
     
        
    }
}


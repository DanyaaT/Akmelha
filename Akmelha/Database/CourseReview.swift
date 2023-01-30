//
//  CourseReview.swift
//  Akmelha
//
//  Created by Hadeel Mohammed on 03/06/1444 AH.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class CourseReview: Codable, Identifiable{
    @DocumentID var id : String?

    
    var reviewDesc: String?
    var reviewCourse: String?
    var reviewDate: Date?
    var reviewStudent: String?
    
    init( reviewDesc: String? = "", reviewCourse: String? = "", reviewDate: Date? = Date(), reviewStudent: String? = "") {
        self.reviewDesc = reviewDesc
        self.reviewCourse = reviewCourse
        self.reviewDate = reviewDate
        self.reviewStudent = reviewStudent
    }
}

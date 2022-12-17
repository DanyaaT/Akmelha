//
//  Event.swift
//  Akmelha
//
//  Created by Danya T on 23/05/1444 AH.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class Event: Codable, Identifiable{
   @DocumentID var id : String?
    var eventName: String?
    var eventDate: Date?
    var eventDesc: String?
    var eventCourse: String?
   
    init(eventName: String? = "", eventDate: Date? = Date(), eventDesc: String? = "", eventCourse: String? = "") {
        self.eventName = eventName
        self.eventDate = eventDate
        self.eventDesc = eventDesc
        self.eventCourse = eventCourse
    }
}

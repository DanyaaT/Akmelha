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
    var eventDate: Date
    var eventDesc: String?
    var eventCourse: String?
    var eventSection: String?
    
    var dateComponents: DateComponents {
        var dateComponents = Calendar.current.dateComponents(
            [.month,
             .day,
             .year],
            from: eventDate)
        dateComponents.timeZone = TimeZone.current
        dateComponents.calendar = Calendar(identifier: .islamicUmmAlQura)
        dateComponents.calendar?.locale = Locale(identifier: "ar_SA")

        return dateComponents
    }

   
    init(eventName: String? = "", eventDate: Date = Date(), eventDesc: String? = "", eventCourse: String? = "",eventSection: String? = "") {
        self.eventName = eventName
        self.eventDate = eventDate
        self.eventDesc = eventDesc
        self.eventCourse = eventCourse
        self.eventSection = eventSection
    }
}

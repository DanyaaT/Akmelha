//
//  Eventt.swift
//  Akmelha
//
//  Created by Hadeel Mohammed on 23/05/1444 AH.
//

import Foundation


struct Eventt: Identifiable {

    var date: Date
    var note: String
    var id: String
    var section : String
    var describtion : String
    var subject : String
    
    
    var dateComponents: DateComponents {
        var dateComponents = Calendar.current.dateComponents(
            [.month,
             .day,
             .year],
            from: date)
        dateComponents.timeZone = TimeZone.current
        dateComponents.calendar = Calendar(identifier: .islamicUmmAlQura)
        dateComponents.calendar?.locale = Locale(identifier: "ar_SA")

        return dateComponents
    }

    init(id: String = UUID().uuidString, date: Date, note: String ,section : String, describtion :String ,subject : String) {
        self.date = date
        self.note = note
        self.id = id
        self.section = section
        self.describtion = describtion
        self.subject = subject
    }
    static var sampleEvents: [Eventt] {
        return [
            Eventt(date: Date().diff(numDays: 0), note: "تسيليم واجب الرياضيات" ,section: "ثالث ابتدائي",describtion: "الحرص",subject: "رياضيات"),
            Eventt(date: Date().diff(numDays: 0), note: "تسيليم واجب الرياضيات" ,section: "ثالث ابتدائي",describtion: "الحرص",subject: "علوم"),
            Eventt(date: Date().diff(numDays:0), note: "تسيليم واجب الرياضيات" ,section: "ثالث ابتدائي",describtion: "الحرص",subject: "رياضيات"),
            Eventt(date: Date().diff(numDays: -2), note: "تسيليم واجب الرياضيات" ,section: "ثالث ابتدائي",describtion: "الحرص",subject: "رياضيات"),
            Eventt(date: Date().diff(numDays: -3), note: "تسيليم واجب الرياضيات" ,section: "ثالث ابتدائي",describtion: "الحرص",subject: "رياضيات"),
            Eventt(date: Date().diff(numDays: 6), note: "تسيليم واجب الرياضيات" ,section: "ثالث ابتدائي",describtion: "الحرص",subject: "رياضيات")
        ]
    }
}


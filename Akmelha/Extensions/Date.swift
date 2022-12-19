//
//  Date.swift
//  Akmelha
//
//  Created by Hadeel Mohammed on 23/05/1444 AH.
//


import Foundation

extension Date {
    
    
    var startOfDay: Date {
        Calendar(identifier: .islamicUmmAlQura).startOfDay(for: self)
        
    }
    func convertDate(dateFor : DateFormatter) {

        
        let hijriCalendar = Calendar.init(identifier: Calendar.Identifier.islamicUmmAlQura)
        dateFor.locale = Locale.init(identifier: "ar") // or "en" as you want to show numbers
        
        dateFor.calendar = hijriCalendar
        
        dateFor.dateFormat = "dd/MM/yyyy"
        print(dateFor.string(from: Date()))
    }
    
}

